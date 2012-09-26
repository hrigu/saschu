class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.integer :class_min, :null => false
      t.integer :class_max, :null => false
      t.integer :num_of_students, :null => false
      t.string :where, :null => false
      t.references :parent, :null => false
      t.timestamps
    end
  end
end
