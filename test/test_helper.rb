ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
    include CookiesHelper
    include SessionHelper
    include ResponseHelper

    parallelize(workers: :number_of_processors)
  end
end

module ActionMailer
  class TestCase
    include Rails.application.routes.url_helpers
  end
end
