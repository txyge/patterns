# main.rb

require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\array\html_tree\html_tree.rb'

# Входные данные HTML
html_input = '<div class="container"><h1>Hello World</h1><p>This is a paragraph.</p></div>'
tree = HtmlTree.new(html_input)

puts "HTML Tree Structure:"
puts tree.to_s

puts "\nText Content Count:"
puts tree.count

puts "\nElements in Depth First with Index:"
tree.each_with_index { |tag, index| puts "Index #{index}: Tag: #{tag.name}" }

puts "\nElements in Breadth First:"
tree.each_breadth_first { |tag| puts "Tag: #{tag.name}" }

# Получение имен всех тегов с использованием метода `map`
tag_names = tree.map(&:name)
puts "\nAll tag names: #{tag_names.join(', ')}"

# Выбор тегов с определенным именем с использованием метода `find_all`
h1_tags = tree.find_all { |tag| tag.name == 'h1' }
puts "\nH1 tags: #{h1_tags.map(&:to_s).join(', ')}"

# Нахождение первого тега с определенным именем с использованием метода `detect`
first_div = tree.detect { |tag| tag.name == 'div' }
puts "\nFirst div tag: #{first_div}" if first_div

# Проверка, есть ли хотя бы один тег <p> с использованием метода `any?`
has_paragraph = tree.any? { |tag| tag.name == 'p' }
puts "\nContains at least one <p> tag: #{has_paragraph}"

# Проверка, все теги имеют дочерние элементы с использованием метода `all?`
all_have_children = tree.all? { |tag| tag.to_number > 0 }
puts "\nAll tags have children: #{all_have_children}"

# Исключение тегов с определенным именем с использованием метода `reject`
non_paragraph_tags = tree.reject { |tag| tag.name == 'p' }
puts "\nTags excluding paragraphs: #{non_paragraph_tags.map(&:to_s).join(', ')}"
