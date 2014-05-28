class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :send_user_email

  def send_user_email
    # UserMailer.new_user_email(self).deliver
  end

  has_many :homeworks
  has_many :submissions
  has_many :comments, as: :commentable
  has_many :join_tables
  has_many :courses, through: :join_tables
end
