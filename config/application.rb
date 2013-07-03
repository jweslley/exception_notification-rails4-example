require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module ExceptionNotificationRails4Example
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # This code also can be added in an initializer file or just in the config/environments/production.rb file.
    config.middleware.use ExceptionNotification::Rack,
      :email => {
        :email_prefix => "[ExceptionNotificationRails4Example] ",
        :sender_address => %{"notifier" <sender@example.com>},
        :exception_recipients => %w{exceptions@example.com}
      }
  end
end
