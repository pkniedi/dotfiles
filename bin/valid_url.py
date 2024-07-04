#!/usr/bin/env python3

# Python3 program to check URL is valid or not using regular expression
import re, sys

# Function to validate URL
# using regular expression
def isValidURL(str):

    # Regex to check valid URL
    regex = ("((http|https)://)(www.)?" +
             "[a-zA-Z0-9@:%._\\+~#?&//=]" +
             "{2,256}\\.[a-z]" +
             "{2,6}\\b([-a-zA-Z0-9@:%" +
             "._\\+~#?&//=]*)")

    # Compile the ReGex
    p = re.compile(regex)

    # If the string is empty
    # return false
    if (str == None):
        return False

    # Return if the string
    # matched the ReGex
    if(re.search(p, str)):
        return True
    else:
        return False


def usage():
    print("Usage: valid_url url")


def main():
    if (len(sys.argv) != 2):
        usage()
        exit(2)
    if isValidURL(sys.argv[0]): exit(0)
    exit(1)

if __name__ == '__main__':
    main()
