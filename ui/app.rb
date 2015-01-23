require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'json'

db = SQLite3::Database.new File.join(Dir.home, '.git-graph', 'data')

get '/' do
  erb :index
end

get '/commits' do
  @commits = {}
  db.execute('select * from commits').each do |row|
    timestamp = Time.parse(row[2]).to_i
    if @commits[timestamp]
      @commits[timestamp] += 1
    else
      @commits[timestamp] = 1
    end
  end
  headers 'Content-Type' => 'application/json'
  JSON.generate(@commits)
end
