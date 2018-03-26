class Bob

  def hey(input)
    @input = input
    return 'Fine. Be that way!' if nothing?
    return 'Woah, chill out!' if shout?
    return 'Sure.' if question?
    "Whatever."
  end

  def nothing?
    @input.match(/\s+/).to_s == @input
  end

  def question?
    @input[-1] == '?'
  end

  def shout?
    return false unless @input.match(/[A-Z]/)
    !@input.match(/[a-z]/)
  end

end