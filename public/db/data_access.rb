def run_sql(sql, params = [])
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'medical_conference_app'})
  results = db.exec_params(sql, params)
  db.close 
  return results
end

def find_user_by_email(email)
 
  results = run_sql('select * from users where email = $1;', [email])
  return results[0]
end

def find_user_by_id(id)
  results = run_sql('select * from users where id = $1;', [id])
  return results[0]
end

def find_poster_by_id(id)
  results = run_sql('select * from posters where id = $1;', [id])
  return results[0]
end

def all_posters()
  run_sql('select * from posters;')
end

def create_poster(title, presentation_url, authors, user_id)
sql = "insert into posters (title, presentation_url, authors, user_id) values ($1, $2, $3, $4);"
run_sql(sql, [title, presentation_url, authors, user_id])
end

def delete_poster(id)
 
  sql = 'DELETE FROM posters WHERE id = $1;'
  run_sql(sql, [id])
end

