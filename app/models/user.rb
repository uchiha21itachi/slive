class User < ApplicationRecord

  validates :full_name, presence: true
  validates :email, presence: true
  validates :encrypted_password,
            :presence: true, confirmation: true, length: {minimum: 6}
            :on :create
  validates :encrypted_password,confirmation: true,
            length: {minimum: 6}
            :on :update

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
