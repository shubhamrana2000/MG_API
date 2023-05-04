require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MGApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # Rails.application.config.hosts <<"https://17f4-2401-4900-1c74-fb9a-fa0a-ae5-765c-d20b.ngrok-free.app"
    # Rails.application.config.hosts << "xxxxxxx-xxxxxxx.c9users.io"
    

  end
end