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

  def product_input
    puts 'Введите исполнителя'
    @artist = STDIN.gets.chomp
    puts 'Введите название альбома'
    @album = STDIN.gets.chomp
    puts 'Введите направление музыки'
    @style = STDIN.gets.chomp

  end

  def to_xml(options)

    doc = super

    el = doc.root.add_element('product', {
        'price' => @price,
        'amount' => @amount
    })

    el.add_element('disk', {
        'artist' => @artist,
        'album' => @album,
        'style' => @style
    })

    file = File.new(@file_name, "w:UTF-8")
    doc.write(file, 2)
    file.close



end

end