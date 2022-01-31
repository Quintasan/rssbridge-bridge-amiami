# frozen_string_literal: true

Bundler.require(:default, :development)
loader = Zeitwerk::Loader.new
loader.tag = "rssbridge-bridge-amiami"
loader.inflector = Zeitwerk::GemInflector.new(__FILE__)
loader.push_dir(
  File.expand_path("#{__dir__}/../..")
)
loader.log! if ENV['ENABLE_ZEITWERK_LOGGING']
loader.setup

module Rssbridge
  module Bridge
    module Amiami
    end
  end
end
