class Group < ApplicationRecord

  has_many :group_user
  has_many :user, through: :group_user

  has_one_attached :image
end
