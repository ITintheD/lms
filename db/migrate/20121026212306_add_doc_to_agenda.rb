class AddDocToAgenda < ActiveRecord::Migration
  def change
    add_column :agendas, :doc, :string
  end
end
