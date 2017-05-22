class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :destinator, foreign_key: { to_table: :users }
      t.references :creator, foreign_key: { to_table: :users }
      t.references :job, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
