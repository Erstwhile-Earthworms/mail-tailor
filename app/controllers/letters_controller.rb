class  SendersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def index
    @senders = Sender.all
    @letters = Letter.all

    # RestClient.post "https://api:key-45353bea761148676ae6fbb927af15b5"\
    # "@api.mailgun.net/v2/sandbox471d5fcdac604d1baef1aac24fbe0849.mailgun.org/messages",
    # :from => "Mailgun Sandbox <postmaster@sandbox471d5fcdac604d1baef1aac24fbe0849.mailgun.org>",
    # :to => "Kyle Hogan <kylehogan1980@yahoo.com>",
    # :subject => "test2 fucker",
    # :text => "Congratulations Kyle Hogan, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."


  end

end
