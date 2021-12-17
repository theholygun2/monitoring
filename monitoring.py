import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import matplotlib.dates as mdates
import mysql.connector
import datetime

mydb = mysql.connector.connect(host='localhost', user='dbadmin', password='inidbadmin', database='monitoring')

mycursor=mydb.cursor()
mycursor.execute("SELECT * FROM status")
result = mycursor.fetchall

idList = []
waktuList = []
cpuList = []
ramList = []

for i in mycursor:
    waktuList.append(i[1])
    cpuList.append(i[2])
    ramList.append(i[3])

dates = mdates.date2num(waktuList)

plot1 = plt.figure(1)
plt.plot_date(dates, ramList)
plt.xlabel("Time")
plt.ylabel("Ram Usage")
plt.title("Ram Usage per Minute")

plot2 = plt.figure(2)
plt.plot_date(dates, cpuList)
plt.xlabel("Time")
plt.ylabel("CPU Usage")
plt.title("CPU Usage per Minute")

plt.show()
