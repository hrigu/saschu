ActiveAdmin.register SchoolClass do
  show do |sc|
    attributes_table do
      row :name
      row "Students" do
        table_for sc.students do
          column :first_name do |student|

            link_to student.user.first_name, admin_student_path(student)
          end
          column :last_name do |student|
            student.user.last_name
          end
          column :email do |student|
            student.user.email
          end
        end
      end      
    end
#    active_admin_comments
  end


end
