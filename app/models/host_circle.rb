class HostCircle < ApplicationRecord
  belongs_to :user
  has_many :circle_joins, class_name: "Join", dependent: :destroy
  has_many :joined_circles, source: "circle", through: :circle_joins
  #has_many :circles
  belongs_to :circle
  attachment :profile_image
end
