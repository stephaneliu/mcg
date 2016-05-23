class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :starts
      t.datetime :ends
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
