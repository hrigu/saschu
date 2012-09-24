ActiveAdmin.register User do

  filter :first_name
  filter :email

  index do |user|
    column :first_name do |u|
      link_to u.first_name, admin_user_path(u)
    end
    column :last_name
    column :email
    column :rolable_type, :dependent => :delete

  end

  show do |user|
    attributes_table do
      row :email
    end
#    active_admin_comments
  end


end
