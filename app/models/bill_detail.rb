# == Schema Information
#
# Table name: bill_details
#
#  id         :integer          not null, primary key
#  bill_id    :integer
#  product_id :integer
#  quantity   :integer
#  delete_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BillDetail < ApplicationRecord

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :bill,         foreign_key: "bill_id"
  belongs_to :product,      foreign_key: "product_id"
  # == Validations ==========================================================
  validates :product_id, presence: true
  validates :quantity, presence: true
  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
