require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BaseballScore
  class Application < Rails::Application
    config.load_defaults 6.0
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '**', '*.{rb,yml}').to_s]
    config.i18n.fallbacks = [I18n.default_locale]

    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Credentials' => 'true',
      'Access-Control-Allow-Origin' => ENV['ROOT_URL'],
      'Access-Control-Request-Method' => '*'
    }
  end
end
