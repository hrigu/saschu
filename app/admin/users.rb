ActiveAdmin.register User do

  filter :first_name
  filter :email

  index do |user|
    column :name do |u|
      link_to u.name, admin_user_path(u)
    end
    column :email
    column :rolable_type, :dependent => :delete
  end



end
