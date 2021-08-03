# Добавление продуктов в *.xml файл
require_relative 'lib/product.rb'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/movie'

require 'rexml/document'

#Массив возможных товаров:
product_list = [Book, Movie, Disk]

puts 'Какой товар хотите добавить?'

#Выведем массив товаров в виде нумерованного списка:
product_list.each do |item|
  puts "#{product_list.index(item)}: #{item}"
  end

user_sel = STDIN.gets.chomp

puts 'Введите стоимость'
price = STDIN.gets.chomp
puts 'Введите остаток на складе'
amount = STDIN.gets.chomp
Product.read_from_xml
prod = product_list[user_sel.to_i].new(price, amount)
options = prod.product_input
prod.update(options)
#puts options.to_s
#puts prod.info
prod.to_xml

# Попросим пользователя добавить товар
=begin

case user_sel
when '0'
  book = Book.new(price, amount)
  book.product_input
  attributes = {title => 'title',
                author => 'author'
  }
  book.update(attributes)
  book.to_xml(Product.read_from_xml)
when '1'
  Movie.new().to_xml
when '2'
  Disk.new().to_xml
else
  puts "Ошибка! Вы ввели #{user_sel}"
  puts "введите число от 0 до #{product_list.length}"
=end
#end