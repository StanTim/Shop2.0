#Создадим класс для дисков
# который наследуется у продукта

class Disk < Product
  def update(options)
    @album = options[:album]
    @artist = options[:artist]
    @style = options[:style]
  end

  def info
    %(Диск: #{@artist} - "#{@album}"" (#{@style}))
  end
end