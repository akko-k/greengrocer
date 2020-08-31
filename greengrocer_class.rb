require "pry"

class Product
  attr_reader :id, :name, :price, :count
  @@count = 30
  def initialize(name:, price:)
    @id = @@count += 1
    @name = name
    @price = price
  end
end

class Greengrocer
  attr_reader :products
  def initialize(product_params)
    @products = []
    register_product(product_params)
  end
  
  def register_product(product_params)
    # @products に product_params の各パラメータから生成した Product クラスのインスタンスを入れていく
    product_params.each do |param|
      @products << Product.new(param)
    end
  end
  
  def disp
    puts "商品を選択してください"
    @products.each do |product|
      puts "#{product.id}.#{product.name}" "(¥#{product.price})"
    end
  end

  def ask_quantity(user)
    puts "#{user.selected_product.name}ですね、何個買いますか？"
  end
end

class User
  attr_reader :selected_product
  def initialize(selected_product:)
    @selected_product = selected_product
  end

  def choose(greengrocer)
    loop do
      print "商品を選択 >"
      selected_products_num = gets.to_i
      @selected_product = greengrocer.products.find{|product| product.id == selected_products_num}
      break if !selected_product.nil?
        puts "#{greengrocer.products.first.id}から#{greengrocer.products.last.id}の数字を入力してください"
    end
    @selected_product
  end
end

#八百屋１
product_params1 = [
  { name: "トマト", price: 100 },
  { name: "にんじん", price: 200 },
]
# product_params1 の商品を持つ八百屋の開店
greengrocer1 = Greengrocer.new(product_params1)
#お客さんの来店
user = User.new(selected_product: nil)

adding_products1 = [
  { name: "かぼちゃ", price: 300 },
  { name: "スイカ", price: 1000 },
]
# adding_products の商品を追加
greengrocer1.register_product(adding_products1)

# 商品を表示
greengrocer1.disp
# 商品の決定
user.choose(greengrocer1)
# 個数を訊ねる
greengrocer1.ask_quantity(user)

#八百屋2
product_params2 = [
  { name: "パセリ", price: 100 },
  { name: "大根", price: 200 },
]
greengrocer2 = Greengrocer.new(product_params2)

adding_products2 = [
  { name: "なす", price: 300 }
]
# adding_products2 の商品を追加
greengrocer2.register_product(adding_products2)
# 商品を表示
greengrocer2.disp
# 商品の決定
user.choose(greengrocer2)
# 個数を訊ねる
greengrocer2.ask_quantity(user)