require 'spec_helper'

FactoryBot.define do 
  factory :client do 
    initialize_with { new(ENV['BETFAIR_EMAIL'], ENV['BETFAIR_PW'], ENV['BETFAIR_APPLICATION_CODE']) }
  end
end

FactoryBot.define do
  factory :model do
    initialize_with { new(FactoryBot.build(:client), {}, 1000) }
  end
end

FactoryBot.define do 
  factory :report do 
    initialize_with { new(FactoryBot.build(:model)) }
  end
end
