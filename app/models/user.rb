class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :circles, dependent: :destroy
  has_many :circle_joins, class_name: "Join", dependent: :destroy
  has_many :host_circles, dependent: :destroy
  attachment :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum is_deleted: { 有効: false, 退会済み: true }
  enum gender: { 男性: 0, 女性:1 }

end
