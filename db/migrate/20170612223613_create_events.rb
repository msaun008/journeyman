class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.integer :duration
      t.string :location
      t.string :station
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
