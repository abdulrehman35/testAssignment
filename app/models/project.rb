class Project < ApplicationRecord
  has_many :project_users
  has_many :users, through: :project_users, dependent: :destroy
  has_many :tasks, dependent: :destroy

  belongs_to :creator, class_name: "User"

  validates :title, presence: true
  # belongs_to :customer
end
