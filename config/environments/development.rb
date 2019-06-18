Rails.application.configure do
  config.web_console.whitelisted_ips = '99.45.160.113'
  #config.web_console.whitelisted_ips = '204.102.49.90'
  config.web_console.whitelisted_ips = '99.45.160.113'
  config.web_console.whitelisted_ips = '204.102.49.90'
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false


  Rails.application.config.active_record.belongs_to_required_by_default = false
  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :test
  host = 'https://b77dbb0330b24dff92cc590200696e73.vfs.cloud9.us-east-2.amazonaws.com/'
  config.action_mailer.default_url_options = { host: host, protocol: 'https' }
  config.action_mailer.perform_caching = false
  ActionMailer::Base.delivery_method= :letter_opener

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
