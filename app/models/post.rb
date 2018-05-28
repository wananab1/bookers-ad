class Post < ApplicationRecord

	validates :title, presence: true
	validates :opinion, presence: true, length:{ maximum: 200 }
	belongs_to :user
	has_many :post_comments, dependent: :destroy

end
