class AddReferenceRequestToMessage < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :request, foreign_key: { to_table: :requests }, null: false
  end
end
