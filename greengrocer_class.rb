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

  def ask_quantity(selected_product)
    puts "#{selected_product.name}ですね、何個買いますか？"
  end

end

class User
  
  def choose(products)
    selected_products_num = select_products_num
    selected_products_index = selected_products_num - FIRST_PRODUCTS_NUM
    selected_product = products[selected_products_index]
    selected_product
  end

  def select_products_num
    print "商品を選択 >"
    selected_products_num = gets.to_i
    loop do
      break if correct_num?(selected_products_num)
      puts "#{FIRST_PRODUCTS_NUM}から#{LAST_PRODUCTS_NUM}の数字を入力してください"
      print "商品を選択 >"
      selected_products_num = gets.to_i
    end
    selected_products_num
  end

  def correct_num?(selected_products_num)
    FIRST_PRODUCTS_NUM <= selected_products_num && selected_products_num <= LAST_PRODUCTS_NUM
  end

end

product_params = [
  { name: "トマト", price: 100 },
  { name: "にんじん", price: 200 },
]

# product_params の商品を持つ八百屋の開店
greengrocer = Greengrocer.new(product_params)
user = User.new

adding_product_params = [
  { name: "かぼちゃ", price: 300 },
  { name: "スイカ", price: 1000 },
]
# adding_product_params の商品を追加
products = greengrocer.register_product(adding_product_params)

FIRST_PRODUCTS_NUM = 30
LAST_PRODUCTS_NUM = (FIRST_PRODUCTS_NUM + (products).size) - 1

# 商品を表示
greengrocer.disp
# 商品の決定
selected_product = user.choose(products)
# 個数を訊ねる
greengrocer.ask_quantity(selected_product)