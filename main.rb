def parse_search(search)
  search.split(' ').inject([]) do |map, word|
    map << word.downcase.split('').select {|ch| ('a'..'z') === ch}.join
  end
end

def substring(dict, search_words)
  dict.each.with_object([]) do |d_word, entries|
    entries << search_words.each.with_object([]) {|word, arr|
      arr << word.scan(d_word)
    }
  end.flatten.tally
end

def ask_dict (words = [])
  print "Add a word (write __STOP__ to stop)\n>>> "
  word = gets.chomp
  puts
  ask_dict words << word unless word == '__STOP__'
  words
end

def ask_search
  print "Enter the search text\n>>> "
  text = gets.chomp
  parse_search(text)
end

puts "Welcome to Substring Search!"
puts "Substrings:\n#{substring(ask_dict, ask_search)}"
