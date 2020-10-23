     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'pg'



get '/' do
  erb :index
end

# if login successful go to pathway /logged_in

get '/logged_in' do
  erb :welcome
end

get '/poster_titles' do
  # pull titles from database 
  db = PG.connect(dbname: 'medical_conference_app')
  results = db.exec("SELECT id, title FROM posters;")
  db.close
  
  counter = 0 
 
 title_id_array = []

  while counter < results.count

    title_id_array.push(results[counter])
    counter += 1
  end
  erb :poster_titles, locals: { titles: title_id_array}

end


