####################
# Author: Nathan Mador-House
####################

#######################
# Index:
# 1. Imports and Readme
# 2. Functions
# 3. Main
# 4. Testing
#######################

###################################################################
# 1. IMPORTS AND README
###################################################################

# Use csv file of tv/movie scripts for sentiment analysis
# CSV Values:
# 0 = id
# 1 = season
# 2 = episode
# 3 = scene
# 4 = line_text
# 5 = speaker
# 6 = deleted

import csv
import positivity_check
import re
import string

###################################################################
# 2. FUNCTIONS
###################################################################
the_office_characters = {}

class Character:
    def __init__(self, name):
        self.name = name
        self.total_text = ""
 
    def print_stats(self):
        print(self.name)
        print(self.total_text)

        translator = str.maketrans('','',string.punctuation)
        str_without_pun = self.total_text.translate(translator)
        print(str_without_pun)

class Season:
    def __init__(self, season):
        self.season = season

class Episode:
    def __init__(self, episode):
        self.episode = episode

class Scene:
    def __init__(self, scene):
        self.scene = scene

def load_csv():
    # Load csv and add one character to the array so it's not empty
    with open("assets/the-office-lines-scripts-test.csv") as csvfile:
        csvfile.readline()
        reader = csv.reader(csvfile, delimiter=',')

        row1 = next(reader)
        make_char(row1[5])
        the_office_characters[row1[5]].total_text += remove_stage_directions(row1[4])
        analyze_csv(reader)

def analyze_csv(reader):
    for row in reader:
        if row[5] in the_office_characters:
            the_office_characters[row[5]].total_text += " " + remove_stage_directions(row[4])
        else:
            make_char(row[5])
            the_office_characters[row[5]].total_text += " " + remove_stage_directions(row[4])


def make_char(name):
    char = Character(name)
    the_office_characters[name] = (char)

def remove_stage_directions(text):
    result = re.sub("[\(\[].*?[\)\]]", "", text)
    return result

###################################################################
# 3. MAIN
###################################################################

def main():
    pass

###################################################################
# 4. TESTING
###################################################################

load_csv()
for c in the_office_characters:
    the_office_characters[c].print_stats()
