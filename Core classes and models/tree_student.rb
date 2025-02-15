class StudentTree
  include Enumerable

  class Node
    attr_accessor :student, :left, :right
  
    def initialize(student)
      @student = student
      @left = nil
      @right = nil
    end
  end

  def initialize
    @root = nil
  end

  def insert(student)
    @root = insert_recursively(@root, student)
  end

  def each(&block)
    traverse_in_order(@root, &block)
  end

  private

  def insert_recursively(node, student)
    return Node.new(student) if node.nil?

    if student.birthdate < node.student.birthdate
      node.left = insert_recursively(node.left, student)
    else
      node.right = insert_recursively(node.right, student)
    end

    node
  end

  def traverse_in_order(node, &block)
    return if node.nil?

    traverse_in_order(node.left, &block)
    yield node.student
    traverse_in_order(node.right, &block)
  end
end