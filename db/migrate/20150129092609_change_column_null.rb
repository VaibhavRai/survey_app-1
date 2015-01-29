class ChangeColumnNull < ActiveRecord::Migration
  def change
    change_column_null(:users, :name, true)
    change_column_null(:users, :email, true)
    change_column_null(:users, :password, true)
  end
end
