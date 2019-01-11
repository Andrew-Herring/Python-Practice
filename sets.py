# Add four of your favorite car model names to a set.

showroom = {"honda", "toyota", "mazda", "cadillac"}

# Print the length of your set.

print ("I have", len(showroom), "cars.")

# Pick one of the items in your show room and add it to the set again.

showroom.add("mazda")

# Print your showroom. Notice how there's still only one instance of that model in there.

print("no extra mazda: ", showroom)

# Using update(), add two more car models to your showroom with another set.

showroom.update({"rocket", "boat"})
print("added a rocket and a boat: ", showroom)

# You've sold one of your cars. Remove it from the set with the discard() method.

showroom.discard("boat")
print("sold my boat: ", showroom)

# Now create another set of cars in a variable junkyard. Someone who owns a junkyard full of old cars has approached you about buying the entire inventory. In the new set, add some different cars, but also add a few that are the same as in the showroom set.

junkyard = {"mazda", "honda", "submarine", "dirt bike", "tundra"}
print("junkyard: ", junkyard)

# Use the intersection method to see which cars exist in both the showroom and that junkyard.

intersection = showroom.intersection(junkyard)
print("vehicles in both: ", intersection)

# Now you're ready to buy the cars in the junkyard. Use the union method to combine the junkyard into your showroom.

union = showroom.union(junkyard)

print("all unique vehicles: ", union)
