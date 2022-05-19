class CreateChangeColumnNames < ActiveRecord::Migration[7.0]
  def change
    create_table :change_column_names do |t|
      rename_column :posts ,:users_id ,:user_id
      rename_column :likes ,:users_id ,:user_id
      rename_column :comments ,:users_id ,:user_id
      t.timestamps
    end
  end
end
