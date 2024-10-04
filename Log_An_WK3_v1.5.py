# Hunter Joseph Connell - ISS 212 - Assignment 2
# Resources referenced: "Help we do this assignment. I DO NOT have the log file used in the assignment,
# so we dont actually need to make it work.(ChatGPT)


# Function used to read the log file in the folder.
def read_log_file(file_path):
   # Opening and reading of the file only.
    with open(file_path, 'r') as file:
        return file.readlines()

# Function used to find the keywords that are designated as threats
def find_security_threats(logs):
    suspicious_keywords = ['failed login', 'suspicious activity', 'root access']
    for line in logs:
        for keyword in suspicious_keywords:
            if keyword in line.lower():
                print("Security Threat Found: ", line.strip())
                #looking for and returining a variable that matches the text. Removal of spaces also done.

# Main.
def main():
    log_entries = read_log_file('access.log')
    if log_entries:
        find_security_threats(log_entries) # If find_security_threats runs and finds key words it prints.
    else:
        print("No log entries found or log file is empty.")
    #else if no sus keywords are found, the script prints above statement.

# Run of the script via main.
if __name__ == "__main__":
    main()
