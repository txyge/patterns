require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\array\array_processing.rb'

custommethod = CustomArrayProcessor.new([1, 2, 3, 4, 5, 6, 4, 8, 5, 10])
custommethod_additionally = CustomArrayProcessor.new([11, 12, 13, 14, 15])

puts custommethod.find { |i| i % 5 == 0 } # Вывод: 5
puts custommethod.min_by { |i| -i } # Вывод: 10
puts custommethod.inject(0) { |sum, i| sum + i } # Вывод: 48
puts custommethod.one? { |i| i == 10 } # Вывод: true
puts custommethod_additionally.flat_map { |i| [i, i * 2] }  # Вывод: [11, 22, 12, 24, 13, 26, 14, 28, 15, 30]
puts custommethod.all? { |i| i < 11 }  # Вывод: true