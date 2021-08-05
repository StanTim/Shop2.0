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
        @title => 'title',
        @author => 'author'
    }

  end

  def to_xml(options)

    doc = super

    #xml_file.close

    el = doc.root.add_element('product', {
        'price' => @price,
        'amount' => @amount
    })

    el.add_element('book', {
        'title' => @title,
        'author' => @author
    })

    file = File.new(@file_name, "w:UTF-8")
    doc.write(file, 2)
    file.close

  end

end