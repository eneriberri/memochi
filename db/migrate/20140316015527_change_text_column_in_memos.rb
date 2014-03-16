class ChangeTextColumnInMemos < ActiveRecord::Migration
  def change
    rename_column :memos, :text, :body
  end
end
