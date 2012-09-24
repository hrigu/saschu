class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :class_min
      t.integer :class_max
      t.string :where
      t.references :parent
      t.timestamps
    end
  end
end
