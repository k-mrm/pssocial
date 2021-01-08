class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :screenname
      t.string :username
      t.string :email
      t.text :profile

      t.timestamps
    end
  end
end
