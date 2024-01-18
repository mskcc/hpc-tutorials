#!/usr/bin/env python3

def DNA_compliment(text):
    compliment = []
    rev_text = text[::-1]
    for letter in rev_text:
        if letter == "A":
            compliment.append("T")
        elif letter == "T":
            compliment.append("A")
        elif letter == "G":
            compliment.append("C")
        elif letter == "C":
            compliment.append("G")
        else:
            print("Invalid sequence")
            return
    compliment = "".join(compliment)
    return compliment

text = "AGGGGCCCTGTATAAATATAGGCCATATA"
print(DNA_compliment(text))
