class CreateForecasts < ActiveRecord::Migration[5.1]
  def change
    create_table :forecasts do |t|
      t.integer :high_temp
      t.integer :low_temp
      t.decimal :precipitation
      t.integer :wind
      t.float :score
      t.belongs_to :event, foreign_key: true
      t.belongs_to :season, foreign_key: true

      t.timestamps
    end
  end
end
