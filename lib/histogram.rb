class Histogram
  def count_words(name_list)
    lines = name_list.split("\n")

    prefixes = lines.map do |line|
      line.split(" ").first
    end

    prefix_hash = Hash.new(0)
    prefixes.each do |prefix|
      prefix_hash[prefix] += 1
    end

    prefix_hash = prefix_hash.sort_by do |prefix, value|
      value * -1
    end

    prefix_string = ""
    prefix_hash.each do |prefix, count|
      prefix_string += "#{prefix} #{count}\n"
    end

    prefix_array = prefix_string.split("\n")
    prefix_array = prefix_array[0..6]

    prefix_array.join("\n") + "\n"
  end
end

