class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable, :timeoutable #:registerable, :rememberable,
        # :recoverable,
end
