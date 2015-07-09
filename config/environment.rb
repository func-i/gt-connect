require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

require 'sinatra'
require 'sinatra/activerecord'

require 'dotenv'
Dotenv.load

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

configure do
  set :root, APP_ROOT.to_path
  set :server, :puma
end

configure :development, :test do
  require 'pry-byebug'
end

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Initialize!
require APP_ROOT.join('config', 'initializer')

# Load the router
require APP_ROOT.join('app', 'router')