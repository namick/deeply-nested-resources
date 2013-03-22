class Magazine < ActiveRecord::Base
  attr_accessible :name
  belongs_to :publisher
  has_many :photos

  obfuscate_id

end
