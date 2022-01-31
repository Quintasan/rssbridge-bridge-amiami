# frozen_string_literal: true

Bundler.require(:default, :development)
loader = Zeitwerk::Loader.new
loader.tag = "rssbridge-bridge-amiami"
loader.inflector = Zeitwerk::GemInflector.new(__FILE__)
loader.push_dir(
  File.expand_path("#{__dir__}/../..")
)
if ENV['ENABLE_ZEITWERK_LOGGING']
  require 'tty-logger'
  logger = TTY::Logger.new
  loader.logger = ->(msg) {
    logger.log_at(:debug) do
      logger.debug(msg)
    end
  }
end
loader.setup

module Rssbridge
  module Bridge
    module Amiami
    end
  end
end

loader.eager_load
