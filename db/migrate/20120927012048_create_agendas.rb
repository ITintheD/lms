class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :title
      t.text :body
      t.string :week
      t.boolean :featured
      t.integer :instructor_id
      t.string :status

      t.timestamps
    end
  end
end
