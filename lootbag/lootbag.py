import sqlite3
import sys

loot_db = '/Users/andrewherring/nss/Backend/python/exercises/lootbag/lootbag.db'


def addChild(loot):
    with sqlite3.connect(loot_db) as lootdb:
        cursor = lootdb.cursor()
        try:
          cursor.execute(
            '''
            INSERT INTO Children
            Values(?,?)
            ''', (None, loot["name"])
                )
        except sqlite3.OperationalError as err:
          print("Oh no! ", err)


def addGift(loot):
    with sqlite3.connect(loot_db) as lootdb:
        cursor = lootdb.cursor()
        try:
          cursor.execute(
            '''
            INSERT INTO Gifts
            Values(?,?,?,?)
            ''', (None, loot["name"], loot["delivered"], loot["childId"])
                )
        except sqlite3.OperationalError as err:
          print("Oh no! ", err)



def getChild(loot):
  with sqlite3.connect(loot_db) as lootdb:
    cursor = lootdb.cursor()

  cursor.execute(f"""SELECT c.*, g.Name
                  FROM Children c
                  JOIN Gifts g
                  ON c.ChildId = g.ChildId
                  WHERE c.Name = '{loot}'
                  """)

  loot = cursor.fetchone()
  print(loot)
  return loot
  
                  

if __name__ == "__main__":
  getChild("Thrall")
  getChild("Jaina")
  getChild("Arthas")

#   addGift({
#     "name": "A Neat Hat",
#     "delivered": 0,
#     "childId": 3
#   }) 

#   addChild({
#     "name": "Arthas",
#   })

