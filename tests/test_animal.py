import unittest
import sys
sys.path.append('../')
from animal import Animal
from animal import Dog

class TestAnimal(unittest.TestCase):


  # uses an instance of dog so it doesn't need to be established in every test
  @classmethod
  def setUpClass(cls):
    cls.bob = Dog("Bob")

  def test_animal_creation(self):
    murph = Dog("Murph")
    self.assertIsInstance(murph, Dog)

  def test_dog_has_name(self):
    result = self.bob.get_name()
    expected = "Bob"
    self.assertEqual(result, expected)

  def test_can_set_species(self):
    self.assertEqual(self.bob.get_species(), "Dog")
    self.bob.set_species("canine")
    self.assertEqual(self.bob.get_species(), "canine")

  def test_animal_walking(self):
    animal = Animal()
    with self.assertRaises(ValueError):
      animal.walk()

  def test_set_legs(self):
    animal = Animal()
    animal.set_legs(12)
    animal.walk()
    speed = animal.speed
    self.assertEqual(speed,1.2)


  # def test_dog_walking_when_no_legs(self):


if __name__=='__main__':
  unittest.main()    