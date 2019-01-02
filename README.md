# README

Documentation on setting up this application.

This application is being set up using iTerm2 as the terminal and Atom as the
editor.

01. $ gem install rails
02. $ rails new voter-tool --database=postgresql --skip-turbolinks --skip-test-unit --skip-active-storage
03. $ cd voter-tool
04. $ gem install pry-rails
    $ gem install geokit
    $ gem install geokit-rails
    $ gem install dotenv
    $ gem install dotenv-rails

05. Edit 'Gemfile' by adding:

    gem 'pry-rails', group: [:development, :test]
    gem 'dotenv', '~> 2.5'
    gem 'dotenv-rails', group: [:development, :test]
    gem 'geokit'
    gem 'geokit-rails'

06. $ bundle install
07. $ rails g geokit_rails:install

08. Edit 'config/initiallizers/geokit_config.rb' with the following.

    8.1  Copy the call to the Google geocode, uncomment out the new line
         and replace the '' with a value.  Should look like:

    Geokit::Geocoders::GoogleGeocoder.api_key = ENV["GOOGLE_API_KEY"]

    8.2  Edit the 'provider_order' by adding :google to the array.
         Should look like this:

    Geokit::Geocoders::provider_order = [:google]

    8.3  Edit the 'request_time'.  Replace the '3' with '60'.
         Should look like this:

    Geokit::Geocoders::request_timeout = 60

09. Add a '.env' file at the root of the project and add the following:

    GOOGLE_API_KEY="<your private key here>"

10. Edit '.gitignore' by adding '.env' under

      Ignore master key for decrypting credentials and more.

11. $ bundle
12. $ bundle exec rake db:create
13. $ bundle exec rails generate migration create_voters
14. $ bundle exec rake db:migrate && bundle exec rake db:rollback && bundle exec rake db:migrate

