class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable

  has_many :bought_lists
  has_many :watched_lists

  def bought_courses
     self.bought_lists.map { |item| item.course_id }
  end
end
