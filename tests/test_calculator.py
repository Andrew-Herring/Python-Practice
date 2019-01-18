import unittest
import sys
sys.path.append('../')
from calculator import Calculator

def setUpModule():
  print('set up module')

def tearDownModule():
  print('tear down module')

class TestCalculator(unittest.TestCase):

  @classmethod
  def setUpClass(self):
    print('Set up class')
    # Create an instance of the calculator that can be used in all tests
    self.calc = Calculator()
    num1 = 2
    num2 = 6

  @classmethod
  def tearDownClass(self):
    print('Tear down class')

  def test_add(self):
    result = self.calc.add(2, 7)
    expected = 9
    self.assertEqual(result, expected)
    self.assertEqual(self.calc.add(2, 2), 4)
    self.assertEqual(self.calc.add(self.num1, self.num2), 8)

  # Write test methods for subtract, multiply, and divide


    def test_subtract(self):
      result = self.calc.subtract(7, 2)
      expected = 5 
      self.assertEqual(result, expected)
      self.assertEqual(self.calc.add(2, 2), 4)

if __name__ == '__main__':
    unittest.main()