passclass CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :username
      t.string :email
      t.integer :wins
      t.integer :losses
      t.integer :draws
      t.integer :points
   
      t.timestamps
    end
  end
end
