source 'https://rubygems.org'

gem 'rails', '3.2.7'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'jquery-rails'
gem 'twitter-bootstrap-rails'
gem "devise", ">= 2.1.2"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"
gem 'simple_form'
gem 'activeadmin'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "therubyracer", ">= 0.10.2", :platform => :ruby

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'sqlite3'
  gem 'hirb' # nice layout for activeRecords on the console use after  typing 'Hirb.enable'
  gem "rspec-rails", ">= 2.11.0"
  gem "factory_girl_rails", ">= 4.0.0"
  gem "hub", ">= 1.10.2", :require => nil
end

group :test do
  gem "capybara", ">= 1.1.2"
  gem "email_spec", ">= 1.2.1"
  #gem "cucumber-rails", ">= 1.3.0"
  gem "database_cleaner", ">= 0.8.0"
  gem "launchy", ">= 2.1.2"
end

group :production do
#  gem "thin", ">= 1.4.1"
  gem 'pg'
end

