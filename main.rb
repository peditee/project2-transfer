     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
also_reload 'db/data_access' if development?  
require 'pg'
require 'bcrypt'

require_relative 'public/db/data_access.rb'  

enable :sessions 




def logged_in?()
  if session[:user_id]
    true
  else 
    false
  end 
end


def current_user()
  find_user_by_id(session[:user_id])
end

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

delete '/posters/:id' do
  user = session[:user_id] 
  poster_id = find_poster_by_id(params['id'])['user_id'] 
  
  if user == poster_id
    delete_poster(params['id'].to_i)

    redirect 'poster_titles'
  else
    redirect '/'
  end
end

get '/posters/upload' do 
  erb :new;
end

post '/' do
  redirect '/' unless logged_in?
  create_poster(params['title'], params['presentation_url'], params['authors'], current_user['id'])
  

  redirect "/poster_titles"
end

post '/login' do

  user = find_user_by_email(params['email'])
  if BCrypt::Password.new(user['password_digest']).==(params['password'])   #assume says " BCrypt has user provided correct password?"
    session[:user_id] = user['id'] #logging the user in 
    redirect '/logged_in'
  else 
   erb :index
    
  end
end

delete '/logout' do
  #destory the session 
  session[:user_id] = nil 
  redirect '/'
end

get '/sign-up' do
  erb :sign_up

end

post '/create_profile' do
  first_name = params['first_name']
  surname = params['surname']
  email = params['email']
  password_digest = BCrypt::Password.create(params['password'])
    
  sql = "INSERT INTO users (first_name, surname, email, password_digest) VALUES ('#{first_name}', '#{surname}', '#{email}', '#{password_digest.to_s}');"
  run_sql(sql)

  user = find_user_by_email(email)
  
  session[:user_id] = user['id']
  redirect '/logged_in'
end