import re
import sys

def remove_links(filename):
    with open(filename, 'r') as file:
        lines = file.readlines()

    new_lines = []
    for line in lines:
        # Using regex to remove the localhost links
        new_line = re.sub(r'\[([^\]]+)\]\(http://localhost:[0-9]+/[^)]+\)', r'\1', line)
        new_lines.append(new_line)

    with open(filename, 'w') as file:
        file.writelines(new_lines)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Please provide the filename as an argument.")
    else:
        filename = sys.argv[1]
        remove_links(filename)
        print(f"Removed localhost links from {filename}.")
