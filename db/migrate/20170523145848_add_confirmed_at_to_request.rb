class AddConfirmedAtToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :confirmed_at, :datetime
  end
end
