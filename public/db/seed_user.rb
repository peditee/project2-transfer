require 'bcrypt'
require 'pg'

require_relative 'data_access.rb'   #note we are inside the folder db so we don't need to say db/ before data access
# not building a web app here so no need for sinatra 
first_name = 'peter'
surname = 'okeeffe'
email = 'pt@ga.co'
password_digest = BCrypt::Password.create('pudding') #give me a password I'll give you a password _digest 



sql = "INSERT INTO users (email, password_digest) VALUES ('#{email}', '#{password_digest.to_s}');" #note that ruby already calls a to_s for data in interpolated curly brackets 

run_sql(sql)