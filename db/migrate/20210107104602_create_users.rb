class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :screenname
      t.string :username
      t.integer :userid

      t.timestamps
    end
  end
end
