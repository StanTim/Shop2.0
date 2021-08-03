#Создадим класс для Книг
# который наследуется у продукта

require 'rexml/document'


class Book < Product

  def update(options)
    @title = options[:title]
    @author = options[:author]
  end

  def info
    "Книга #{@title}, #{@author}"
  end

  def product_input
    puts 'Введите автора книги'
    @author = STDIN.gets.chomp
    puts 'Введите название книги'
    @title = STDIN.gets.chomp
    return {
        'title' => @title,
        'author' => @author
    }
  end

  def to_xml
    @file_name = File.dirname(__FILE__) + '/shop3.0.xml'
    xml_file = File.read(@file_name, encoding: 'UTF-8')
    @doc = REXML::Document.new(xml_file)
    #xml_file.close

    @doc.root.add_element('product', {
        'price' => @price,
        'amount' => @amount
    }).add_element('book', {
        :title => @title,
        :author => @author
    })

    file = File.new(@file_name, "w:UTF-8")
    doc.write(file, 2)
    file.close

  end

end