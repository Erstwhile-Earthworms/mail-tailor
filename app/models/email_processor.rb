class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process

    user_name = @email.to[0][:token]
    user = User.find_by(mtname:user_name)

    if user
      sender_host_name = @email.from[:host]
      sender = Sender.find_by_name(sender_host_name) || Sender.create(name: sender_host_name, display_name: parse_display_name(sender_host_name) )
      Letter.create!({ content: @email.body, sender:sender, user:user, raw_html:@email.raw_html})
    end

  end

  def parse_display_name(host_name)
    if host_name.include? '.'
      return host_name.split('.')[0].capitalize
    end
    host_name
  end

end
