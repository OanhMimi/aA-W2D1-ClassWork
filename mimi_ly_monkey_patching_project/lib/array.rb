# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.empty?
        return nil
    end
    self.max - self.min
  end

  def average
    if self.empty?
        return nil
    end
    self.sum/(self.length.to_f)
  end

  def median
    if self.empty?
        return nil
    end
    if self.length.odd?
        return self.sort[self.length/2]
    else
        index1 = self.length/2
        index2 = index1 - 1
        (self.sort[index1] + self.sort[index2])/2.to_f
    end
  end

  def counts
    self.tally
  end

  def my_count(value)
    count = 0
    self.each {|ele| count+=1 if ele == value}
    count
  end

  def my_index(value)
    self.each_with_index do |ele,i|
        if ele == value
            return i
        end
    end
    nil
  end

  def my_uniq
    # self | self
    self.tally.keys
  end

  def my_transpose
    new_arr = []
    (0...self.length).each do |i|
        temp_arr = []
        self.each do |subArray|
            temp_arr << subArray[i]
        end
        new_arr << temp_arr
    end
    new_arr
  end

end
