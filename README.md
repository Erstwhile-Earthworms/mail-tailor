#Mail Tailor
### A Ruby on Rails web app for signing up for and viewing promotional emails, built using TDD and the [SendGrid Parse Webhook API](https://sendgrid.com/docs/API_Reference/Webhooks/parse.html), deployed at http://www.mailtailor.net

![MailTailor FrontPage](https://raw.githubusercontent.com/Erstwhile-Earthworms/mail-tailor/master/app/assets/images/MailTailorFrontPageScreenshot.png)

##Getting started

After you clone this repository, be sure you have Postgresql installed.  Run the `rake db:create` command to initialize the dev database, then `rake db:migrate`.

In order to run tests, first run the `rake db:test:prepare` command and then `rake db:migrate`.

To add filler emails and users, run `rake db:populate`.  

##Scenario:  Bob signs up for MailTailor

When Bob signs up for MailTailor, he choose a "username" (in the app we save this in the `:mtname` field).  Bob chooses "Bob."  Now Bob can go to a website, say, Groupon.com, and sign up for promotional emails using bob@mailtailor.net.

Say Groupon sends bob@mailtailor.net a promotional email.  That email will go to SendGrid.  SendGrid will parse the email into a JSON object, then POST that object to a route in our MailTailor app (/email_processor).

Our app uses ThoughtBot's [Griddler](https://github.com/thoughtbot/griddler) gem deal with the POST from SendGrid.  A method called `process` is defined in the `email_processor.rb` file.  There the "recipient" of the email is identified by parsing the email field. In the case of "bob@mailtailor.net", the user is "bob."   Since "bob" is a user in our database, a new email is created and associated with bob.  Now when Bob logs in, he will see the email on his dashboard.

![MailTailor Dashboard](https://raw.githubusercontent.com/Erstwhile-Earthworms/mail-tailor/master/app/assets/images/MailTailorDashboardScreenshot.png)


##Todo

-  [X]  Create static welcome page

-  [X]  Create User model

-  [X]  Create signup flow

-  [X]  Create login sessions (sign in and sign out)

-  [X]  Deploy to Heroku

-  [X]  Protect User page so only logged in user can view it

-  [ ]  Add User API controller/routes so frontend javascript can pull directly from database without ERB local variables

-  [ ]  Add validators for `:mtname` field (must be unique, one word, no special characters that break email)

##The Team

-  [Ian Brown](www.linkedin.com/in/ianmichaelbrown/en):  Project Manager

-  [Kyle Hogan](https://github.com/kyle1980):  Developer

-  [Ricki Steiner](https://github.com/Rickisteiner):  Developer/Designer

-  [Collin Meyers](https://github.com/cfmeyers):  Developer

-  [Sean Gabay](http://www.linkedin.com/pub/sean-gabay/53/a35/2a1/en):  UX/UI





