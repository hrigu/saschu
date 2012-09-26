ActiveAdmin.register ChoosenCourse do

  batch_action :mache_definitiv do |selection|
    ChoosenCourse.find(selection).each do |cc|
      cc.definitiv = true
      cc.save
      redirect_to collection_path, :notice => "definitiv  "
    end
  end
  scope :joined, :default => true do |cc|
    cc.includes [:course, :student]
  end
  index do
    selectable_column
    column :course do |cc|
      cc.course.title
    end
    column :student_name do |cc|
      cc.student.user.name
    end
    column :priority
    column :definitiv
  end


end
