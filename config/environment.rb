ENV['SINATRA_ENV'] ||= "development" #hash ENV key SINATRA_ENV or if doesn't exist development  
# ENV['RAILS_ENV'] = ENV['SINATRA_ENV']

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

set :environment, ENV['SINATRA_ENV'].to_sym

database_config = {
  :development => {
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"  
  }
}
if ENV["SINATRA_ENV"] == "development"
  require_relative "../secrets"
end
# ActiveRecord::Base.establish_connection(development_database_config)
set :database, database_config

require './app/controllers/application_controller'
require_all 'app'

# https://www.youtube.com/watch?v=dQSsFYwSudM start @ 28:00