class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :destinator, foreign_key: true
      t.references :creator, foreign_key: true
      t.references :job, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
