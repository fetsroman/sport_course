class Lesson < ApplicationRecord
  belongs_to :course

  translates :title, :description
end
