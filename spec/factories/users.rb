# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
    f.first_name 'Pirmin'
    f.last_name 'Zurbriggen'

    f.email 'pirmi@example.com'
    f.password 'papst'
    f.password_confirmation  { |u| u.password }
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

end