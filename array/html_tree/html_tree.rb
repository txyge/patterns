class HtmlTag
  attr_reader :name, :attributes, :children

  def initialize(name, attributes = {})
    @name = name
    @attributes = attributes
    @children = []
  end

  def add_child(child)
    @children << child
  end

  def to_s
    attributes_string = format_attributes
    "<#{@name}#{attributes_string}>#{children.map(&:to_s).join}</#{@name}>"
  end

  def count
    1 + @children.sum(&:count) # Считаем текущий тег + количество дочерних тегов
  end

  def to_number
    @children.size
  end

  def to_boolean
    !@children.empty?
  end

  private

  def format_attributes
    return '' if @attributes.empty?
    attrs = @attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
    " #{attrs}"
  end
end

class HtmlTree
  include Enumerable

  def initialize(html)
    @root = parse_html(html)
  end

  def parse_html(html)
    root_tag = HtmlTag.new('root') # Создаем корневой тег
    stack = [root_tag]

    html.scan(/<\s*(\/?)(\w+)([^>]*)>/) do |slash, tag_name, attrs|
      tag_name.strip!
      attrs.strip!

      if slash.empty? # Открывающий тег
        new_tag = HtmlTag.new(tag_name, parse_attributes(attrs))
        stack.last.add_child(new_tag)
        stack.push(new_tag)
      else # Закрывающий тег
        stack.pop
      end
    end

    root_tag # Возвращаем корневой тег
  end

  def parse_attributes(attributes_string)
    attributes = {}
    attributes_string.scan(/(\w+)="([^"]*)"/) do |key, value|
      attributes[key.to_sym] = value
    end
    attributes
  end

  def each(&block)
    traverse_depth_first(@root, &block)
  end

  def traverse_depth_first(tag, &block)
    return unless tag
    yield tag
    tag.children.each { |child| traverse_depth_first(child, &block) }
  end

  def each_breadth_first(&block)
    return unless @root
    queue = [@root]
    until queue.empty?
      current_tag = queue.shift
      yield current_tag
      queue.concat(current_tag.children)
    end
  end

  def to_s
    @root.to_s
  end

  def count
    @root.count
  end
end
