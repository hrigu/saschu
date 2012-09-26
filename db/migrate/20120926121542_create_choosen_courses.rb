class CreateChoosenCourses < ActiveRecord::Migration
  def up
    create_table :choosen_courses do |t|
      t.integer :course_id
      t.integer :student_id
      t.integer :priority
      t.boolean :definitiv
    end  end

  def down
    drop_table :choosen_courses
  end
end
