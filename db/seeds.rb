# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Category.create(name:"SAMSUNG")
Category.create(name:"OPPO")
Category.create(name:"VIVO")
Category.create(name:"INFINIX")
Category.create(name:"TECNO")


Product.create(name: "Samsung Galaxy A10", series: "Galaxy A", description: "This is a Samsung A10 Smartphone", price: "1000", release_date: Date.today, category_id: 1)
Product.create(name: "Samsung Galaxy S20", series: "Galaxy S", description: "This is a Samsung S20 Smartphone", price: "1999", release_date: Date.today + 10.days, category_id: 1)
Product.create(name: "Samsung Galaxy Z-Fold", series: "Galaxy Z", description: "This is a Samsung Z-Fold Smartphone", price: "8188", release_date: Date.today - 10.days, category_id: 1)
Product.create(name: "Samsung Galaxy A11", series: "Galaxy A", description: "This is a Samsung A10 Smartphone", price: "7977", release_date: Date.today - 20.days, category_id: 1)
Product.create(name: "Samsung Galaxy S21", series: "Galaxy S", description: "This is a Samsung S20 Smartphone", price: "6676", release_date: Date.today - 30.days, category_id: 1)
Product.create(name: "Samsung Galaxy Z-Fold1", series: "Galaxy Z", description: "This is a Samsung Z-Fold Smartphone", price: "5595", release_date: Date.today - 28.days, category_id: 1)
Product.create(name: "Samsung Galaxy A12", series: "Galaxy A", description: "This is a Samsung A10 Smartphone", price: "4944", release_date: Date.today - 27.days, category_id: 1)
Product.create(name: "Samsung Galaxy S23", series: "Galaxy S", description: "This is a Samsung S20 Smartphone", price: "9333", release_date: Date.today - 29.days, category_id: 1)
Product.create(name: "Samsung Galaxy Z-Fold2", series: "Galaxy Z", description: "This is a Samsung Z-Fold Smartphone", price: "7222", release_date: Date.today - 40.days, category_id: 1)

Product.create(name: "Oppo A77", series: "A Series", description: "This is a Oppo A77 Smartphone", price: "1011", release_date: Date.today - 19.days, category_id: 2)
Product.create(name: "Oppo Reno 8", series: "Reno Series", description: "This is a Oppo Reno 8 Smartphone", price: "7110", release_date: Date.today - 18.days, category_id: 2)
Product.create(name: "Oppo F21", series: "F Series", description: "This is a Oppo F21 Smartphone", price: "8100", release_date: Date.today - 17.days, category_id: 2)
Product.create(name: "Oppo A53", series: "A Series", description: "This is a Oppo A77 Smartphone", price: "1190", release_date: Date.today - 16.days, category_id: 2)
Product.create(name: "Oppo Reno 83", series: "Reno Series", description: "This is a Oppo Reno 8 Smartphone", price: "1380", release_date: Date.today - 15.days, category_id: 2)
Product.create(name: "Oppo F19", series: "F Series", description: "This is a Oppo F21 Smartphone", price: "9870", release_date: Date.today - 14.days, category_id: 2)
Product.create(name: "Oppo A73", series: "A Series", description: "This is a Oppo A77 Smartphone", price: "7960", release_date: Date.today - 13.days, category_id: 2)
Product.create(name: "Oppo Reno 83", series: "Reno Series", description: "This is a Oppo Reno 8 Smartphone", price: "2150", release_date: Date.today - 12.days, category_id: 2)
Product.create(name: "Oppo F27", series: "F Series", description: "This is a Oppo F21 Smartphone", price: "7640", release_date: Date.today - 11.days, category_id: 2)

Product.create(name: "Vivo X80", series: "X Series", description: "This is a Vico X80 Smartphone", price: "3090", release_date: Date.today - 29.days, category_id: 3)
Product.create(name: "Vivo V20", series: "V Series", description: "This is a Vico V20 Smartphone", price: "27650", release_date: Date.today - 1.days, category_id: 3)
Product.create(name: "Vivo Y30", series: "Y Series", description: "This is a Vico Y30 Smartphone", price: "19099", release_date: Date.today - 2.days, category_id: 3)

Product.create(name: "Infinix Hot 20", series: "HOT Series", description: "This is a INFINIX Hot 20 Smartphone", price: "18655", release_date: Date.today + 3.days, category_id: 4)
Product.create(name: "Infinix Smart 6", series: "Smart Series", description: "This is a INFINIX Smart 6 Smartphone", price: "17657", release_date: Date.today - 6.days, category_id: 4)
Product.create(name: "Infinix Zero 20", series: "Zero Series", description: "This is a INFINIX Zero 20 Smartphone", price: "18766", release_date: Date.today - 5.days, category_id: 4)

Product.create(name: "TECNO CAMON 17 PRO", series: "Camon Series", description: "This is a TECNO CAMON 17 PRO Smartphone", price: "176585", release_date: Date.today - 6.days, category_id: 5)
Product.create(name: "TECNO POVA", series: "POVA Series", description: "This is a TECNO POVA Smartphone", price: "1412", release_date: Date.today - 7.days, category_id: 5)
Product.create(name: "TECNO Spark 8 PRO", series: "Spark Series", description: "This is a TECNO Spark 8 PRO Smartphone", price: "188873", release_date: Date.today - 8.days, category_id: 5)
Product.create(name: "TECNO Spark 10 ", series: "Spark Series", description: "This is a TECNO Spark 10 Smartphone", price: "17652", release_date: Date.today + 9.days, category_id: 5)

AdminUser.create!(email: 'mymobilo.co@gmail.com', password: '123456', password_confirmation: '123456')