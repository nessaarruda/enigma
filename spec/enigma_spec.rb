require 'date'
require './lib/enigma'
require 'pry'
require 'rspec'

RSpec.describe Enigma do
    before :each do
      @enigma = Enigma.new  
    end

    it 'encrypt a message with a key and date' do
        result = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
            }
        expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(result)
    end

    it 'encrypt a message with a key and date' do
        result = {
                encryption: "vjqtbeaweqihssi",
                key: "08304",
                date: "291018"
            }
        expect(@enigma.encrypt("hello world end", "08304", "291018")).to eq(result)
    end
    it 'crack an encryption with a date' do
        result = {
                decryption: "hello world end",
                date: "291018"
            }
        expect(@enigma.crack("vjqtbeaweqihssi", "291018")).to eq(result)
    end
    xit 'crack an encryption (uses todays date)' do
        result = {
                decryption: "hello world end",
                date: Date.today.strftime("%d%m%y")
            }
        expect(@enigma.crack("vjqtbeaweqihssi")).to eq(result)
    end

    it 'encrypt a message not translating chars not included in cipher' do
        result = {
                encryption: "keder ohulw!",
                key: "02715",
                date: "040895"
            }
        expect(@enigma.encrypt("hello world!", "02715", "040895")).to eq(result)
    end

    it 'encrypt a message with a key (uses todays date)' do
        result = {
                encryption: "pmjdwhugztb",
                key: "02715",
                date: Date.today.strftime("%d%m%y")
            }
        expect(@enigma.encrypt("hello world", "02715")).to eq(result)
    end
    it 'encrypt a message (generates random key and uses todays date)' do
        result = {
                encryption: "pmjdwhugztb",
                date: Date.today.strftime("%d%m%y")
            }
        expect(@enigma.encrypt("hello world")[:encryption].length).to eq(11)
        expect(@enigma.encrypt("hello world")[:date]).to eq(result[:date])
        expect(@enigma.encrypt("hello world")[:key].length).to eq(5)
    end
    
    it 'decrypt a message with a key and date' do
        result = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
            }
        expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(result)
    end

    it 'decrypt a message not translating char not included in cipher' do
        result = {
                decryption: "hello world!",
                key: "02715",
                date: "040895"
            }
        expect(@enigma.decrypt("keder ohulw!", "02715", "040895")).to eq(result)
    end

    it 'decrypt a message with a key and date' do
        result = {
                decryption: "hello world",
                key: "02715",
                date: Date.today.strftime("%d%m%y")
            }
        expect(@enigma.decrypt("pmjdwhugztb", "02715")).to eq(result)
    end
end 