class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process

    # just to see if it reacts
    # Letter.create(title: "Something happened",  sender_id: 1, content:
    # "<h1>An email hit the server</h1>")

    # trying to create sender info in a table
    @user = User.find_by(name: @email.from[:email].split("@")[0])
    if @user
      @sender = Sender.find_by(name: @email.from[:token] , url: @email.from[:host])
        if @sender == nil
          @sender = Sender.create({name: @email.from[:token] , url: @email.from[:host]})
        end
      Letter.create!({ content: @email.body, sender_id: @sender.id, title: @email.subject })
    end

  end
end





#
#
# class EmailProcessor
#
#   def self.process(email)
#     Letter.create(title: "Be cool!",  sender_id: 2, content:
#     "<h1>An email hit the server</h1>")
#
#     Letter.create!({ content: email.body, sender: email.from })
#
#   end
#
# end
