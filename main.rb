require "./product.rb"
require "./greengrocer.rb"
require "./user.rb"
require "active_support/core_ext/numeric/conversions"

#八百屋１
product_params1 = [
  { name: "トマト", price: 100 },
  { name: "にんじん", price: 200 },
]

# product_params1 の商品を持つ八百屋の開店
greengrocer1 = Greengrocer.new(product_params1)

#お客さんの来店
user = User.new

#八百屋1の追加商品
adding_products1 = [
  { name: "かぼちゃ", price: 300 },
  { name: "スイカ", price: 1000 },
]

# adding_products1 の商品を追加
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