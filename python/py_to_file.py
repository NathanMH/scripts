####################
# Author: Nathan Mador-House
# Title: Py to File
####################

####################
# Index:
#     1. Functions
#     2. Main
#     3. Testing
####################

import json

###################################################################
# 1. FUNCTIONS
###################################################################


def text_to_file(text, filename):

    with open(filename, 'a') as text_file:
        object_type = type(text)
        if object_type is list:
            for i in text:
                text_file.write(i + '\n')
        elif object_type is dict:
            json.dump(text, text_file)
        else:
            text_file.write(text + '\n')


def file_to_text(filename):

    tweets_list = []
    with open(filename, 'r') as text_file:
        for line in text_file:
            tweets_list.append(line)
    return tweets_list


###################################################################
# 2. MAIN
###################################################################

###################################################################
# 3. TESTING
###################################################################
