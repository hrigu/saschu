ActiveAdmin.register Student do
  index do
    column :name do |s|
      s.user.nil? ? "unbekannt" : s.user.name
    end
    column :email do |student|
      student.user.email
    end
    column :class_name do |student|
      student.school_class.name if student.school_class
    end
    column :definitive_course
    column :age
    column :sex


#    default_actions
  end

  show do |student|
    attributes_table do
      row :name do
        student.user.name
      end
      row :definitive_course
      row :choosen_courses do
        table_for student.choosen_courses do

          column :title do |cc|
            cc.course.title
          end
          column :description do |cc|
            cc.course.description
          end
          column :priority
          column :definitive
        end
      end

    end
  end
end
