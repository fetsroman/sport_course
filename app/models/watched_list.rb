class WatchedList < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
end
