class AddDocToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :doc, :string
  end
end
