class AddOwnerToSeason < ActiveRecord::Migration[5.1]
  def change
    add_reference :seasons, :owner, foreign_key: "user_id"
  end
end
