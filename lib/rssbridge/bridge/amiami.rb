# frozen_string_literal: true

Bundler.require(:default, :development)

loader = Zeitwerk::Loader.for_gem
loader.log!
loader.setup
