# Hunter Joseph Connell - ISS 212 - Assignment 3:Protocol
# Resources referenced: The walkthrough for Week 4 Assignment 3

protocol_name = input("Enter the protocol: ") #Part 1
if protocol_name == "Cyphersec": #Part 2
    print("Cyphersec is the only supported protocol!") #Print 3
elif protocol_name == "cybersec": #Part 4
    print("DENIED. Cyphersec protocol ONLY!") #Part 5
else: #Part 6
    print(f"Cyphersec! Not {protocol_name}!")

#Part 1: We are taking user input and turining it into a string that is assigned
#as the value of the "protocol_name" variable.

#Part 2: Using if, we generate a conditional check to verify if the string assinged to
#the "protocol_name" is "Cyphersec".

#Part 3: If the conditional check is TRUE we then print this specified string for the user.

#Part 4: If the conditional check is FALSE we move on to the ELIF and check against that line's
#chosen string.

#Part 5: As long as TRUE is returned for this check, we will print a sting.

#Part 6: If none of the above give a TRUE, this check initiates and will output the final string.
#It consisits of an F string that grabs the user given input string in the "protocol_name" variable,
#placing it in the string at the appropriate part of the sentence.