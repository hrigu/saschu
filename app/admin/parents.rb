ActiveAdmin.register Parent do
  index do
    column :name do |parent|
      parent.user.name
    end
    column :email do |parent|
      parent.user.email
    end
    column :course do |parent|
      parent.course.title if parent.course
    end
  end
end
