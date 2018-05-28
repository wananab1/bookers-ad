class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  validates :name, presence: true, length:{ in: 2..20 }
  validates :intro, length:{ maximum: 50 }
  attachment :profile_image
  has_many :post_comments, dependent: :destroy

end
