require_relative 'boot'

require 'rails/all'
require_relative '../lib/set_action_mailer_host'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Super
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.et_atos_api = ::Rails::Application::Configuration::Custom.new
    config.middleware.insert_before Rack::Sendfile, SetActionMailerHost
  end
end
