class Year
  
  def initialize(year)
    @year = year
  end

  def leap?
    divisable_by?(4) && !divisable_by?(100) || divisable_by?(400)
  end

  def divisable_by?(f)
    @year%f == 0
  end

end