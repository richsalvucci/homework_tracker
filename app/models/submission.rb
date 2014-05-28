class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :homework
  has_many :links
  accepts_nested_attributes_for :links, allow_destroy: true
  has_many :comments, as: :commentable

  # validate :submit_once

  def submit_once
    if Submission.where(user_id:self.user_id, homework_id: self.homework_id) .length >= 1
      errors.add("You can only submit once")
    end
  end

  include Workflow
  workflow do
    state :new_homework do
      event :reviewing, transitions_to: :reviewing
    end
    state :reviewing do
      event :incomplete, transitions_to: :incomplete
      event :complete, transitions_to: :complete
    end
    state :incomplete do
      event :reviewing, transitions_to: :reviewing
    end
    state :complete 
  end
end
