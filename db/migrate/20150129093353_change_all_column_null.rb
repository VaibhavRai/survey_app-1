class ChangeAllColumnNull < ActiveRecord::Migration
  def change
    change_column_null(:options, :description , true)
    change_column_null(:options, :question_id , true)
  end
end
