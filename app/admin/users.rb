ActiveAdmin.register User do

  form do |f|
    f.inputs "details" do
      f.input :first_name
      f.input :last_name
      f.input :email

    end
    f.buttons
  end


  #actions :all, except: [:new]

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
