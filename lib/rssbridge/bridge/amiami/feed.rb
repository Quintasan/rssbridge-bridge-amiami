require 'json'
require 'rssbridge'
require 'rss'

module Rssbridge
  module Bridge
    module Amiami
      class Feed
        include Cache

        def call(title, about, updated = Time.now.to_s, author, items)
          return fetch_from_cache if is_in_cache?

          feed = RSS::Maker.make("atom") do |m|
            m.channel.title = title
            m.channel.about = about
            m.channel.author = author
            m.channel.updated = updated


            items.each do |item|
              m.items.new_item do |i|
                i.title = item[:name]
                i.link = item[:url]
                i.updated = Time.now.to_s
              end
            end
          end

          xml = feed.to_s
          store_to_cache(xml)
          xml
        end

        private

        def is_in_cache?
          cache.exists("amiami") == 1
        end

        def fetch_from_cache
          cache.get("amiami")
        end

        def store_to_cache(value)
          cache.set("amiami", value)
          expire_key
        end

        def expire_key(timeout = 3600)
          cache.expire("amiami", timeout)
        end
      end
    end
  end
end
