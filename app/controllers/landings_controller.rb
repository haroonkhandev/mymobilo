class LandingsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all&.order_by_products
    @oppo = Category.where("LOWER(name)LIKE ?", "%oppo%").first&.products
    @oppo_latest = @oppo&.latest&.order_by_products
    @vivo = Category.where("LOWER(name)LIKE ?", "%vivo%").first&.products
    @vivo_latest = @vivo&.latest&.order_by_products
    @samsung = Category.where("LOWER(name)LIKE ?", "%samsung%").first&.products
    @samsung_latest = @samsung&.latest&.order_by_products
    @tecno = Category.where("LOWER(name)LIKE ?", "%tecno%").first&.products
    @tecno_latest = @tecno&.latest&.order_by_products
    @infinix = Category.where("LOWER(name)LIKE ?", "%infinix%").first&.products
    @infinix_latest = @infinix&.latest&.order_by_products
    @huawei = Category.where("LOWER(name)LIKE ?", "%huawei%").first&.products
    @huawei_latest = @huawei&.latest&.order_by_products
    @iphone = Category.where("LOWER(name)LIKE ?", "%iphone%").first&.products
    @iphone_latest = @iphone&.latest&.order_by_products
    @upcoming_products = Product.all.upcoming_products
  end
end
