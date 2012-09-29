class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.integer :class_min, :null => false, default: 1
      t.integer :class_max, :null => false, default: 6
      t.integer :capacity, :null => false, default: 10
      t.string :where, :null => false
      t.references :parent, :null => false
      t.timestamps
    end
  end
end
