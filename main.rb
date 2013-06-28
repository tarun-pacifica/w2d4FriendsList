require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
#require 'json'
#require 'httparty'
require 'pg'

get '/' do
  erb :home
end

get '/faq' do
  erb :faq
end

get '/about' do
  erb :about
end

post '/add' do
@name = params[:name]
@description = params[:description]
@interests = params[:interests]
@age = params[:age]
@gender = params[:gender]

  #stores this information locally in our database
sql = "INSERT INTO friends (name, description, interests, age, gender)
      VALUES ('#{@name}', '#{@description}',
      '#{@interests}', '#{@age}',
      '#{@gender}')"

#binding.pry

  conn = PG.connect(:dbname => 'friendlist', :host => 'localhost', :user => 'fb', :password => 'password')
  conn.exec(sql)
  conn.close

  erb :add
end


get '/friendlist' do
  query = "SELECT name, description, interests, age, gender FROM friends"

  conn = PG.connect(:dbname => 'friendlist', :host => 'localhost', :user => 'fb', :password => 'password')
  @rows = conn.exec(query)
  conn.close

  #binding.pry
  erb :friendlist
end