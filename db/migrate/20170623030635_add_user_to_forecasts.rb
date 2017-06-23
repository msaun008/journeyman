class AddUserToForecasts < ActiveRecord::Migration[5.1]
  def change
    add_reference :forecasts, :user, foreign_key: true
  end
end
