class User < ApplicationRecord
	extend FriendlyId
  	friendly_id :name, use: :slugged
	belongs_to :category

	has_attached_file :image, styles: { large: "1000x1000#", medium: "550x550#", thumb: "150x150#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
