# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    title "MyString"
    description "MyText"
    class_min 1
    class_max 1
    where "MyString"
  end
end
