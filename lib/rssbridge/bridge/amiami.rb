# frozen_string_literal: true

Bundler.setup(:default, :development)

require 'zeitwerk'
loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/amiami", namespace: Rssbridge::Bridge::Amiami)
loader.log!
loader.setup
