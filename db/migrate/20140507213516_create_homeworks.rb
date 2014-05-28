class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.text :description
      t.integer :user_id
      t.integer :course_id
      t.timestamps
    end
  end
end
