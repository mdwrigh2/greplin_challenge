class Array
  def power
    # the power set line is stolen from http://johncarrino.net/blog/2006/08/11/powerset-in-ruby/
    inject([[]]){|c,y|r=[];c.each{|i|r<<i;r<<i+[y]};r}
  end

  def sum
    reduce(0) { |sum, value| sum + value }
  end
end


def largest_is_sum(array)

  count = 0
  ps = array.power
  # Remove all arrays with an insufficient number of elements
  ps = ps.select { |a| a.size >= 3 }


  ps.each do |set|
    set.sort!
    max = set.pop
    if max == set.sum
      count += 1
    end
  end
  count
end

arr = []
str = ''
File.open('numbers.csv', 'r').each_line do |line|
  str += line
end

str_arr = str.split(', ')

str_arr.each do |string|
  arr << string.to_i
end


puts largest_is_sum(arr).to_s
