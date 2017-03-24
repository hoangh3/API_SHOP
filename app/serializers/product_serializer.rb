class ProductSerializer < ActiveModel::Serializer
  attributes :id, :sex_id, :producer_id, :category_id, :name, :price, :quantity,
  	:cash_discount, :image, :title, :designed, :content,
  	:color_array_style, :size_array_style, :content_array_style

  has_one :total_count
  # def rows
  #   self.map { |o| FormSerializer.new(o) }
  # end

  def color_array_style
  	self.object.color.split("**")
  end

  def size_array_style
  	self.object.size.split("**")
  end

  def content_array_style
  	self.object.content.split("**")
  end

  def total_count
    @instance_options[:total_count]
  end
end
