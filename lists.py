planet_list = ["Mercury", "Mars"]
planet_list.append("Jupiter")
planet_list.append("Saturn")

more_planets = ["Uranus", "Neptune"]

planet_list.extend(more_planets)

planet_list.insert(1, "Venus")
planet_list.insert(2, "Earth")
print(planet_list)
