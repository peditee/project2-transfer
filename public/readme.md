


keys

Titles and internal titles
Introduction - the project's aim
Technologies
Launch

optional

Table of contents
Illustrations
Scope of functionalities 
Examples of use
Project status 
Sources
Other information
 


A Medical Conference App




Project Aim

There are over 9 million doctors worldwide and over 18 million nurses. Conventionally a key area of their research activity involves sharing their posters at conferences. It allows them to update one another on cutting edge developments and formulate new ideas and working groups. In the era of transmissable disease lockdowns these conferences are no longer possible and a new device is needed to host research posters.
This web app provides that functionality

Technologies 

HTML 
CSS
Ruby
SQL postgres 

Development


I wrote a series of wireframes for the outline of the project 
https://whimsical.com/P2JorE7sbXV39xeB6r73S5

I creates a series of HTML tags to begin development

I worked from a main.rb pathway system to direct the functionality of my app 

Once I had an app which could upload posters and display I decided to add a user profile function

I created a database with two tables one for research posters and one for user profiles 

I added a login profile to engage in the app which allows user-speicic uploads and user-specific deletes - only the profile which uploaded can delete the corresponding posters

I secured the app against SQL injection attacks

I utilised the BCrypt hashing function to produced encrypted passwords. 


Problems 

Fixed Problems 

-styling - layout issues were resolved with the grid function in CSS

-careful debugging was conducted through PRY in the ruby code throughout

-altered the database table for posters to add a user_id datapoint so that each table logs which user by ID and therefore can delete specifically by user_id


Lessons and Challeneges

much time was spent attmepting to get heroku commits correct - 

each new feauture I attempted to add came with inherent bugs needing worked out- taking the time early to work these through on the micro level



Further Development

-ideally I would like to take this app to a place where we store the PDF file instead of a URL storage. 
-our next step will be expanding the use of this app for doctors/healthcare workers to store their research online allowing accessibility by search engines and a handily generated URL for application to their CV instead of a current poorly optimised 'small-size' jpeg or PDF print out. 


