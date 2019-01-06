source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'


gem 'rails', '~> 5.2.2'

# gem 'sqlite3'
# Use Puma as the app server
gem 'pg', '~> 1.1', '>= 1.1.3'
gem 'puma', '~> 3.11'
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jwt', '~> 2.1'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.8', '>= 3.8.1'
  gem 'faker', '~> 1.9', '>= 1.9.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  gem 'database_cleaner', '~> 1.7'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
