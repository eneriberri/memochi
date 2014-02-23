class CreateHearts < ActiveRecord::Migration
  def change
    create_table :hearts do |t|
      t.integer :user_id
      t.integer :memo_id
      
      t.timestamps
    end
    
    add_index :hearts, :user_id
    add_index :hearts, :memo_id
  end
end
