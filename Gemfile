source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

#easier date validations
gem "date_validator"
gem 'will_paginate', '~> 3.0'

#authentication
gem 'devise'
gem 'devise-encryptable'
gem 'devise-async' # to send emails in the background

#for role based access
gem 'cancan', '1.6.10'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'font-awesome-rails'
gem 'bootstrap-datepicker-rails'
gem 'sprockets', '2.11.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
#file attachments
gem "carrierwave"
gem "fog", "1.22.0"
# Using MiniMagick the ruby processes memory remains small and resize the image
gem "mini_magick"

gem "heroku", "~> 3.5.0"
gem "ransack"
gem "will_paginate-bootstrap"
#paging
gem 'kaminari'
gem 'kaminari-bootstrap', :git => "https://github.com/mcasimir/kaminari-bootstrap.git"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


group :development, :test do
  gem 'mailcatcher'
  gem 'faker'
  gem "factory_girl_rails"
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0.0.beta1'
  gem 'thin'
end

group :test do
  gem 'rspec'
  gem 'database_cleaner'
end
