class CreateGulls < ActiveRecord::Migration
  def change
    create_table :gulls do |t|
      
      t.string "title1"
      t.string "content1"
      t.integer "user_id"
      t.string :image_url, default:""

      t.timestamps null: false
    end
  end
end
