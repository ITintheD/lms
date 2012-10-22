class AddPhotoToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :photo, :string
  end
end
