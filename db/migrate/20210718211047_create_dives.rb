class CreateDives < ActiveRecord::Migration[6.1]
  def change
    create_table :dives do |t|
      t.string :buddy
      t.string :date
      t.string :time
      t.string :location
      t.string :temperature
      t.string :visibility
      t.string :dive_time
      t.string :depth
      t.string :comments
      t.string :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
