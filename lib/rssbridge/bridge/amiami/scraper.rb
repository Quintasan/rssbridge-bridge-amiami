module Rssbridge
  module Bridge
    module Amiami
      class Scraper
        include Rssbridge::Logger

        NEW_PREORDERS_URL = 'https://www.amiami.com/eng/search/list/?s_cate2=459&s_st_list_preorder_available=1'
        def call
          html = load_page(url: NEW_PREORDERS_URL)
          page = parse_body(html: html)
          items = get_items(page: page)
          items.each do |item|
            logger.debug "Figure found", name: item[:name], url: item[:url]
          end
        end

        private

        TIMEOUT = 30
        def load_page(url:)
          browser = Ferrum::Browser.new(timeout: TIMEOUT, window_size: [1920, 1080])
          browser.go_to(url)
          sleep TIMEOUT
          browser.network.wait_for_idle(timeout: TIMEOUT)
          browser.body
        end

        def parse_body(html:)
          Nokogiri::XML(html)
        end

        ITEMS_SELECTOR = 'li.newly-added-items__item.nomore'
        def get_items(page:, selector: ITEMS_SELECTOR)
          page.css(selector).map(&method(:parse_item))
        end

        ITEM_NAME_SELECTOR = 'p.newly-added-items__item__name'
        BASE_URL = 'https://amiami.com'
        def parse_item(item_node)
          link = item_node.children.find { |child| child.name == 'a' }['href']
          name = item_node.children.css(ITEM_NAME_SELECTOR).children.find { |child| child.name == 'text' }.text
          item = { name: name, url: "#{BASE_URL}#{link}" }

          item
        end
      end
    end
  end
end
