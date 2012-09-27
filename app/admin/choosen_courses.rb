ActiveAdmin.register ChoosenCourse do

  batch_action :mache_definitiv do |selection|
    ChoosenCourse.find(selection).each do |cc|
      cc.definitive = true
      cc.save
    end
    redirect_to collection_path
  end

  scope :not_assigned, default: true
  scope :assigned

  index do

    selectable_column
    column :course do |cc|
      cc.course.title
    end
    column :free_places do |cc|
      cc.course.free_places
    end
    column :booked do |cc|
      cc.course.booked
    end
    column :student_name do |cc|
      cc.student.user.name
    end
    column :priority
    column :definitive
  end


end
