# == Schema Information
#
# Table name: receip_note_details
#
#  id             :integer          not null, primary key
#  receip_note_id :integer
#  product_id     :integer
#  quantity       :integer
#  price          :float
#  delete_at      :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ReceipNoteDetail < ApplicationRecord

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :receip_note,      foreign_key: "receip_note_id"
  belongs_to :product,          foreign_key: "product_id"
  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
