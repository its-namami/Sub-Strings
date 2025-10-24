def substring(dict, search)
  split_search = search.split('')

  dict.select {|word|
    split_word = word.split('')
    split_word & split_search == split_word
  }.tally
end

def ask_dict (words = [])
  print "Add a word (write __STOP__ to stop)\n>>> "
  word = gets.chomp
  puts
  ask_dict words << word unless word == '__STOP__'
  words
end

def ask_string
  print "Enter the text\n>>> "
  text = gets.chomp
  text
end

puts "Welcome to Substring Search!"
puts "Substrings:\n#{substring(ask_dict, ask_string)}"
