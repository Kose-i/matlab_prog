#coding:utf-8
import csv

f = open('data.csv', 'ab') #ファイルが無ければ作る、の'a'を指定します

csvWriter = csv.writer(f)

val = 0
for num in range(1, 5):
   listData = []
   val = num
   for loop in range(0, 5):
      val = val * 10 + num
      listData.append(val)
      s = str(','.join(str(listData))
      print(s)
      csvWriter.writerow(s)

f.close()
