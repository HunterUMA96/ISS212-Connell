# Hunter Joseph Connell - ISS 212 - Assignment 3:Data Security Tax
# Resources referenced: The walkthrough for Week 4 Assignment 3

data_usage = float(input("Enter your annual data usage in MB: ")) #Above, we are taking an integer via input from the user
if data_usage <= 85528: #We then compare the integer in the data_usage variable to see if it is less than or equal to the given value. If so, see below.
    tax = (0.18 * data_usage) - 556.02 #Another variable is created. We run a formula and then place the sum in the "tax" variable.
else: #If it does not and is FALSE, we then run this seperate formula.
    tax = 14839.02 + 0.32 * (data_usage - 85528)
tax = max(tax, 0)
print(f"Your Data Security Tax is: {round(tax)} MB") #we print the result.