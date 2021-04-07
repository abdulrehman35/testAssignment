class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :Project_users
  has_many :projects, through: :Project_users

  # after_create :assign_default_role

  # def assign_default_role
  #   self.add_role(:dev) if self.roles.blank?
  # end

  #has_many :projects
  #has_many :tasks
end
