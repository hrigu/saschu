ActiveAdmin.register Course do
  index do |course|
    column :title do |c|
      link_to c.title, admin_course_path(c)
    end
    column :description
    column :num_of_students
    column :where
    column :class_min
    column :class_max
    column :name do |c|
      c.parent.user.name
    end
    column :email do |c|
      c.parent.user.email
    end
    default_actions
  end

  show do |course|
    attributes_table do
      row :title
      row :description
      row :num_of_students
      row "Students" do
        table_for course.choosen_courses do |cc|
          column :name do |cc|
            link_to cc.student.user.name, admin_student_path(cc.student)
          end
          column :email do |cc|
            cc.student.user.email
          end
          column :priority
          column :definitiv
        end
      end
    end
#    active_admin_comments
  end


end
