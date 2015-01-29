class ChangeColumnNullResponse < ActiveRecord::Migration
  def change
    change_column_null(:responses, :option_id, true)
    change_column_null(:responses, :user_id, true)
  end
end
