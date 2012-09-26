ActiveAdmin.register Course do
  index do |course|
    column :title do |c|
      link_to c.title, admin_course_path(c)
    end
    column :description
    column :class_min
    column :class_max
    column :where
    column :name do |c|
      c.parent.user.name
    end
    column :email do |c|
      c.parent.user.email
    end
    default_actions

  end

end