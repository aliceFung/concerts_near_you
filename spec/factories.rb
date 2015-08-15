FactoryGirl.define do
  
  factory :bands do
    name "Madonna"
    location "New York"
  end

  factory :user do
    sequence(:email) {|n| "test#{n}@test.com" }
    encrypted_password "wregtlkjngmf,"
    name "Olga"
  end

  factory :event do
    lat "40.748817"
    lon "-73.985428"
    artist "Fuzz"
    description "Concert"
    venue "Field"
    datetime "Tomorrow"
  end

end