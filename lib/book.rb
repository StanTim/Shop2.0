#Создадим класс для Книг
# который наследуется у продукта

class Book < Product
  def update(options)
    @title = options[:title]
    @author = options[:author]
  end

  def info
    "Книга #{@title}, #{@author}"
  end
end