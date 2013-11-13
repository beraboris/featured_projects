FactoryGirl.define do
  factory :project do
    sequence(:name) {|n| "#{Faker::Lorem.words(3).join(' ')} #{3}" }
    identifier { name.downcase.gsub ' ', '_' }
    description { Faker::Lorem.paragraph }
    status Project::STATUS_ACTIVE

    is_featured { [true, false].sample }

    factory :featured_project do
      is_featured true
    end

    factory :not_featured_project do
      is_featured false
    end
  end
end
