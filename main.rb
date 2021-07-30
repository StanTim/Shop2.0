# Магазин с чтением товаров из *.xml  файла
#
# автор - Stanislav A. Timanov


require_relative 'lib/Product'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/movie'

Product.read_from_xml

puts 'Что хотите купить?'
products = Product.read_from_xml
puts Product.list(products)

# Попросим пользователя выбрать товаров
user_sel = STDIN.gets.chomp

while user_sel != 'x'
  Product.list(products)

  user_sel = STDIN.gets.chomp

  if user_sel != 'x' && user_sel.to_i < products.size && user_sel.to_i >= 0
    product = products[user_sel.to_i]
    total_price += Product.buy
  end
end

puts "Спасибо за покупки, с Вас #{total_price} руб."

#Массив возможных товаров:
product_list = ['book', 'movie', 'disk']

puts 'Какой товар хотите добавить?'

#Выведем массив товаров в виде нумерованного списка:
product_list.each do |item|
  puts "#{product_list.index(item)}: #{item}"
end
puts
# Попросим пользователя добавить товар

usel_sel = STDIN.gets.chomp
case usel_sel
when '0'
  Book.new.to_xml
when 1
when 2
else
  puts "Ожидалось от 0 до #{product_list.length}"

end


  #puts Product









