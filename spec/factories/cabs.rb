FactoryBot.define do
  factory :cab do
    make { "#{Faker::Lorem.word}" }
    model { "#{Faker::Lorem.word}" }
    serial_no { rand(100000..999999).to_s }
    fleet_number { rand(1..100).to_s }
    frame_color { Faker::Color.color_name }
    carriage_color { Faker::Color.color_name }
    upholstery_color { Faker::Color.color_name }

    transient do
      parts_count { 5 }
    end

    after(:create) do |cab, evaluator|
      create_list(:inventory_items, evaluator.parts_count, stockable: cab)
    end
  end
end
