FactoryBot.define do
  factory :stocked_item do
    count { 1 }
    association :inventory_item

    for_shop

    trait :for_shop do
      stockable { |s| s.association :shop }
    end

    trait :for_cab do
      stockable { |s| s.association :cab }
    end
  end
end
