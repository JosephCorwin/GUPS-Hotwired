FactoryBot.define do
  factory :shop do
    sequence :name do |n|
      "#{Faker::Book.title}#{n}"
    end

    code_name { name[-4..-1] }
    address { "#{Faker::Address.full_address}" }
    phone { "#{Faker::PhoneNumber.phone_number}" }
    domain { "#{Faker::Lorem.word}.#{Faker::Lorem.word}" }
  end
end
