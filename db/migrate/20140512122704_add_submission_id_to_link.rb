class AddSubmissionIdToLink < ActiveRecord::Migration
  def change
     add_column :links, :submission_id, :integer
  end
end
