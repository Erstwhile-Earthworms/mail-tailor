class Letter < ActiveRecord::Base

  validates :user_id, presence: true
  validates :sender_id, presence: true
  default_scope -> {order('created_at DESC')}
  after_initialize :defaults

  belongs_to :sender
  belongs_to :user

  def defaults
    self.category ||= 'sale'
  end

end
