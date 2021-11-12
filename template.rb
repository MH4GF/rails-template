# frozen_string_literal: true

require "bundler"
require_relative "lib/actions"

extend Lib::Actions

template "Gemfile", force: true
copy_file ".gitignore", force: true unless options[:skip_git]
copy_file ".rubocop.yml"

application do
  '
    config.load_defaults 6.1
    config.api_only = true

    config.i18n.default_locale = :ja
    config.time_zone = "Asia/Tokyo"
    config.active_record.default_timezone = :local

    config.generators do |g|
      g.assets false
      g.helper false
      g.template_engine :slim
      g.test_framework :rspec,
                       fixtures: false,
                       view_specs: false,
                       controller_specs: false,
                       routing_specs: false,
                       request_specs: true
    end

  '.rstrip
end
#
# # i18n
# download "https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml", "config/locales/ja.yml"
#
# # local virtual host for development
# environment 'config.hosts << ".lvh.me"', env: "development"
#
# # devise for authentication
# Bundler.with_unbundled_env do
#   generate "devise:install"
# end
# environment "config.action_mailer.default_url_options = { host: '#{app_name}.lvh.me', port: 3000 }", env: "development"
# download "https://raw.githubusercontent.com/tigrish/devise-i18n/master/rails/locales/ja.yml", "config/locales/devise.ja.yml"
#
# # pundit for authorization
# Bundler.with_unbundled_env do
#   generate "pundit:install"
# end
#
# # annotate
# Bundler.with_unbundled_env do
#   generate "annotate:install"
# end
# copy_file "lib/tasks/auto_annotate_models.rake", force: true
#
# # draper as a decorator
# Bundler.with_unbundled_env do
#   generate "draper:install"
# end
#
# # setup letter_opener
# environment "config.action_mailer.perform_deliveries = true", env: "development"
# environment "config.action_mailer.delivery_method = :letter_opener", env: "development"
#
# # setup rack_dev_mark
# application "config.rack_dev_mark.theme = [:title, Rack::DevMark::Theme::GithubForkRibbon.new(position: 'left-bottom')]"
# application "config.rack_dev_mark.env = (ENV['STAGE'] || ENV['RAILS_ENV'])&.upcase"
# application "config.rack_dev_mark.enable = !Rails.env.production? || ENV['STAGE'] == 'staging'"
#
# # Rspec
# Bundler.with_unbundled_env do
#   generate "rspec:install"
# end
# uncomment "spec/rails_helper.rb", "Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }"
# copy_file "spec/support/factory_bot.rb"
# copy_file "spec/support/time_helpers.rb"
#
# # TODO: simpleCov
#
# # capistrano for deployment
# Bundler.with_unbundled_env do
#   run "bundle exec cap install"
# end
# copy_file "Capfile", force: true
#
# # rubocop
# Bundler.with_unbundled_env do
#   run "bundle exec rubocop -DES --safe-auto-correct --force-exclusion --fail-level E"
# end
#
# # binstub
# Bundler.with_unbundled_env do
#   run "bundle exec spring binstub --all"
# end
#
# unless options[:skip_git]
#   git add: "."
#   git commit: "-a -m 'init'"
# end
