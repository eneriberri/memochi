class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.string :text
      t.boolean :private, :default => false
      t.integer :user_id
      
      t.timestamps
    end
    
    add_index :memos, :user_id
  end
end
