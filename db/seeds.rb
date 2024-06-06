puts "fake records are being entered in product model"
10.times do
    Product.create(
      name: Faker::Commerce.product_name,
      category: Faker::Commerce.department,
      brand: Faker::Company.name,
      price: Faker::Commerce.price
    )
  end
  