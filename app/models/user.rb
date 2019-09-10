class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable

  has_many :bought_lists
  has_many :watched_lists

  validates :terms_and_conditions, acceptance: true, on: :create
  validates_presence_of :name, :phone, :email, :password
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_format_of :phone, with: /\d[0-9+]\)*\z/


  def bought_courses
     self.bought_lists.map { |item| item.course_id }
  end
end
