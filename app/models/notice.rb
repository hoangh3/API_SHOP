# == Schema Information
#
# Table name: notices
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  product_id  :integer
#  email       :string
#  state       :boolean
#  delete_at   :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Notice < ApplicationRecord

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :customer,     foreign_key: "customer_id"
  belongs_to :product,      foreign_key: "product_id"
  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
