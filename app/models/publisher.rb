class Publisher < ActiveRecord::Base
  attr_accessible :name
  has_many :magazines

  obfuscate_id

end
