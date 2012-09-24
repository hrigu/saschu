class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|

      t.timestamps
    end
    change_table :users do |t|
      t.references :rolable, :polymorphic => {:default => 'Student'}
    end

    change_table :school_classes do |t|
      t.references :teachers
    end
  end
end
