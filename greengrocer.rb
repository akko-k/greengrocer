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
    puts "いらっしゃいませ！"
    puts "商品を選んでください。"
    puts HR_STR
    @products.each do |product|
      puts "#{product.id}.#{product.name}" "(¥#{product.price})"
    end
    puts HR_STR
  end

  def ask_quantity(user)
    puts "#{user.selected_product.name}ですね、何個買いますか？"
    puts "\n"
  end

  def calculate_charges(user)
    total_price = user.selected_product.price * user.quantity_of_product #合計金額
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