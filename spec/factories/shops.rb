FactoryBot.define do
  factory :shop do
    name { Faker::Company.name }
    code_name { name.gsub(/[a-z\W]/,'') }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.phone_number }
    domain { "#{Faker::Lorem.word}.#{Faker::Lorem.word}" }
    logo { "#{Faker::Lorem.word}.jpg" }

    trait :with_everythng do
      with_cabs
      with_stock
      with_contracts
    end

    trait :with_cabs do
      transient do
        cab_count { 5 }
      end

      after(:create) do |shop, evaluator|
        create_list(:cabs, evaluator.cab_count, shop: shop)
      end
    end

    trait :with_contracts do
      transient do
        contract_count { 5 }
      end

      after(:create) do |shop, evaluator|
        create_list(:contracts, evaluator.contract_count, shop: shop)
      end
    end

    trait :with_stock do
      transient do
        stocked_count { 5 }
      end

      after(:create) do |shop, evaluator|
        create_list(:stocked_items, evaluator.stocked_count, :for_shop, stockable: shop)
      end
    end
  end
end
