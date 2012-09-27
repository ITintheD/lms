class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :description
      t.integer :resourceable_id
      t.string :resourceable_type
      t.string :link
      t.boolean :featured
      t.string :status

      t.timestamps
    end
  end
end
