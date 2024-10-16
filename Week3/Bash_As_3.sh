

# Hunter Joseph Connell - ISS 212 - Assignment 3:Protocol
# Resources referenced: The walkthrough for Week 4 Assignment 3

# 1. Block Network Traffic Analysis
echo "About to ask for protocol name...."
read -p "Enter the packet size in bytes: " packet_size
if [ "$packet_size" -ge 100 ]; then
  echo "True - Packet meets the threshold for analysis."
else
  echo "False - Packet is too small to analyze."
fi

read -p "Enter the protocol name: " protocol_name
if [ "$protocol_name" == "Cyphersec" ]; then
  echo "Yes - Cyphersec is the best protocol ever!"
elif [ "$protocol_name" == "cyphersec" ]; then
    echo "No, I want a big Cyphersec!"
else
  echo "Cyphersec! Not $protocol_name!"
fi

read -p "Enter your annual data usage in MB: " data_usage
if [ "$data_usage" -le 85528 ]; then
  tax=$((data_usage * 18 / 100 - 556))
else
  surplus=$((data_usage - 85528))
  tax=$((14839 + surplus * 32 / 100))
fi
if [ "$tax" -lt 0 ]; then
  tax=0
fi
echo "Your Data Security Tax is: $tax MB"

read -p "Enter the year to check the patch cycle: " year
if [ "$year" -lt 2000 ]; then
  echo "Not within the managed patch period."
else
  if (( year % 4 != 0 )); then
    echo "Standard Year"
  elif (( year % 100 != 0 )); then
    echo "Patch Year"
  elif (( year % 400 != 0 )); then
    echo "Standard Year"
  else
    echo "Patch Year"
  fi
fi 