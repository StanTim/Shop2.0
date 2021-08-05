#Класс чтения товаров из *.xml  файла
#
# автор - Stanislav A. Timanov
#
# Подключение библиотеки чтения *.xml

require 'rexml/document'
#require_relative 'disk.rb'
#require_relative 'product.rb'
#require_relative 'movie.rb'
#require_relative 'book.rb'

class Product
  attr_reader :product_list
  attr_reader :doc
  attr_reader :price
  attr_reader :amount
  attr_reader :file_name
  #attr_writer :file

  def initialize (price, amount)
    @price = price
    @amount = amount
    @file = '/shop3.0.xml'
    @doc = doc
    @file_name = ''
    @product_list = []
  end

  current_path = File.dirname(__FILE__)

  if @file != nil
    @file_name = current_path + @file
    abort "Файл #{@file} не найден." unless File.exist?(@file_name)
  else
    @file_name = current_path + "/shop3.0.xml"
    abort "Файл shop3.0.xml не найден." unless File.exist?(@file_name)
  end


  def update(options)
  end

  def price
    @price
  end

  def info
  end
  #Массив прочитанных продуктов

  def show
    "#{info} - #{@price} руб. [осталось: #{@amount}]"
  end

  def self.list(products)
    #puts "Что хотите купить?\n\n"

    products.each_with_index do |product, index|
      puts "#{index}: #{product.show}"
    end

    puts "x. Покинуть магазин\n\n"
  end


  def self.buy
    if @amount.to_i > 0
      puts "* * *"
      puts "Вы купили товар #{info}"
      puts "* * *\n\n"

      amount -= 1
      price
    else
      puts "К сожалению, больше нет"
      0
    end
  end

  def product_input

  end

# Создадим статический метод, для вызова чтения файлов
# из главной программы
  def self.read_from_xml

    # Массив списка товаров
    @product_list = []

    # переменная списка продуктов
    product = nil

    f = File.new(@file_name, 'r:UTF-8')
    @doc = REXML::Document.new(f)
    f.close

    # Чтение xml:

    @doc.elements.each("products/product") do |item|
      amount = item.attributes["amount"].to_i
      price = item.attributes["price"].to_i

      item.each_element("book") do |book_item|

        product = Book.new(price, amount)
        product.update(
            title: book_item.attributes["title"],
            author: book_item.attributes["author"]
        )
      end

        item.each_element("disk") do |disk_item|

          product = Disk.new(price, amount)
          product.update(
              artist: disk_item.attributes["artist"],
              album: disk_item.attributes["album"],
              style: disk_item.attributes["style"]
          )
        end

          item.each_element("movie") do |movie_item|

            product = Movie.new(price, amount)
            product.update(
                movie: movie_item.attributes["movie"],
                director: movie_item.attributes["director"],
                year: movie_item.attributes["year"]
            )
      end

    end
    @product_list << product
    return @product_list
  end

  def to_xml(options)
    @file_name = File.dirname(__FILE__) + '/shop3.0.xml'
    xml_file = File.read(@file_name, encoding: 'UTF-8')
    doc = REXML::Document.new(xml_file)
  end

end
