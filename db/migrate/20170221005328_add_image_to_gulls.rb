class AddImageToGulls < ActiveRecord::Migration
  def change
    add_column :gulls, :image, :string
  end
end
