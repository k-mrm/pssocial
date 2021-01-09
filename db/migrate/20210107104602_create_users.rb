class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :screenname, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :admin, null: false
      t.text :profile, null: true

      t.timestamps
    end
  end
end
