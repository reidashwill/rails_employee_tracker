class FixDivisionIdDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :employees, :division_id, 'integer USING CAST(division_id AS integer)'
  end
end


