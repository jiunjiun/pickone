FactoryGirl.define do
  factory :event do
    title "MyString"
    desc "MyString"
    is_secret false
    is_duplicate false
    over_at "2016-08-12"
  end
end
