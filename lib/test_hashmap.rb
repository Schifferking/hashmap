# frozen_string_literal: true

require_relative 'hashmap'

# NOTE: the commented set calls overwrite previous entries; overwriting could
# happen because a bad implementation of the hash method

test = HashMap.new
test.set('apple', 'red')
# test.set('banana', 'yellow')
test.set('bleach', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
# test.set('frog', 'green')
test.set('freckle', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
# test.set('ice cream', 'white')
test.set('islands', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
# test.set('lion', 'golden')
test.set('lime', 'golden')

print "current hash capacity: #{test.capacity}\n"
print "entries before overwriting lime entry: #{test.entries}\n\n"

# overwriting existing entry
test.set('lime', 'opal')
print "entries after overwriting lime entry: #{test.entries}\n\n"

# growing hash after full capacity
test.set('mold', 'silver')
print "hash capacity after grow: #{test.capacity}\n"
print "entries after grow: #{test.entries}\n\n"

# overwriting entry since growing hash
test.set('mold', 'teal')
print "entries after overwriting mold entry: #{test.entries}\n\n"

print "testing \"get\" method with existing key \"hat\": #{test.get('hat')}\n"
print "testing \"get\" method with non existing key \"crown\": #{test.get('crown')}\n\n"

print "testing \"has\" method with existing key \"dog\": #{test.has?('dog')}\n"
print "testing \"has\" method with non existing key \"cat\": #{test.has?('cat')}\n\n"

print "removing \"grape\" entry\n"
print "\"grape\" entry: #{test.remove('grape')}\n\n"
print "entries after removing \"grape\" entry: #{test.entries}\n\n"

print "testing \"keys\" method: #{test.keys}\n\n"

print "testing \"values\" method: #{test.values}\n\n"

print "testing \"clear\" method\n"
test.clear
print "entries after \"clear\" method: #{test.entries}\n"
print "entries count after \"clear\" method: #{test.entries.length}\n"
