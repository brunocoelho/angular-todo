class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.text :uid
      t.text :access_token
      t.text :expires_at

      t.timestamps
    end

    add_index :authentications, :user_id
  end
end
