     
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :index
end


def run_sql(sql)
  PG.connect(ENV['DATABASE_URL'] || {dbname: 'goodfoodhunting'})
  
  
  
  results = db.exec(sql)
  db.close 
  return results
end



