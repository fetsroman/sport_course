class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable

  has_many :bought_lists
  has_many :watched_lists

  validates_acceptance_of :terms_and_conditions#, allow_nil: false, on: :create

  def bought_courses
     self.bought_lists.map { |item| item.course_id }
  end
end
