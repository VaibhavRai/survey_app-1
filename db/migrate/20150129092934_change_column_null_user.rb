class ChangeColumnNullUser < ActiveRecord::Migration
  def change
    change_column_null(:users, :role_id, true)
  end
end
