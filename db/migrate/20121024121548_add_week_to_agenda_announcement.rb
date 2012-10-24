class AddWeekToAgendaAnnouncement < ActiveRecord::Migration
  def change
  	add_column :agendas, :week_id, :integer
  	add_column :announcements, :week_id, :integer
  	add_column :resources, :week_id, :integer
  end
end
