def substrings(statement, dictionary)
    hash = Hash.new(0)
    downcase_statement = statement.downcase()

    # for each entry in the dictionary check if it is a substring in the given statement
    dictionary.each do |entry|
        if downcase_statement.include?(entry)
            hash[entry] = downcase_statement.scan(entry).length()
        end
    end

    return hash
end

# dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# p substrings("Howdy partner, sit down! How's it going?", dictionary)
# p substrings("below", dictionary)
