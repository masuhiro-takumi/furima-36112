class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/


  validates :nickname  ,      presence: true
  validates :first_name,      presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  validates :last_name,       presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,        presence: true
  validates :password,        format: { with: VALID_PASSWORD_REGEX }
end
