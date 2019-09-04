class Payment < ApplicationRecord
  validates_acceptance_of :terms_and_conditions, allow_nil: false
end
