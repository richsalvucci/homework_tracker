class CreateJoinTables < ActiveRecord::Migration
  def change
    create_table :join_tables do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
