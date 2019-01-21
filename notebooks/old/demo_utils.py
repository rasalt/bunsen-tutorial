from datetime import datetime, date
from dateutil.parser import parse

def age(birthdate):
    born = datetime.strptime(birthdate, "%Y-%m-%d")
    today = date.today()
    return str(today.year - born.year - ((today.month, today.day) < (born.month, born.day)))

def los(row):
    #start = datetime.strptime(row['start'], '%Y-%m-%dT%H:%M:%S%z')
    start = parse(row['start'])
    end = parse(row['end'])
    #end = datetime.strptime(row['end'], '%Y-%m-%dT%H:%M:%S%z')
    los = end-start
    return str(los)
