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
characters = {}
seasons = {}
episodes = {}
scenes = {}

class Character:
    def __init__(self, season, episode, name):
        self.name = name
        self.episode = episode
        self.season = season
        self.total_text = ""
 
    def print_stats(self):
        print("Character: " + self.name)
        print(self.total_text)

class Season:
    def __init__(self, season):
        self.season = season
        self.total_text = ""
    
    def print_stats(self):
        print("Season: " + self.season)
        print(self.total_text)

class Episode:
    def __init__(self, episode):
        self.episode = episode
        self.total_text = ""

    def print_stats(self):
        print("Episode: " + self.episode)
        print(self.total_text)

class Scene:
    def __init__(self, scene):
        self.scene = scene

def load_csv():
    # Load csv and add one item to each dictionary so it's not empty
    with open("assets/the-office-lines-scripts.csv") as csvfile:
        csvfile.readline()
        reader = csv.reader(csvfile, delimiter=',')

        # Init dictionaries
        row1 = next(reader)
        make_char(row1[5], row1[1], row1[2]) 
        characters[row1[5]].total_text += remove_stage_directions_and_punctuation(row1[4])

        make_season(row1[1])
        seasons[row1[1]].total_text += remove_stage_directions_and_punctuation(row1[4])

        # Make hybrid value of season + episode
        epi_season = str(row1[1]) + str(row1[2])
        make_episode(epi_season)
        episodes[epi_season].total_text += remove_stage_directions_and_punctuation(row1[4])

        analyze_csv(reader)

def analyze_csv(reader):
    for row in reader:
        # Characters
        if row[5] in characters:
            characters[row[5]].total_text += " " + remove_stage_directions_and_punctuation(row[4])
        else:
            make_char(row[5], row[1], row[2])
            characters[row[5]].total_text += " " + remove_stage_directions_and_punctuation(row[4])
        # Season
        if row[1] in seasons:
            seasons[row[1]].total_text += " " + remove_stage_directions_and_punctuation(row[4])
        else:
            make_season(row[1])
            seasons[row[1]].total_text += " " + remove_stage_directions_and_punctuation(row[4])
 
        # Episode
        epi_season = str(row[1]) + str(row[2])
        if epi_season in episodes:
            episodes[epi_season].total_text += " " + remove_stage_directions_and_punctuation(row[4])
        else:
            make_episode(epi_season)
            episodes[epi_season].total_text += " " + remove_stage_directions_and_punctuation(row[4])
            
        # Scene
        

def make_char(name, season, episode):
    char = Character(name, season, episode)
    characters[name] = (char)

def make_season(season_number):
    season = Season(season_number)
    seasons[season_number] = season

def make_episode(episode_number):
    episode = Episode(episode_number)
    episodes[episode_number] = episode

def remove_stage_directions_and_punctuation(text):
    without_directions = re.sub("[\(\[].*?[\)\]]", "", text)
    translator = str.maketrans('','',string.punctuation)
    result = without_directions.translate(translator)

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
# for c in characters:
#     characters[c].print_stats()

for s in seasons:
    seasons[s].print_stats()

# for e in episodes:
#     episodes[e].print_stats()