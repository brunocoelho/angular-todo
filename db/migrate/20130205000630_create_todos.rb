class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :description
      t.boolean :done
      t.integer :user_id

      t.timestamps
    end

    add_index :todos, :user_id
  end
end
