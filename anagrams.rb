#Phase I

def first_anagram?(string1, string2)
  string1.chars.permutation.to_a.include?(string2.chars)
end

def second_anagram?(string1, string2)
  string1 = string1.chars
  string2 = string2.chars
  string1_dup = string1.dup
  string2_dup = string2.dup

  string1.each do |letter|
    string2_dup.delete_at(string2_dup.index(letter)) unless string2_dup.index(letter).nil?
  end

  string2.each do |letter|
    string1_dup.delete_at(string1_dup.index(letter)) unless string1_dup.index(letter).nil?
  end

  string1_dup.length == 0 && string2_dup.length == 0

end

def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end

def fourth_anagram?(string1, string2)
  anagram_hash = Hash.new {|h,k| h[k] = [0,0] }
  string1.each_char do |char|
    anagram_hash[char][0] += 1
  end

  string2.each_char do |char|
    anagram_hash[char][1] += 1
  end

  anagram_hash.all? { |key, value| value[0] == value[1]}
end
