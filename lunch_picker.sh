#!/bin/bash

# Define the lunch options
lunch_options=("tacos" "pizza" "burger" "sandwich")

# Use this set of options if you happen to be in downtown Tempe
# lunch_options=("Taco Bell" "Illegal Petes" "Mesquite Mex" "Jack's Slider House" "Slice's" "Five Guy's" "Jimmy John's" "Tacos Calafia" "Ike's Sandwiches" "Pita Jungle" "Med Fresh Grill" "Otto's" "Chick-fil-A" "Jack in the Box")


# Get the number of options
num_options=${#lunch_options[@]}

# Function to get the current date in the format "Wednesday, August 3"
get_current_date() {
    date +"%A, %B %-e"
}

# Get the current date
current_date=$(get_current_date)

# Get the last chosen option from the file if it exists
last_chosen_option_file=".last_chosen_option"
if [[ -f "$last_chosen_option_file" ]]; then
    last_chosen_option=$(cat "$last_chosen_option_file")
else
    last_chosen_option=""
fi

# Find a new lunch option that is not the same as yesterday's choice
while true; do
    # Generate a random index
    random_index=$((RANDOM % num_options))

    # Get the random lunch option
    random_lunch_option=${lunch_options[random_index]}

    # Check if it is different from yesterday's choice
    if [[ "$random_lunch_option" != "$last_chosen_option" ]]; then
        break
    fi
done

# Save the current choice as the last chosen option for the next day
echo "$random_lunch_option" > "$last_chosen_option_file"

# Print the chosen lunch option and date
echo "Lunch for $current_date will be $random_lunch_option"
