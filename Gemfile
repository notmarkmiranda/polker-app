source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.4"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "faker"
gem "font-awesome-sass", "~> 6.2.1"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "sassc-rails"
gem 'skeleton-rails', :git => 'https://github.com/helios-technologies/skeleton-rails'
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "pry"
  gem "standard"
  gem "rspec-rails"
  gem "webdrivers"
end

group :development do
  gem "web-console"
end

group :test do
  gem "shoulda-matchers", "~> 5.0"
end
