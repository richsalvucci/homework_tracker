class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :user_id
      t.integer :homework_id
      t.text :description
      t.string :link
      t.string :workflow_state

      t.timestamps
    end
  end
end
