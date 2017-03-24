# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  category_id       :integer
#  producer_id       :integer
#  sex_id            :integer
#  name              :string
#  price             :float
#  quantity          :integer
#  cash_discount     :integer
#  image             :string
#  title             :string
#  color             :string
#  size              :string
#  designed          :string
#  content           :string
#  order_information :string
#  delete_at         :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Product < ApplicationRecord

  # == Constants ============================================================

  # == Attributes ===========================================================
  attr_accessor :content_array_style, :color_array_style, :size_array_style
  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :category,                 foreign_key: "category_id"
  belongs_to :producer,                 foreign_key: "producer_id"
  belongs_to :sex,                      foreign_key: "sex_id"
  has_one    :bill_detail
  has_one    :receip_note_detail
  has_one    :notice
  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
