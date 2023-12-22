class UserQuery < ApplicationRecord
  searchkick text_start: [:query]
end
