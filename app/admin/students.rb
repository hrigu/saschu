ActiveAdmin.register Student do
  index do
    column :name do |s|
      s.user.name
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
