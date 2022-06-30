class Enigma

    def initialize()
        @cipher = ("a".."z").to_a << " "
        @encoder = []
        @string = ''
        @result = {}
    end

    def file_handler(read,write, key = random_key, date = Date.today.strftime("%d%m%y"))
        message = File.open(read, "r").read
        new_file = File.open(write, "w")
        if read == 'message.txt'
            encrypted = encrypt(message)
            new_file.write(encrypted[:encryption])
            puts "Created '#{write}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
        else
            decrypted = decrypt(message, "02715", "040895")
            new_file.write(decrypted[:decryption])
            puts "Created '#{write}' with the key #{decrypted[:key]} and date #{decrypted[:date]}"
        end 
        new_file.close
    end 

    def encrypt(message, key = random_key, date = Date.today.strftime("%d%m%y"))
        encoder(key,date)
        @result = {encryption: @string, key: key, date: date}
        @result[:encryption] = helper_method(message)
        @result
    end

    def decrypt(message, key = random_key, date = Date.today.strftime("%d%m%y"))
        encoder(key,date)
        @result = {decryption: @decrypted, key: key, date: date}
        @result[:decryption] = helper_method(message)
        @result
    end

    def crack(message, date = Date.today.strftime("%d%m%y"))
        # 
        offsets = (date.to_i ** 2).to_s.chars.last(4)
        end_of_message = message.chars.last(4)
        end_of_message[0] = " " #h, original index 26 new index 7 ()
        end_of_message[1] = "e" #s, original index 18 new index 4
        end_of_message[2] = "n" #s, original index 18 new index 13
        end_of_message[3] = "d" #i, original index 8 new index 3

        decrypted = "" + " end"
        key = ""

        result = {decryption: decrypted, key: key, date: date}
        binding.pry
    end

    def helper_method(message)
        i = 0
        message.downcase.chars.each do |letter|
            if !@cipher.include?(letter)
                @string << letter
            else
            index = @cipher.find_index(letter)  
                if @result.keys.include?(:encryption)
                    @string << @cipher.rotate(@encoder[i])[index]
                else
                    @string << @cipher.rotate(-@encoder[i])[index]
                end
                i += 1
                if i == @encoder.length 
                    i = 0 
                end 
            end 
        end
         @string
    end 

    def encoder(key,date)
        offsets = (date.to_i ** 2).to_s.chars.last(4)
        @encoder << (key[0..1].to_i + offsets[0].to_i)
        @encoder << (key[1..2].to_i + offsets[1].to_i)
        @encoder << (key[2..3].to_i + offsets[2].to_i)
        @encoder << (key[3..4].to_i + offsets[3].to_i)
    end

    def random_key
        x = rand(1..5)
        key = x.times.map { rand(0..9) }.join   
        if x < 5
            key = key.rjust((5), "0")
        end
        return key
    end    
end 