namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    User.delete_all
    Letter.delete_all
    Sender.delete_all
    user1 = User.create(name:'Collin Meyers', email:'cfmeyers@gmail.com', password:'123456', password_confirmation:'123456', mtname:'collin')
    user2 = User.create(name:'Kyle H', email:'kyle@kylemail.com', password:'123456', password_confirmation:'123456', mtname:'Kyle')
    sender1 = Sender.create(name:'Papa Johns')
    sender2 = Sender.create(name:'LinkedIn')
    sender3 = Sender.create(name:'Slack')
    sender4 = Sender.create(name:'CUNY')


    user1.letters.create!(sender: sender1, content:"Today through Sunday, March 22nd, get a Large Cheese Pizza for just $5.99 when you carryout.", title:"Deal from Papa John's")
    user1.letters.create!(sender: sender2,content:" Welcome to Job Seeker Premium!  Over the next few weeks, we'll be sending you emails to show you all the great features you get with Job Seeker Premium, share our favorite job search tips, and help you track your progress.  To get started, learn how to:", title:"Welcome to Job Seeker Premium")
    user1.letters.build(sender: sender3,content:"You're invited BusyBusyLabs has started using Slack. The administrator, logan, has invited you to join.", title:"Jimbo has invited you to join BusybusyLabs on Slack")

    user1.letters.create!(sender: sender4,content: "THE THURSDAY BRIEF - MARCH 12, 2015 CUNY Photo Challenge 
    Enter our monthly student photo competition by the 25th of every mouth and a chance to win an iPad! Check out February's winning image and capture your own compelling moment at CUNY. More »
    * * * * * *
    CUNY Lecture Series — Fighting for Justice
    In his powerful new memoir, Just Mercy: A Story of Justice and Redemption, Bryan Stevenson, founder of the Montgomery-based Equal Rights Initiative, reflects on his lifelong struggle to protect the rights of the disenfranchised at an event at Hunter College’s Roosevelt House. More »", title:"The Thursday Brief")

  end
end
