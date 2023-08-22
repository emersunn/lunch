# Lunch Picker Script

This is a Bash script that randomly chooses a lunch option from a predefined list and ensures that the same option is not chosen from the last 5 days.

## Usage

1. Clone this repository or download the `lunch_picker.sh` file.

2. Make the script executable with the following command:

```bash
chmod +x lunch_picker.sh
```

3. Run the script:

```bash
./lunch_picker.sh
```

The script will print the chosen lunch option along with the current date in the format "Lunch for [date] will be [option]".

## Customization

If you want to add or modify lunch options, open the `lunch_picker.sh` file in a text editor, and edit the `lunch_options` array. Simply add or remove options as needed:

```bash
# Define the lunch options
lunch_options=("tacos" "pizza" "burger" "sandwich")
```
