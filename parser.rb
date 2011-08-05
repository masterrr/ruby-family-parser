# NAME PARSER #
# ruby parser.rb source.txt > 123.txt
# How it works:
# Karabanov Dmitry Igorevich > Dmitry Igorevich
# Sentences with a comma and the point are ignored and not flagged
# The parser developed by Gosha Arinich

#!/usr/bin/env ruby
# encoding:utf-8
file_to_parse = File.open ARGV[0] # parsing file passed as first argument like `parse-names.rb some.txt`

class Person
  attr_accessor :name, :surname, :middlename, :position
  def initialize(person_string)
    # person_string = Surname Name Middlename || Name Middlename
   person_string_elements = person_string.split ' '
   if person_string_elements.size == 3
     # we have full name
     @surname = person_string_elements.first
     @name = person_string_elements[1]
     @middlename = person_string_elements.last
   else
     # we haven't surname passed
    @surname = nil
    @name = person_string_elements.first
    @middlename = person_string_elements.last
   end
  end
  
  def to_s
    "#{name} #{middlename}"
  end
end

result = Array.new

file_to_parse.each_line do |line|
  if line == '' || line.include?(',') || line.include?('.') # skipping lines with dots and colons
    result.push line
  else
    result.push Person.new(line)
  end
end

result.each do |str|
  puts str.to_s
end

