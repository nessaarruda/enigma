# our command line arguments. 
# The first is an existing file that contains an encrypted message. 
# The second is a file where your program should write the decrypted message. 
# The third is the key to be used for decryption. 
# The fourth is the date to be used for decryption. 
# In addition to writing the decrypted message to the file, 
# your program should output to the screen the file it wrote to, 
# the key used for decryption, and the date used for decryption.


require 'pry'
require 'date'
require './lib/enigma'

ARGV == ["encrypted.txt","decrypted.txt","02715","040895"]
ARGV[0] == "encrypted.txt"
ARGV[1] == "decrypted.txt"
ARGV[2] == "02715"
ARGV[3] == "040895"
# binding.pry


Enigma.new.file_handler(ARGV[0], ARGV[1], ARGV[2], ARGV[3])