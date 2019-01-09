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