class Sender < ActiveRecord::Base

  has_many :letters, dependent: :destroy

end
