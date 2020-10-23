CREATE DATABASE medical_conference_app;

\c medical_conference_app;

CREATE TABLE posters (
  id SERIAL PRIMARY KEY,
  title TEXT,
  presentation_url TEXT,
  authors TEXT
);


CREATE table users (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  surname TEXT,
  email TEXT,
  password_digest TEXT
);

-- test variable for insertiont to posters table
INSERT INTO posters (title, presentation_url, authors) VALUES ('Reasons for medical referral of gaza patients, 2015', 'https://i2.wp.com/www.un.org/unispal/wp-content/uploads/images/d455a120938dec7785257f7f00499e78_image0.GIF?resize=970%2C725&ssl=1', 'Mohamed Lafi, Walaa Ammar, Anita Vitulio, Nadia Al-Farra, Mahmoud Daher');

INSERT INTO posters (title, presentation_url, authors) VALUES ('An End-to-End Donor Repository System in an Academic Environment',  'https://www.vumc.org/chtn/sites/vumc.org.chtn/files/public_files/ILBC.png', 'Kerry Wiles');

  INSERT INTO posters (title, presentation_url, authors) VALUES ('Applying End-to-End Real World Process Infrastructure to Biobanking in the Academic Setting', 'https://www.vumc.org/chtn/sites/vumc.org.chtn/files/public_files/ISBER%20kerry.png', 'Kerry Wiles');