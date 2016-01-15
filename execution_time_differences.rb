#Phase I
def my_min(array)
  (0...(array.length-1)).each do |i|
    return array[i] if array.all? {|other_el| array[i] <= other_el}
  end
end

#Phase II
def my_min(array)
  min = array[0]
  array.each do |element|
    min > element ? min = element : min = min
  end
  min
end

# def largest_contiguous_subsum(array)
#   sub_arrays = []
#   (0...(array.length)).each do |i|
#     (i...(array.length)).each do |j|
#       sub_arrays << array[i..j]
#     end
#   end
#
#   sub_arrays.map do |sub|
#     sub.inject(:+)
#   end.max
# end

def largest_contiguous_subsum(array)
  return array.max if array.all? {|el| el <= 0}
  max_sum = array[0]
  current_sum = 0
  array.each do |element|
    current_sum += element
    current_sum > max_sum ? max_sum = current_sum : max_sum
    current_sum = 0 if current_sum < 0
  end
  max_sum
end


# def contiguous_subsets(array)
#   return [[array.first]] if array.length == 1
#   prev_last_el = array[-2]
#   old_cont_subs = contiguous_subsets(array.take(array.count - 1))
#   new_subs = old_cont_subs.map do |sub|
#     sub + [array.last] if sub.include?(prev_last_el)
#   end
#   test = old_cont_subs.concat(new_subs).concat([[array.last]])
#   test.select { |array| array.is_a?(Array) }
# end
