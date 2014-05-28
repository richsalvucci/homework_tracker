class Homework < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :submissions
  has_many :comments, as: :commentable
end
