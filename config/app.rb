require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

require 'sinatra'
require 'sinatra/activerecord'

require 'trello'

require 'dotenv'
Dotenv.load

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

configure do
  set :root, APP_ROOT.to_path
  set :server, :puma

  def autoload_tree(paths)
    sorted_paths = paths.sort_by! { |a| a.include?('.rb') ? 0 : 1 }
    sorted_paths.each do |file_path|
      if file_path.include?('.rb')
        file_name = File.basename(file_path).gsub('.rb', '')
        autoload(ActiveSupport::Inflector.camelize(file_name), file_path) 
      end
    end
  end

  # http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  # extended by CAN
  def autoload_app_tree(dir_names)
    dir_names.each do |dir_name|
      paths = Dir[APP_ROOT.join('app', dir_name, '*')]
      autoload_tree paths
    end
  end

  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  autoload_app_tree ['models', 'services']
end

require APP_ROOT.join('config', 'environment')
require APP_ROOT.join('config', 'initializer')
require APP_ROOT.join('app', 'router')