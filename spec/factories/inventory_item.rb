FactoryBot.define do
  factory :inventory_item do
    mfg { Faker::Lorem.word }
    part_no { Faker::Lorem.word }
    supplier { Faker::Lorem.word }
    name { Faker::Lorem.word }
    category { Faker::Lorem.word }
    consumable { false }

    trait :with_stocked_items do
      transient do
        stocked_count { 5 }
      end

      after(:create) do |inventory_item, evaluator|
        create_list(:stocked_items, evaluator.stocked_count, stockable: inventory_item)
      end
    end
  end
end
