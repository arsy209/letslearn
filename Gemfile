source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'figaro'
gem 'redis'
gem 'omniauth-facebook'
gem 'bcrypt', '~> 3.1.7'

gem 'autoprefixer-rails'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'simple_form'
gem 'bootstrap-datepicker-rails'
gem 'social-share-button'

gem "geocoder"
gem "gmaps4rails"
gem 'carrierwave', '~> 0.11.2'
gem 'cloudinary'
gem 'money-rails'
gem 'stripe'
gem 'twilio-ruby'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
