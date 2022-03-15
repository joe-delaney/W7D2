class EditLive < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :live?, :string
    change_column_default :albums, :live?, from: true, to: "true"
  end
end
