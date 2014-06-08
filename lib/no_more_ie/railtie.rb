# Rails 3.x support

require "no_more_ie"
require "rails"

module NoMoreIe
  class Railtie < Rails::Railtie
    initializer "no_more_ie.use_rack_middleware" do |app|
      app.config.middleware.use "NoMoreIe::Rack"
    end
  end
end
