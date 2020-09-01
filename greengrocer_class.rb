require "pry"
require "active_support/core_ext/numeric/conversions"


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

  HR_STR = "-" * 20
  DISCOUNT_STANDARD_VALUE = 5 #割引きを適用する個数の基準値
  DISCOUNT_RATE = 0.2 #割引率
  AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE

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
    puts "\n"
    puts "商品を選んでください。"
    puts "#{HR_STR}"
    @products.each do |product|
      puts "#{product.id}.#{product.name}" "(¥#{product.price})"
    end
    puts "#{HR_STR}"
  end

  def ask_quantity(user)
    puts "#{user.selected_product.name}ですね、何個買いますか？"
    puts "\n"
  end

  def calculate_charges(user)
    total_price = user.quantity_of_product * user.selected_product.price #合計金額
    discount_price = (total_price * DISCOUNT_RATE).floor #割引する金額
    after_discount_price = (total_price * AFTER_DISCOUNT_RATE).floor #割引後の金額
    if user.quantity_of_product >= DISCOUNT_STANDARD_VALUE #割引を適用する個数かどうかで条件分岐
      puts "#{DISCOUNT_STANDARD_VALUE}個以上なので#{(DISCOUNT_RATE * 10).floor}割引になります！"
      puts "#{total_price.to_s(:delimited)}円から#{discount_price.to_s(:delimited)}円お値引きして、お会計は#{after_discount_price.to_s(:delimited)}円です。"
    else
      puts "お会計は#{total_price.floor.to_s(:delimited)}円です。"
    end
    puts "\n"
    puts "お買い上げありがとうございました！"
  end
end

class User
  attr_reader :selected_product, :quantity_of_product
  def initialize
    @selected_product = selected_product
  end

  def choose(greengrocer)
    loop do
      print "商品を選択 >"
      selected_products_num = gets.to_i
      puts "\n"
      @selected_product = greengrocer.products.find{|product| product.id == selected_products_num}
      break if !@selected_product.nil?
      puts "#{greengrocer.products.first.id}から#{greengrocer.products.last.id}の数字を入力してください"
    end
  end

  def decide_quantity
    loop do
      print "個数を入力 >"
      @quantity_of_product = gets.to_i
      puts "\n"
      break if @quantity_of_product >= 1
      puts "１個以上を選んでください。"
    end
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
user = User.new

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
# 個数を決める
user.decide_quantity
# 金額を計算する
greengrocer1.calculate_charges(user)