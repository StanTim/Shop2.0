# Добавление продуктов в *.xml файл
require_relative 'lib/product.rb'
require_relative 'lib/disk.rb'
require_relative 'lib/movie.rb'
require_relative 'lib/book.rb'

require 'rexml/document'

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#Массив возможных товаров:
product_list = [Book, Movie, Disk]

puts 'Какой товар хотите добавить?'

#Выведем массив товаров в виде нумерованного списка:
product_list.each do |item|
  puts "#{product_list.index(item)}: #{item}"
end


# Попросим пользователя добавить товар
user_sel = STDIN.gets.chomp

puts 'Введите стоимость'
price = STDIN.gets.chomp
puts 'Введите остаток на складе'
amount = STDIN.gets.chomp


#Создадим новый экземпляр продукта,
#соответствующий выбору пользователя.

prod = product_list[user_sel.to_i].new(price, amount)

options = prod.product_input

prod.to_xml(options)

=begin

else
  puts "Ошибка! Вы ввели #{user_sel}"
  puts "введите число от 0 до #{product_list.length}"
=end
