#!/bin/bash

#this makes a folder in the present working directory with name task2
mkdir -p task2
echo "Folder created"

#this makes 3 empty files inside the folder we created above
touch task2/file1.txt task2/file2.txt task2/file3.txt
echo "Files created"

#Made another folder and copied files into it 
mkdir -p task2_temp
cp task2/* task2_temp/
echo "Files copied to second folder"

#Swap both folder names
mv task2 temp_swap
mv task2_temp task2
mv temp_swap task2_temp
echo "Folder names swapped."

echo "Deployment pipeline script completed successfully."
