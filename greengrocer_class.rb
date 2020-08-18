require "pry"

class Product
  attr_reader :name, :price
  def initialize(name:, price:)
    @name = name
    @price = price
  end
end

class Greengrocer
  attr_reader :product_params

  def initialize(product_params)
    @product_params = []
    register_product(product_params)
  end
  
  def register_product(product_params)
    # @product_params に product_params の各パラメータから生成した Product クラスのインスタンスを入れていく
    product_params.each do |param|
      @product_params << Product.new(param)
    end
    @product_params
  end
  
  def disp
    puts "商品を選択してください"
    @product_params.each.with_index(FIRST_PRODUCTS_NUM) do |product, i|
      puts "#{i}.#{product.name}" "(¥#{product.price})"
    end
  end

end

FIRST_PRODUCTS_NUM = 30

product_params = [
  { name: "トマト", price: 100 },
  { name: "にんじん", price: 200 },
]
# product_params の商品を持つ八百屋の開店
greengrocer = Greengrocer.new(product_params)
adding_product_params = [
  { name: "かぼちゃ", price: 300 },
  { name: "スイカ", price: 1000 },
]
# adding_product_params の商品を追加
greengrocer.register_product(adding_product_params)
greengrocer.disp
