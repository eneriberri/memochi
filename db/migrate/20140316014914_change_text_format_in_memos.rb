class ChangeTextFormatInMemos < ActiveRecord::Migration
  def up
    change_column :memos, :text, :text
  end

  def down
    change_column :memos, :text, :string
  end
end
