class Album < ActiveRecord::Base
	validates :title,:band_id, presence: true

	belongs_to :band
	has_many :recordings, class_name: 'Track', foreign_key: :album_id
end
