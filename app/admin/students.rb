ActiveAdmin.register Student do
  index do

    column :first_name do |student|
      student.user.first_name
    end
    column :last_name do |student|
      student.user.last_name
    end
    column :email do |student|
      student.user.email
    end

    column :class_name do |student|
      student.school_class.name if student.school_class
    end

    column :age
    column :sex


    default_actions
  end
end
