import re
import sys

def remove_links(filename):
    with open(filename, 'r') as file:
        lines = file.readlines()

    new_lines = []
    for line in lines:
        # Using regex to remove localhost links
        new_line = re.sub(r'\[([^\]]+)\]\(http://localhost:[0-9]+/[^)]+\)', r'\1', line)
        # Using regex to remove links containing "#ref"
        new_line = re.sub(r'\[([^\]]+)\]\([^)]*#ref[^)]*\)', r'\1', new_line)
        new_line = re.sub(r'\[([^\]]+)\]\([^)]*#tbl[^)]*\)', r'\1', new_line)
        new_line = re.sub(r'\[([^\]]+)\]\([^)]*#fig[^)]*\)', r'\1', new_line)
        # Using regex to remove image links with pattern [![](image_source)](link)
        new_line = re.sub(r'\[\!\[\]\([^\)]+\)\]\([^\)]+\)', '', new_line)
        new_lines.append(new_line)

    with open(filename, 'w') as file:
        file.writelines(new_lines)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Please provide the filename as an argument.")
    else:
        filename = sys.argv[1]
        remove_links(filename)
        print(f"Removed localhost links, #ref links, and image links from {filename}.")
