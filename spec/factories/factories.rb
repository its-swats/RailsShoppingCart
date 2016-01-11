FactoryGirl.define do
  factory :user do
    first_name "First"
    last_name "Last"
    email "Email"
    password "password"
    admin? true
  end
end

FactoryGirl.define do
  factory :product do
    title "title"
    description "description"
    price 371
    quantity 22
  end
end

FactoryGirl.define do
  factory :line_item do
    product_id 1
    user_id 1
  end
end

FactoryGirl.define do
  factory :cart do
    user_id 1
  end
end