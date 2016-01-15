def bad_two_sum?(array, target)
  (array.length - 1).times do |i|
    (i + 1...array.length).each do |j|
      return true if array[i] + array[j] == target
    end
  end
  false
end

def okay_two_sum?(array, target)
  sorted_array = array.sort

  sorted_array.each_index do |i|
    duped_array = sorted_array.dup
    duped_array.delete_at(i)
    shortened_array = duped_array
    return true if shortened_array.bsearch { |x| x == (target - sorted_array[i]) }
  end

  false
end

def hash_two_sum?(array, target)
  numbers_hash = Hash.new(0)

  array.each do |num|
    numbers_hash[num] += 1

    if num == target/2.0
      return true if numbers_hash[num] > 1
    else
      return true if numbers_hash[(target-num)] > 0
    end
  end

  false
end

def hash_four_sum?(array, target)
  two_sums_hash = Hash.new(0)

  array.each_index do |i|
    (i+1...array.length).each do |j|
      num = array[i] + array[j]
      two_sums_hash[num] += 1

      if num == target/2.0
        return true if two_sums_hash[num] > 1
      else
        return true if two_sums_hash[(target-num)] > 0
      end
    end
  end

  false

end
