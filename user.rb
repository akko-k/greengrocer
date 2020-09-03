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