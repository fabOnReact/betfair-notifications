require 'spec_helper'

email = ENV['BETFAIR_EMAIL']
pw = ENV['BETFAIR_PW']
app_code = ENV['BETFAIR_APPLICATION_CODE']

FactoryBot.define do 
  factory :client do 
    initialize_with { new(email, pw, app_code) }
  end
end

FactoryBot.define do 
  factory :custom_parser do
    filter { {} }
    maxResults { 1000 }

    factory :monitor_parser do
      filter { {marketIds: ['1'], selectionIds: '2', targetPrice: 4, minutesInterval: 4} }
    end

    factory :books_parser do 
      filter { {marketIds: ['1.149127014']} }
    end

    factory :multiple_ids do 
      filter { {marketIds: ['1.149127014,1.2345']} }
    end

    factory :multiple_events do 
      filter { {eventIds: ['1.149127014,1.2345']} }
    end
  end
end

FactoryBot.define do
  factory :model do
    initialize_with { new(build(:client), build(:custom_parser)) }

    factory :books_model do 
      initialize_with { new(build(:client), build(:books_parser)) }
    end
  end
end

FactoryBot.define do 
  factory :report do 
    model
    initialize_with { new(build(:model)) }
  end
end
