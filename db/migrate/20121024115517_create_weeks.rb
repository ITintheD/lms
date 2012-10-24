class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
	  t.string :title
	  t.datetime :start_date
	  t.datetime :end_date
      t.timestamps
    end
  end
end
