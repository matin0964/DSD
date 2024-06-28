# Vector Processor
## Explanation
In this project, we are trying to create a processor that supports vector arithmetic (additon and multiplication) and vector storage.

## How to run
In directory named "Code" we have some .v files. In order to run the project in the simplest possible way, you just need to open modelsim, then do the following:
1. Under file, select new/project
2. Select a Name for your project like "processor"
3. After selecting ok, you will see a window like this:
    ![image](https://github.com/matin0964/DSD/assets/119667054/f7a5751d-0dc3-440f-b22e-895ce9ad583f)

select "Add Existing File" and then add the all .v files contained in the directory "Code"
4. Then you'll need to compile all these files, for that just select all of them (for example using Ctrl + A) and the right click on the selected items and under "Compile", choose "Compile All".
The next step is to run test bench.
5. under "Simulate" select "Start Simulation" and then "TB" under work and then press "ok":
![image](https://github.com/matin0964/DSD/assets/119667054/5f3a5d46-08a9-4866-ac5d-18f734d1e2ac)

6. Then choose "Run-All" under "Simulate/Run" and in the window "Transcript" see the results of the changes in each step. (Or you can open wave for the module)
7. Review results to see that the processor is working correctly and add Your own instructions to the TB file if you want to get your desired results.

Feel free to view the Documentaion in directory "Document" named "report_401110329" to see the report I designed for the project for better understanding of how it's implemented and how it works.

## Author

Matin Mohammadi

