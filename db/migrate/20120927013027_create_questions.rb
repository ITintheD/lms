class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.integer :questionable_id
      t.string :questionable_type
      t.boolean :featured
      t.string :status

      t.timestamps
    end
  end
end
