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
end