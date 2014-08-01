print "Enter a bunch of letters: "

input = gets.chomp.downcase.split('')
vowels = ["a", "e", "i", "o", "u"]
letters = []

input.select do |letter|
  if vowels.include?(letter)
    letters << letter
  end
end

vowels.each do |vowel|
  if letters.count(vowel) > 0
    puts "#{vowel} = #{letters.count(vowel)}"
  end
end
