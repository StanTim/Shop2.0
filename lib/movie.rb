#Создадим класс для Фильмов
# который наследуется у продукта

class Movie < Product
  def update(options)
    @movie = options[:movie]
    @director = options[:director]
    @year = options[:year]
  end

  def info
    %(Фильм "#{@movie}", #{@director} (#{@year}))
  end

  def product_input
    puts 'Введите название фильма'
    @movie = STDIN.gets.chomp
    puts 'Введите режиссёра фильма'
    @director = STDIN.gets.chomp
    puts 'Введите год выхода'
    @year = STDIN.gets.chomp

  end

  def to_xml(options)

    doc = super

    el = doc.root.add_element('product', {
        'price' => @price,
        'amount' => @amount
    })

    el.add_element('disk', {
        'movie' => @movie,
        'director' => @director,
        'year' => @year
    })

    file = File.new(@file_name, "w:UTF-8")
    doc.write(file, 2)
    file.close



  end

end