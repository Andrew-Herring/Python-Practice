stock_dict = {'GM': 'General Motors',
              'CAT': 'Caterpillar',
              'EK': 'Eastman Kodak',
              'GE': 'General Electric'}

purchases = [( 'GE', 100, 'Sept. 10th, 2001', 48 ),
             ( 'CAT', 100, 'April 1st, 1999', 24 ),
             ( 'GE', 200, 'July 1st 1998', 56 ) ]


report = {}
for purchase in purchases:
  abbrev = purchase[0]
  full_name = stock_dict[abbrev]
  no_of_shares = purchase[1]
  purch_date = purchase [2]
  purch_price = purchase[3]
  full_purchase_price = no_of_shares * purch_price
  print(f"I purchased {full_name} stock on {purch_date} for ${full_purchase_price}.")

  try:
    report[abbrev].append(purchase)
  except KeyError:
    report[abbrev] = list()
    report[abbrev].append(purchase)

for abbrev, purchase_list in report.items():
   print(f"-------{abbrev}-------")
   total_portfolio_stock_value = 0
   for purchase in purchase_list:
     total_portfolio_stock_value += purchase[1] * purchase[3]
     print(f"{purchase}")   
   print(f"Total value of stock in portfolio: ${total_portfolio_stock_value}\n\n")   


# ==== Family Dictionary ====
print("-- Family Dictionary --")

# Define a dictionary that contains information about several members of your family.

my_family = {
    'Father': {
        'name': 'Kevin',
        'age': 60
    },
    'Mother': {
        'name': 'Amanda',
        'age': 60
    },
    'Brother': {
        'name': 'Kyle',
        'age': 25
    },
    'Girlfriend': {
        'name': 'Lacey',
        'age': 27
    }
}

# Using a dictionary comprehension, produce output that looks like the following example.
# "Kyle is my brother and is 25 years old"

family_speach = set()

for family_member, member_values in my_family.items():
  family_speach.add(f"{member_values['name']} is my {family_member} and is {str(member_values['age'])} years old")

print(family_speach)
  


