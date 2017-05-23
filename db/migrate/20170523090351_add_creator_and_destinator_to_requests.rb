class AddCreatorAndDestinatorToRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :requests, :creator, foreign_key: { to_table: :users }, null: false
    add_reference :requests, :destinator, foreign_key: { to_table: :users }, null: false
  end
end
