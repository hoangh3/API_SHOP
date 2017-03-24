# == Schema Information
#
# Table name: receip_notes
#
#  id         :integer          not null, primary key
#  delete_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReceipNote < ApplicationRecord

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  has_many :receip_note_details

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
