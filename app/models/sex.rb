# == Schema Information
#
# Table name: sexes
#
#  id         :integer          not null, primary key
#  gender     :string
#  delete_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sex < ApplicationRecord

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  has_many :products
  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
