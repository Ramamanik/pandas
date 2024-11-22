problem
----------
Bank of Ireland has requested that you detect invalid transactions in December 2022.
An invalid transaction is one that occurs outside of the bank's normal business hours.
The following are the hours of operation for all branches:

Monday - Friday 09:00 - 16:00
Saturday & Sunday Closed
Irish Public Holidays 25th and 26th December

Determine the transaction ids of all invalid transactions.

Approach
-----------
To solve this problem, I use the pandas library in Python. I will first preprocess the dataset by extracting the day, hour, and weekday information from the timestamp. 
Then, I will filter the dataset to include only the transactions that fall outside of the bank's business hours, including weekends and public holidays. 
Finally, I will extract the unique transaction IDs of these invalid transactions.

import pandas as pd
import numpy as np
import datetime as dt

boi_transactions["day"] = boi_transactions["time_stamp"].dt.day
boi_transactions["hour"] = boi_transactions["time_stamp"].dt.hour
boi_transactions["weekday"] = boi_transactions["time_stamp"].dt.weekday

df_day = boi_transactions.loc[
    (boi_transactions["day"] == 25) | (boi_transactions["day"] == 26), :
]
df_hour = boi_transactions.loc[
    (boi_transactions["hour"] >= 16) | (boi_transactions["hour"] < 9), :
]
df_weekend = boi_transactions.loc[
    (boi_transactions["weekday"] == 5) | (boi_transactions["weekday"] == 6), :
]
result = pd.concat([df_day, df_hour, df_weekend])
result = result["transaction_id"].unique()
