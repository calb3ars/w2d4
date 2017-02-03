def anagram?(string, anagram)
  array = string.chars
  permutations(array).map(&:join).include?(anagram)
end


def permutations(array)
  return [array] if array.length == 1
  last = array[-1]
  perms = permutations(array[0..-2])
  res = []

  perms.each do |perm|
    array.length.times do |i|
      res << perm.dup.insert(i, last)
    end
  end

  res
end


# p anagram?("gizmohelloworld", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true

def second_anagram(string, anagram)
  string_arr = string.chars
  anagram_arr = anagram.chars
  until string_arr.empty? && anagram_arr.empty?
    if anagram_arr.include?(string_arr[0])
      anagram_arr.delete(string_arr[0])
      string_arr.shift
    else
      return false
    end
  end
  true
end

# n = Time.now
# second_anagram("gizmohelloworldgizmohelloworldgizmohelloworld", "sally")    #=> false
# v = Time.now - n
# p second_anagram("elvis", "lives")    #=> true

def third_anagram(string, anagram)
  string.chars.sort == anagram.chars.sort
end
# m = Time.now
# third_anagram("gizmohelloworldgizmohelloworldgizmohelloworld", "sally")    #=> false
# # p third_anagram("elvis", "lives")    #=> true
# x = Time.now - m
# p v - x

def fourth_anagram(string, anagram)
  hash = Hash.new(0)

  string.chars.each do |char|
    hash[char] += 1
  end

  anagram.chars.each do |char|
    hash[char] -= 1
  end

  hash.all?{ |_,v| v == 0 }

  # string_hash = Hash.new(0)
  # anagram_hash = Hash.new(0)
  #
  # string.chars.each do |char|
  #   string_hash[char] += 1
  # end
  #
  # anagram.chars.each do |char|
  #   anagram_hash[char] += 1
  # end
  #
  # string_hash == anagram_hash
end

p fourth_anagram("gizmo", "sally")
p fourth_anagram("elvis", "lives")    #=> true
