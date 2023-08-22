#!/bin/bash

# Define the lunch options
lunch_options=("tacos" "pizza" "burger" "sandwich")
# For Downtown Tempe lunch_options=("Taco Bell" "Illegal Pete's" "Mesquite Mex" "Jack's Slider House" "Slices" "Five Guys" "Jimmy John's" "Ike's Sandwiches" "Otto Pizza" "Chick-fil-A" "Jack in the Box")

# Get the number of options
num_options=${#lunch_options[@]}

# Function to get the current date in the format "Wednesday, August 3"
get_current_date() {
    date +"%A, %B %-e"
}

# Get the current date
current_date=$(get_current_date)

# Get the last 5 chosen options from the file if it exists
last_chosen_options_file=".last_chosen_options"
if [[ -f "$last_chosen_options_file" ]]; then
    last_chosen_options=($(tail -n 5 "$last_chosen_options_file"))
else
    last_chosen_options=()
fi

# Find a new lunch option that was not chosen in the last 5 days
while true; do
    # Generate a random index
    random_index=$((RANDOM % num_options))

    # Get the random lunch option
    random_lunch_option=${lunch_options[random_index]}

    # Check if it was not chosen in the last 5 days
    if [[ ! " ${last_chosen_options[*]} " =~ " $random_lunch_option " ]]; then
        break
    fi
done

# Save the current choice as one of the last chosen options
echo "$random_lunch_option" >> "$last_chosen_options_file"

# Trim the file to keep only the last 5 options
tail -n 5 "$last_chosen_options_file" > "$last_chosen_options_file.temp"
mv "$last_chosen_options_file.temp" "$last_chosen_options_file"

# Print the chosen lunch option and date
echo "Lunch for $current_date will be $random_lunch_option"
