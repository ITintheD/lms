class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :title
      t.text :body
      t.integer :instructor_id
      t.boolean :featured
      t.string :status

      t.timestamps
    end
  end
end
