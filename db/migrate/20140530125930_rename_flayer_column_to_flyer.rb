class RenameFlayerColumnToFlyer < ActiveRecord::Migration
  def change
  	rename_column :questions, :flayer_id, :flyer_id
  end
end
