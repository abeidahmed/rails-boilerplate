source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "bcrypt", "~> 3.1.7"
# gem "image_processing", "~> 1.2"
gem "jbuilder", "~> 2.7"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.4"
gem "redis", "~> 4.0"
gem "sass-rails", ">= 6"
gem "sidekiq", "~> 6.2", ">= 6.2.1"
gem "turbo-rails", "~> 0.7.3"
gem "warden", "~> 1.2", ">= 1.2.9"
gem "webpacker", "~> 5.0"

gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails", "~> 6.2"
end

group :development do
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "rubocop", "~> 1.15"
  gem "rubocop-rails", "~> 2.10", ">= 2.10.1"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "rails-controller-testing", "~> 1.0", ">= 1.0.5"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
