class AddNameToHomework < ActiveRecord::Migration
  def change
    add_column :homeworks, :name, :string
  end
end
