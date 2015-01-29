class ChangeColumnNullQuestion < ActiveRecord::Migration
  def change
    change_column_null(:questions, :description, true)

  end
end
