ActiveAdmin.register ChoosenCourse do

  batch_action :mache_definitiv do |selection|
    ChoosenCourse.find(selection).each do |cc|
      cc.definitive = true
      cc.save
    end
    redirect_to collection_path
  end

  scope :assigned
  scope :not_assigned

  index do

    selectable_column
    column :course do |cc|
      cc.course.title
    end
    column :student_name do |cc|
      cc.student.user.name
    end
    column :priority
    column :definitive
  end


end
