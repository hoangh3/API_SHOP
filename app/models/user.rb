# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  customer_id       :integer
#  name              :string
#  email             :string
#  password_digest   :string
#  remember_digest   :string
#  activation_digest :string
#  activated         :boolean
#  activated_at      :string
#  datetime          :string
#  reset_digest      :string
#  reset_sent_at     :datetime
#  delete_at         :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class User < ApplicationRecord
  before_save  :downcase_email
  before_create :create_activation_digest, :set_default_values
  # == Constants ============================================================

  # == Attributes ===========================================================
  attr_accessor :activation_token, :remember_token, :authentication_token, :password_reset_token
  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :customer,         foreign_key: "customer_id"

  # == Validations ==========================================================
  validates :name, presence: true, length: {maximum: 32}

  validates :email, presence: true, length: {maximum: 32}, uniqueness: {case_sensitive: false},
  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true
  validates :authen_token_digest, uniqueness: true, allow_blank: true
  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authentication
    self.authentication_token = User.new_token
    update_attribute(:authen_token_digest, User.digest(authentication_token))
  end

  def reset_token
    self.password_reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(password_reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget 
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end
  # == Instance Methods =====================================================
  private
    def set_default_values
      self.activated = false
    end

    def downcase_email
      self.email = email.downcase
    end

    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
