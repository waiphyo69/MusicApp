class Track < ActiveRecord::Base
	validates :album_id, :track_type, :lyrics, presence: true

	belongs_to :album, class_name: 'Album', foreign_key: :album_id
end
