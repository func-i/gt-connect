require 'rake'
require 'sinatra/activerecord/rake'
require 'dotenv/tasks'

require ::File.expand_path('../config/app', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

namespace :user do |args|
  desc "Creates user account with given credentials. (rake user:create)"

  task :create do
    user_attrs  = User.column_names.delete_if { |n| %w(created_at updated_at).include?(n) }
    user_params = Hash[user_attrs.map { |user_attr| [user_attr, ENV[user_attr]] }]
    User.create! user_params
    puts "User created: #{user.to_s}"
  end
end