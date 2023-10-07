# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Category.create(id: 1, name:"SAMSUNG")
Category.create(id: 2, name:"OPPO")
Category.create(id: 3, name:"VIVO")
Category.create(id: 4, name:"INFINIX")
Category.create(id: 5, name:"TECHNO")


SubCategory.create(id: 1, name:"Galaxy A", category_id: 1)
SubCategory.create(id: 2, name:"Galaxy S", category_id: 1)
SubCategory.create(id: 3, name:"Galaxy Z", category_id: 1)

SubCategory.create(id: 4, name:"A Series", category_id: 2)
SubCategory.create(id: 5, name:"Reno Series", category_id: 2)
SubCategory.create(id: 6, name:"F Series", category_id: 2)

SubCategory.create(id: 7, name:"X Series", category_id: 3)
SubCategory.create(id: 8, name:"V Series", category_id: 3)
SubCategory.create(id: 9, name:"Y Series", category_id: 3)

SubCategory.create(id: 10, name:"H Series", category_id: 4)
SubCategory.create(id: 11, name:"Smart Series", category_id: 4)
SubCategory.create(id: 12, name:"Z Series", category_id: 4)

SubCategory.create(id: 13, name:"Camon Series", category_id: 5)
SubCategory.create(id: 14, name:"Pova Series", category_id: 5)
SubCategory.create(id: 15, name:"Spark Series", category_id: 5)

Product.create(id: 1, name: "Samsung Galaxy A10", series: "Galaxy A", description: "This is a Samsung A10 Smartphone", price: "12345", sub_category_id: 1)
Product.create(id: 2, name: "Samsung Galaxy S20", series: "Galaxy S", description: "This is a Samsung S20 Smartphone", price: "12345", sub_category_id: 1)
Product.create(id: 3, name: "Samsung Galaxy Z-Fold", series: "Galaxy Z", description: "This is a Samsung Z-Fold Smartphone", price: "12345", sub_category_id: 1)
Product.create(id: 4, name: "Samsung Galaxy A11", series: "Galaxy A", description: "This is a Samsung A10 Smartphone", price: "12345", sub_category_id: 2)
Product.create(id: 5, name: "Samsung Galaxy S21", series: "Galaxy S", description: "This is a Samsung S20 Smartphone", price: "12345", sub_category_id: 2)
Product.create(id: 6, name: "Samsung Galaxy Z-Fold1", series: "Galaxy Z", description: "This is a Samsung Z-Fold Smartphone", price: "12345", sub_category_id: 2)
Product.create(id: 7, name: "Samsung Galaxy A11", series: "Galaxy A", description: "This is a Samsung A10 Smartphone", price: "12345", sub_category_id: 3)
Product.create(id: 8, name: "Samsung Galaxy S21", series: "Galaxy S", description: "This is a Samsung S20 Smartphone", price: "12345", sub_category_id: 3)
Product.create(id: 9, name: "Samsung Galaxy Z-Fold1", series: "Galaxy Z", description: "This is a Samsung Z-Fold Smartphone", price: "12345", sub_category_id: 3)

Product.create(id: 10, name: "Oppo A77", series: "A Series", description: "This is a Oppo A77 Smartphone", price: "12345", sub_category_id: 4)
Product.create(id: 11, name: "Oppo Reno 8", series: "Reno Series", description: "This is a Oppo Reno 8 Smartphone", price: "12345", sub_category_id: 4)
Product.create(id: 12, name: "Oppo F21", series: "F Series", description: "This is a Oppo F21 Smartphone", price: "12345", sub_category_id: 4)
Product.create(id: 13, name: "Oppo A73", series: "A Series", description: "This is a Oppo A77 Smartphone", price: "12345", sub_category_id: 5)
Product.create(id: 14, name: "Oppo Reno 83", series: "Reno Series", description: "This is a Oppo Reno 8 Smartphone", price: "12345", sub_category_id: 5)
Product.create(id: 15, name: "Oppo F213", series: "F Series", description: "This is a Oppo F21 Smartphone", price: "12345", sub_category_id: 5)
Product.create(id: 16, name: "Oppo A773", series: "A Series", description: "This is a Oppo A77 Smartphone", price: "12345", sub_category_id: 6)
Product.create(id: 17, name: "Oppo Reno 83", series: "Reno Series", description: "This is a Oppo Reno 8 Smartphone", price: "12345", sub_category_id: 6)
Product.create(id: 18, name: "Oppo F213", series: "F Series", description: "This is a Oppo F21 Smartphone", price: "12345", sub_category_id: 6)

Product.create(id: 19, name: "Vivo X80", series: "X Series", description: "This is a Vico X80 Smartphone", price: "12345", sub_category_id: 7)
Product.create(id: 20, name: "Vivo V20", series: "V Series", description: "This is a Vico V20 Smartphone", price: "12345", sub_category_id: 8)
Product.create(id: 21, name: "Vivo Y30", series: "Y Series", description: "This is a Vico Y30 Smartphone", price: "12345", sub_category_id: 9)

Product.create(id: 22, name: "Infinix Hot 20", series: "HOT Series", description: "This is a INFINIX Hot 20 Smartphone", price: "12345", sub_category_id: 10)
Product.create(id: 23, name: "Infinix Smart 6", series: "Smart Series", description: "This is a INFINIX Smart 6 Smartphone", price: "12345", sub_category_id: 11)
Product.create(id: 24, name: "Infinix Zero 20", series: "Zero Series", description: "This is a INFINIX Zero 20 Smartphone", price: "12345", sub_category_id: 12)

Product.create(id: 25, name: "TECHNO CAMON 17 PRO", series: "Camon Series", description: "This is a TECHNO CAMON 17 PRO Smartphone", price: "12345", sub_category_id: 13)
Product.create(id: 26, name: "TECHNO POVA", series: "POVA Series", description: "This is a TECHNO POVA Smartphone", price: "12345", sub_category_id: 14)
Product.create(id: 27, name: "TECHNO Spark 8 PRO", series: "Spark Series", description: "This is a TECHNO Spark 8 PRO Smartphone", price: "12345", sub_category_id: 15)
