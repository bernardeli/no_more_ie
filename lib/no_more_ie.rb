require "no_more_ie/version"
require "no_more_ie/configuration"
require "no_more_ie/rack"
require "no_more_ie/railtie" if defined?(Rails::Railtie)

module NoMoreIe
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= NoMoreIe::Configuration.new
    end
  end
end

