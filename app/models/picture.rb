class Picture < ActiveRecord::Base

	belongs_to :moment

	has_attached_file :picture,
					  :styles => {
					  		:medium => "250x250>",	
					  		:thumb  => "80x80>"
					  }

end
