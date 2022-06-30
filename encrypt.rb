
require 'pry'
require 'date'
require './lib/enigma'
# two command line arguments. The first is an existing file that contains a message to encrypt. 
# The second is a file where your program should write the encrypted message.

ARGV == ["message.txt", "encrypted.txt"]
ARGV[0] == "message.txt"
ARGV[1] == "encrypted.txt"
# binding.pry


Enigma.new.file_handler(ARGV[0], ARGV[1])