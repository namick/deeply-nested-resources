class Photo < ActiveRecord::Base
  attr_accessible :name
  belongs_to :magazine

  obfuscate_id

end
