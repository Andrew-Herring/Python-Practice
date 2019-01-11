# Create a tuple named zoo that contains your favorite animals.
zoo = ("Dragon", "Siren", "Werewolf", "Troll", "Mothra", "Kraken", "Minotaur")
print("Our strange little zoo", zoo)
# Find one of your animals using the .index(value) method on the tuple.
monster = zoo.index("Siren")
print("Monster entered is index... ", monster)
# Determine if an animal is in your tuple by using value in tuple.
if "Mothra" in zoo:
  print("The city is safe")
else: 
  print("It escaped!")
# Create a variable for each of the animals in your tuple with this cool feature of Python.
(dragon, siren, werewolf, troll, mothra, kraken, minotaur) = zoo
print(siren)
# Convert your tuple into a list.
zoo_list = list(zoo)
print("Now a list", zoo_list)
# Use extend() to add three more animals to your zoo.
new_monsters = ["Centaur", "Cyclops", "Unicorn"]
zoo_list.extend(new_monsters)
print("List with new additions...", zoo_list)
# Convert the list back into a tuple.
zoo = tuple(zoo_list)
print("Back to being a tuple", zoo)