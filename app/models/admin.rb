class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :circle_joins, class_name: "Join", dependent: :destroy
  has_many :joined_circles, source: "circle", through: :circle_joins
  #has_many :inquiries, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
end
