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

  factory :user do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    sequence(:login) {|n| Faker::Internet.user_name + n.to_s }
    password { Array.new(8).map{ Faker::Base::Letters.sample }.join('') }
    sequence(:mail) {|n| n.to_s + Faker::Internet.email }
    admin { [true,false].sample }

    factory :admin do
      admin true
    end

    factory :not_admin do
      admin false
    end
  end
end
