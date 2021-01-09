class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :user_id, null: false
      t.integer :target_user_id, null: false

      t.timestamps
    end
    
    add_index :follows, :user_id
    add_index :follows, :target_user_id
    add_index :follows, [:userid, :target_userid], unique: true
  end
end
