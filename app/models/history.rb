class History < ActiveRecord::Base
      validates :symbol, presence: true, length: { minimum: 3 }
end
