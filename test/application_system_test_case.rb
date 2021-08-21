require "test_helper"

Capybara.configure do |config|
  config.always_include_port = true
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome do |option|
    option.add_argument "no-sandbox"
  end
end
