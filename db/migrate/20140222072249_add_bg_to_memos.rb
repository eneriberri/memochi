class AddBgToMemos < ActiveRecord::Migration
  def change
    add_column :memos, :bg, :string
  end
end
