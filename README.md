# 14.33_short_paper
Code for 14.33 short research paper

add_col.py: this python file adds a new column to the CSV. It converts the setnece string into a numeric rank of increasing severity. Then it adds a column to the CSV labeled sentnencerank. 

The ranking system follows: 
Death: 12
Life without parole: 11
Life: 10
Any indeterminate term-of-years with a Life top (e.g., “10 to Life”): 9
Any determinate or indeterminate term-of-years without a Life top (e.g., “10 to 20 years”): 8
Any determinate term of years (e.g., “25 years”): 7
Probation 6
Community service: 5
Fine: 4
Not sentenced: 3
Unknown: 2



Analysis.r: contains all statitiscla analyses conducted in my research paper. There are four main parts of the code: 1. The Intial Analysis of data and mean/count calculations. It calculates the mean years between conviction and exoneration by sex, race, and many other varibales.2.  The Linear Regresson Model used in the paper. 3. Analyis of the Impact of a law allowing post-conviction DNA testing using t tests for each race. 4. Graphs

