class RPNConverter

  def infix_to_rpn(exp)
    @output = ''
    @stack = []
    string = exp.gsub(' ', '')
    string.each_char do |char|
      case char
      when /\w/ then @output << char
      when /\)/ then close_paren
      when /\(/ then @stack << char
      else operator(char)
      end
    end
    until @stack.empty? do
      @output << @stack.pop
    end
    @output.gsub(/[()]/, "")
  end

  def precedence(op)
    case op
    when /[+-]/
      1
    when /[\*\/]/
      2
    when /[()]/
      0
    end
  end

  def close_paren
    until (@stack.last == '(' ) do
      @output << @stack.pop
    end
    @stack.pop
  end

  def operator(char)
    while !@stack.empty? && precedence(char) <= precedence(@stack.last) do
      @output << @stack.pop
    end
    @output << ' ' if @output[@output.length - 1].match /\d/
    @stack << char
  end

end
