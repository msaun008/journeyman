class CreateEventRecord < ActiveRecord::Migration[5.1]
  def change
    create_table :event_records do |t|
      t.belongs_to :event, foreign_key: true
      t.belongs_to :observed_forecast, class_name: "Forecast", index: true

      t.timestamps
    end

    # add_reference :events, :event_record
  end
end
