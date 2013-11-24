class SuffixHistogram
  def count_words(name_list)
    lines = name_list.split("\n")
    names = []
    lines.each do |line|
      name, number = line.split("\t")
      names << name
    end
            
    suffixes = names.map do |line|
      line.split(" ").last
    end

    suffix_hash = Hash.new(0)
    suffixes.each do |suffix|
      suffix_hash[suffix] += 1
    end

    suffix_hash = suffix_hash.sort_by do |suffix, value|
      value * -1
    end

    suffix_string = ""
    suffix_hash.each do |suffix, count|
      suffix_string += "#{suffix} #{count}\n"
    end

    suffix_array = suffix_string.split("\n")
    suffix_array = suffix_array[0..11]

    suffix_array.join("\n") + "\n"
  end
end
