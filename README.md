#Mail Tailor

##Getting started

After you clone this repository, be sure you have Postgresql installed.  Run the `rake db:create` command to initialize the dev database.

In order to run tests, first run the `rake db:test:prepare` command and then `rake db:migrate`.

##Todo

-  [X]  Create static welcome page

-  [X]  Create User model

-  [X]  Create signup flow

-  [X]  Create login sessions (sign in and sign out)

-  [X]  Deploy to Heroku

-  [ ]  Protect User page so only logged in user can view it
