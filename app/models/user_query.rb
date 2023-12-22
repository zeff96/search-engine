class UserQuery < ApplicationRecord
  
  validates_presence_of :query, :ip_address

  searchkick text_start: [:query]
end
