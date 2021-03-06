source 'https://rubygems.org'

gem 'rails', '3.2.13'

# -- Servers --
gem 'airbrake' # Exception handling

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

# -- Databases --
gem 'pg', '~> 0.15.0'
gem 'acts_as_paranoid'

# -- Frontend --
gem 'jquery-rails', '~> 2.2.1'
gem 'therubyracer', platforms: :ruby

# -- Tools --
gem 'twitter'
gem 'figaro'

# -- Ruby/Rails Console --
group :test, :development do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-nav'
  gem 'pry'
end

# -- Development --
group :development do
  gem 'rails_best_practices'
  gem 'annotate', git: 'git://github.com/ctran/annotate_models.git'
end

# -- Testing --
group :development, :test do
  gem 'rspec-rails', '~> 2.13.0'
  gem 'factory_girl_rails', '~> 4.2.1'
  gem 'database_cleaner', '~> 1.0.1'
  gem 'faker'
end
