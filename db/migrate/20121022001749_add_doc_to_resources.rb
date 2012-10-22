class AddDocToResources < ActiveRecord::Migration
  def change
    add_column :resources, :doc, :string
  end
end
