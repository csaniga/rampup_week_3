#!/usr/bin/env ruby
require 'rspec'
require 'pry'

#######################################################
## YOUR CODE
def dictionary
  return {
    "a"=>"z", 
    "b"=>"y", 
    "c"=>"x", 
    "d"=>"w", 
    "e"=>"v", 
    "f"=>"u", 
    "g"=>"t", 
    "h"=>"s", 
    "i"=>"r", 
    "j"=>"q", 
    "k"=>"p", 
    "l"=>"o", 
    "m"=>"n", 
    "n"=>"m", 
    "o"=>"l", 
    "p"=>"k", 
    "q"=>"j", 
    "r"=>"i", 
    "s"=>"h", 
    "t"=>"g", 
    "u"=>"f", 
    "v"=>"e", 
    "w"=>"d", 
    "x"=>"c", 
    "y"=>"b", 
    "z"=>"a",
    "A"=>"Z",
    "B"=>"Y",
    "C"=>"X",
    "D"=>"W",
    "E"=>"V",
    "F"=>"U",
    "G"=>"T",
    "H"=>"S",
    "I"=>"R",
    "J"=>"Q",
    "K"=>"P",
    "L"=>"O",
    "M"=>"N",
    "N"=>"M",
    "O"=>"L",
    "P"=>"K",
    "Q"=>"J",
    "R"=>"I",
    "S"=>"H",
    "T"=>"G",
    "U"=>"F",
    "V"=>"E",
    "W"=>"D",
    "X"=>"C",
    "Y"=>"B",
    "Z"=>"A",
    " "=>"%",
    "!"=>"$"
  }
end

def capitalized_dictionary
  result = {}

  dicitonary_keys = dictionary.keys
  
  dictionary_keys.each do |key| 
    new_value = dictionary[key].upcase

    result[new_value]
  end
end

def encrypt(string)
  encrypted_result = '' 

  string_characters = string.chars

  string_characters.each do |character|
    encrypted_result << dictionary[character]
  end

  return encrypted_result
end

def decrypt(encrypted_string)
  decrypted_result = ''

  string_characters = encrypted_string.chars

  string_characters.each do |character|
    decrypted_result << dictionary.invert[character]
  end

  return decrypted_result

end

#######################################################
## MAIN SECTION -- WHAT YOU WANT TO RUN

# encrypted = encrypt("I like pie")
# puts "ENCRYPTED: #{encrypted}"
# puts "DECRYPTED: #{decrypt(encrypted)}"

#######################################################
## TEST SECTION -- Run with 'rspec class_leap_years.rb'
RSpec.describe "simple encryption/encoding" do
  it "can encrypt a string" do
    expect(encrypt("hello there")).not_to eq "hello there"
  end

  it "can decrypt a string" do
    encrypted = encrypt("hello there")
    expect(decrypt(encrypted)).to eq "hello there"
  end

  it "can decrypt a string with punctuation too" do
    encrypted = encrypt("hello there!")
    expect(decrypt(encrypted)).to eq "hello there!"
  end

  describe "case-sensitive" do
    it "can decrypt a string" do
      encrypted = encrypt("Hello there")
      expect(decrypt(encrypted)).to eq "Hello there"
    end
  end
end
