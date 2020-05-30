class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :circles, dependent: :destroy
  has_many :circle_joins, class_name: "Join", dependent: :destroy
  has_many :joined_circles, source: "circle", through: :circle_joins
  has_many :host_circles, dependent: :destroy
  attachment :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 入力設定
  validates :nickname, length: 1..20
  validates :email, presence: true
  validates :profile_image, presence: true
  validates :age, presence: true
  validates :gender, presence: true

  enum gender: { 男性: 0, 女性:1 }
end
