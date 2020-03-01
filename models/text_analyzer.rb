# Your TextAnalyzer model code will go here.

class TextAnalyzer
  attr_reader :text
 
  def initialize(text)
    @text = text.downcase
  end
  
  def piglatinizer
    a = text.split(" ")
    b = a.map {|word| piglatinize_word(word)}
    b.join(" ")
  end

  def piglatinize_word(word)
    first_letter = word[0].downcase
    if ["a", "e", "i", "o", "u"].include?(first_letter)
        "#{word}way"
    else
      consonants = []
      consonants << word[0]
      if ["a", "e", "i", "o", "u"].include?(word[1]) == false
        consonants << word[1]
        if ["a", "e", "i", "o", "u"].include?(word[2]) == false
          consonants << word[2]
        end
      end
      "#{word[consonants.length..-1] + consonants.join + "ay"}"
    end
  end
  
  def original_text
    @original_text = @text
  end 
 
  def count_of_words
    words = text.split(" ")
    words.count
  end
 
  def count_of_vowels
    text.scan(/[aeoui]/).count
  end
 
  def count_of_consonants
    text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end
 
  def most_used_letter
    s1 = text.gsub(/[^a-z]/, '') # gets rid of spaces
    arr = s1.split('')
    arr1 = arr.uniq
    arr2 = {}
 
    arr1.map do |c|
      arr2[c] =  arr.count(c)
    end
 
    biggest = { arr2.keys.first => arr2.values.first }
 
    arr2.each do |key, value|
      if value > biggest.values.first
        biggest = {}
        biggest[key] = value
      end
    end
 
    biggest
  end
end