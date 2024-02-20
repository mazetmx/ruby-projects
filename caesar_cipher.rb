def caesar_cipher(string, shift)
    shifted_bytes = string.bytes().map do |byte|
        # The following formula is used to loop around between two values:
        # (startingValue - minimumValue + (offset % modulus) + modulus) % modulus + minimumValue
        if byte.between?(97, 122)
            (byte - 97 + (shift % 26) + 26) % 26 + 97
        elsif byte.between?(65, 90)
            (byte - 65 + (shift % 26) + 26) % 26 + 65
        else
            byte
        end
    end
    
    return shifted_bytes.map{|byte| byte.chr()}.join()
end

# p caesar_cipher("What a string!", 5)
# p caesar_cipher("Bmfy f xywnsl!", -5)
