     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
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
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'medical_conference_app'})
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

get '/poster_details/:id' do
  
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'medical_conference_app'})
  results = db.exec("SELECT * FROM posters WHERE id= '#{params['id']}';")
  db.close

  erb :poster_details, locals: { posters: results[0] }
end

get '/posters/upload' do 
  erb :new;
end

post '/' do
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'medical_conference_app'})
  db.exec("insert into posters (title, presentation_url, authors) values ('#{params["title"]}', '#{params["presentation_url"]}', '#{params["authors"]}');")
  db.close

  redirect "/"
end


