configure :development do
  require 'sqlite3'
  require 'pry-byebug'
  require 'tux'
  
  ActiveRecord::Base.logger = Logger.new(STDOUT)

  set :database, 'sqlite3:github_trello_dev.db'
  set :show_exceptions, true
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/github_trello')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end