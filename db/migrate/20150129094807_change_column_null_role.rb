class ChangeColumnNullRole < ActiveRecord::Migration
  def change
    change_column_null(:roles, :name, true)
  end
end
