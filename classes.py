# Create a class that contains information about employees of a company and define methods to get/set employee name, job title, and start date.

# Consider the concept of aggregation, and modify the Company class so that you assign employees to a company.

# Create a company, and three employees, and then assign the employees to the company.


class Employee:
  
  def __init__(self, name, job_title, start_date):
    self.name = name
    self.job_title = job_title
    self.start_date = start_date


class Company(object):

    def __init__(self, company_name, date_founded):
        self.company_name = company_name
        self.date_founded = date_founded

    def get_company_name(self):

        return self.company_name
