def find_palindrome(string)
  long_str = ''
  (0...string.length).each do |start|
    (0...string.length).each do |stop|
      
      sub_str = string[start, stop]

      if(sub_str == sub_str.reverse)
        if sub_str.length > long_str.length
          long_str = sub_str 
        end
      end
    end
    

  end
  long_str

end



file = File.open('gettysburg.txt', 'r')

data = ''

file.each_line do |line|
  data += line
end

puts find_palindrome(data)
