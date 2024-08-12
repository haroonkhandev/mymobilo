namespace :db do
  desc "Generate slugs for existing products"
  task generate_slugs: :environment do
    Product.find_each do |product|
      product.save!
    end
  end
end