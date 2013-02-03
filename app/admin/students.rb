ActiveAdmin.register Student do

  form do |f|
    f.inputs "details" do
      f.input :school_class
      f.input :school_class
      f.fields_for :user do |user|
        user.input :first_name
        user.input :last_name
        #user.input :last_name
      end
    end
    f.buttons
  end


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
    column :definitive_course do |student|
      definitive_course = student.definitive_course
      link_to(definitive_course.course.title, admin_course_path(definitive_course)) if definitive_course
    end
    column :age


#    default_actions
  end

  show do |student|
    attributes_table do
      row :name do
        student.user.name
      end
      row :school_class
      row :definitive_course do
        dc = student.definitive_course
        link_to(dc.course.title, admin_course_path(dc.course)) if student.definitive_course
      end
      row :choosen_courses do
        table_for student.choosen_courses do

          column :title do |cc|
            link_to(cc.course.title, admin_course_path(cc.course))
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
