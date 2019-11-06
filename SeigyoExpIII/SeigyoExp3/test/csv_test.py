import csv # csvモジュールをインポート

stock = [["Apple", 24], ["Banana", 14], ["Orange", 8]] # 二重のリスト

time_table = range(0,10)
time_box   = range(0,10)

with open("stock.csv", "w", encoding="Shift_jis") as f: # 文字コードをShift_JISに指定
  writer = csv.writer(f, lineterminator="\n") # writerオブジェクトの作成 改行記号で行を区切る
  stock_tmp = []
  for t in time_table:
    stock_t = [t, time_box[t]]
    stock_tmp.append(stock_t)
  writer.writerows(stock_tmp) # csvファイルに書き込み
