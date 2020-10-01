# 14.33_short_paper
Code for 14.33 short research paper


add_col.py: this file adds a new column to the CSV. It converts the setnece string into a numeric rank of increasing severity. Then it adds a column to the CSV     
						labeled sentnencerank. 

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
	
