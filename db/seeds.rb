# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sex = ["Men", "Womem"]
categories = ["Children", "Clothing", "shirt", "Trousers", "Shoes"]
producers = ["America Eagle", "Armani", "Chanel", "H&M", "Zara", "D&G", "Gucci"]
colors = ["red**black", "yellow**blue**black", "red**yellow**blue**black", "red**yellow**blue"]
sizes = ["S**M**X**XL", "S**M", "XL", "S**XL", "M**X**XL"]
status = ["dang doi", "da van chuyen", "da nhan hang"]

sex.each do |gender|
	Sex.create(gender: gender)
end

categories.each do |category_name|
  Category.create(name: category_name)
end

producers.each do |producer_name|
  Producer.create(name: producer_name)
end

1000.times do |product|
  category_id = Random.new.rand(1..5)
  producer_id = Random.new.rand(1..7)
  sex_id = Random.new.rand(1..2)
  name = "Fashion #{product}"+"13"
  price = Random.new.rand(0..1000)
  quantity = Random.new.rand(0..100)
  cash_discount = Random.new.rand(0..100)
  image = "uploads/product/picture/#{Random.new.rand(0..12)}.jpg"
  title = "The Monaco suit is designed with a slim, tapered silhouette and soft, rounded shoulders."
  color = colors[Random.new.rand(0..3)]
  size = sizes[Random.new.rand(0..4)]
  designed = "Designed by"+Faker::Name.name
  content = "Ink blue checked seersucker**Jacket with half canvas construction,bicolor silk lining, two-button closure, notch lapel, front flap pockets and single vent**
    Pant with on-seam front pockets and back besom pockets**Slim, tapered fit**46% wool, 41% linen, 6% silk, 5% nylon and 2% elastane"
  order_information = "Free Ground Shipping"

  Product.create(
    category_id: category_id,
    producer_id: producer_id,
    sex_id: sex_id,
    name: name,
    price: price,
    quantity: quantity,
    cash_discount: cash_discount,
    image: image,
    title: title,
    color: color,
    size: size,
    designed: designed,
    content: content,
    order_information: order_information
    )
end

status.each do |x|
    TransportState.create(status: x)
end

500.times do |customer|
  email = Faker::Internet.email
  name = Faker::Name.name
  address = Faker::Address.street_address
  phone = Faker::PhoneNumber.phone_number
  country = Faker::Address.country
  city = Faker::Address.city
  total = Random.new.rand(0..10000)

  Customer.create(
    email: email,
    name: name,
    address: address,
    phone: phone,
    country: country,
    city: city,
    total: total
    )
end

5.times do |user|
  offset = Random.new.rand(1..10)
  customer = Customer.find_by(id: offset)
  User.create(
    customer_id:  customer.id,
    name: customer.name,
    email: customer.email,
    password: '111111',
    password_confirmation: '111111'
    )
end
