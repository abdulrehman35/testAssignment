class Project < ApplicationRecord
  has_many :Project_users
  has_many :users, through: :Project_users

  belongs_to :creator, class_name: "User"

  # belongs_to :customer
end
