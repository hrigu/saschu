class AddFieldsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :expence, :integer
    add_column :courses, :payroll_form, :boolean
    add_column :courses, :children_material, :string
    add_column :courses, :material, :string
    add_column :courses, :notes_for_path, :string
  end
end
