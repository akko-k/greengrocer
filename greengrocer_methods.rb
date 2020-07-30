def disp(products)
  puts "商品を選択してください"
  products.each.with_index(FIRST_PRODUCTS_NUM) do |product, i|
    puts "#{i}.#{product[:name]}" "(¥#{product[:price]})"
  end
end
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
def calculate_charges(selected_product)
  puts "#{selected_product[:name]}ですね、何個買いますか？"
  print "個数を入力 >"
  quantity_of_product = gets.to_i
  total_price = quantity_of_product * selected_product[:price]
  discount_price = (total_price * 0.8).floor
  puts "#{discount_price}円の割引でお会計は#{discount_price}円です"
end