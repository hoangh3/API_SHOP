# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  address    :string
#  phone      :string
#  country    :string
#  city       :string
#  total      :float
#  delete_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  has_one :user
  has_many :bills
  has_many :notices
  # == Validations ==========================================================
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :name, length: {maximum: 32}
  validates :address, length: {maximum: 500}
  validates :country, length: {maximum: 32}
  validates :city, length: {maximum: 100}
  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
