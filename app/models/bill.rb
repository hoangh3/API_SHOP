# == Schema Information
#
# Table name: bills
#
#  id            :integer          not null, primary key
#  customer_id   :integer
#  transport_state_id      :integer
#  date          :datetime
#  cash_discount :integer
#  payment_state         :boolean
#  delete_at     :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Bill < ApplicationRecord

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  has_many :bill_details
  belongs_to :customer,         foreign_key: "customer_id"
  belongs_to :transport_state,  foreign_key: "transport_state_id"
  # == Validations ==========================================================
  validates :customer_id, presence: true
  validates :transport_state_id, presence: true
  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
