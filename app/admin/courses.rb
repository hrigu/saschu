ActiveAdmin.register Course do
  index do |course|
    column :title do |c|
      link_to c.title, admin_course_path(c)
    end
    column :description
    column :capacity
    column :booked
    column :free_places
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
      row :capacity
      row "zugeteilte Anmeldungen" do
        table_for course.definitive_students do |cc|
          column :name do |cc|
            link_to cc.student.user.name, admin_student_path(cc.student)
          end
          column :name do |cc|
            cc.student.school_class.name
          end
          column :email do |cc|
            cc.student.user.email
          end
          column :priority
        end
      end
      row "offene Anmeldungen" do
        table_for course.open_chooses do |cc|
          column :name do |cc|
            link_to cc.student.user.name, admin_student_path(cc.student)
          end
          column :name do |cc|
            cc.student.school_class.name
          end
          column :email do |cc|
            cc.student.user.email
          end
          column :priority
        end
      end
    end
#    active_admin_comments
  end


end
