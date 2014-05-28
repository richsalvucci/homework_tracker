class Course < ActiveRecord::Base
  belongs_to :location
  has_many :homeworks
  has_many :join_tables
  has_many :users, through: :join_tables
end
