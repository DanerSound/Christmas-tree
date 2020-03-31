simbols_occurences = [1, 3, 5, 1]
asterisco = "*"
newline = "\n"
tree_aligner = 0


def space_printer(space_number):
    if space_number == 5:
        space_to_print = 5
    elif space_number == 1 or space_number == 4:
        space_to_print = (max(simbols_occurences) - 1) / 2
    elif space_number == 2:
        space_to_print = space_number - 1
    elif space_number == 3:
        space_to_print = 0

    for index in range(0, int(space_to_print)):
        print(" ", end='')
    return


for occurrence in simbols_occurences:
    space_printer(5)
    tree_aligner = tree_aligner + 1
    space_printer(tree_aligner)
    for number in range(0, occurrence):
        print(asterisco, end='')

    print(newline)


print("  Merry Xmas! ")
