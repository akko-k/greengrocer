require "./greengrocer_methods"

products = [
  { name: "トマト", price: 100},
  { name: "にんじん", price: 200},
  { name: "かぼちゃ", price: 300},
  { name: "スイカ", price: 1000},
  { name: "パセリ", price: 100},
]
FIRST_PRODUCTS_NUM = 30
LAST_PRODUCTS_NUM = (FIRST_PRODUCTS_NUM + products.size) - 1

# 以下の処理を見るだけで内容がわかる
disp(products)
selected_product = choose(products)
calculate_charges(selected_product)