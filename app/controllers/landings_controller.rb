class LandingsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
    @oppo = Category.where("LOWER(name)LIKE ?", "%oppo%").first&.products
    @oppo_latest = @oppo.latest
    @vivo = Category.where("LOWER(name)LIKE ?", "%vivo%").first&.products
    @vivo_latest = @vivo.latest
    @samsung = Category.where("LOWER(name)LIKE ?", "%samsung%").first&.products
    @samsung_latest = @samsung.latest
    @tecno = Category.where("LOWER(name)LIKE ?", "%tecno%").first&.products
    @tecno_latest = @tecno.latest
    @infinix = Category.where("LOWER(name)LIKE ?", "%infinix%").first&.products
    @infinix_latest = @infinix.latest
    @huawei = Category.where("LOWER(name)LIKE ?", "%huawei%").first&.products
    @huawei_latest = @huawei&.latest
    @iphone = Category.where("LOWER(name)LIKE ?", "%iphone%").first&.products
    @iphone_latest = @iphone.latest
    @upcoming_products = Product.all.upcoming_products
  end
end
