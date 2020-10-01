# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import pandas as pd

a = pd.read_csv('exonerations1.csv')

l1 = []



#this adds a new column to the CSV which is the coversion from
#sentence to its numeric equivalent detailed in the paper

#iterate over each row
for i1 in a.itertuples():
    
    #find the sentence
    i = i1[14]

    
    #series of IF statements to convert sentence to its numeric rank
    if i == "Death":
        l1.append(12)
    elif i == "Life without parole":
        l1.append(11)
    elif i == "Life":
        l1.append(10)
    elif "to" and "Life" in i:
        l1.append(9)
        
    elif "to" in i:
        l1.append(8)
    
    elif "year" in i:
        l1.append(7)
    
      
    
    elif "Probation" in i:
        l1.append(6)

    elif "Community service" in i:
       l1.append(5)
       
    elif "Fine" in i:
        l1.append(4)
    elif "Not sentenced" in i:
        l1.append(3)
 
    else:
        l1.append(2)
       
       
a["sentence_num"] = l1 
      



a.to_csv(r'/Users/oliverheins/Desktop/14.33/FileName.csv')
     
        
        
        
     
  
    
        
        
    


