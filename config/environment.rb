# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

RailsBoilerplate::Application.default_url_options = \
  RailsBoilerplate::Application.config.action_mailer.default_url_options
