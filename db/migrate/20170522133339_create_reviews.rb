class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :job, foreign_key: true
      t.references :creator, foreign_key: true
      t.string :title
      t.text :content
      t.integer :rating
      t.references :destinator, foreign_key: true

      t.timestamps
    end
  end
end
