class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :age
      t.references :school_class
      t.timestamps
    end
  end
end
