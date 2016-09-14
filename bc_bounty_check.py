"""####################
Author: Nathan Mador-House
####################"""

#######################
"""####################
Index:
    1. Imports and Readme
    2. Functions
    3. Main
    4. Testing
####################"""
#######################

###################################################################
# 1. IMPORTS AND README
###################################################################

from bs4 import BeautifulSoup
import urllib.request
import re

# Searches for new open issues from BC open government pay for pull program.

###################################################################
# 2. FUNCTIONS
###################################################################

BOUNTIES_URL = "https://github.com/search?utf8=%E2%9C%93&q=org%3Abcgov+%241000&type=Issues&ref=searchresults"

class Bounty():
    """ Bounty object """


    def __init__(self):
        self.title = ""
        self.status = None
        self.url = ""


    def __init__(self, title, status, url):
        self.title = title
        self.status = status
        self.url = url

    def set_title(self, title):
        self.title = title
    def set_status(self, status):
        self.status = status
    def set_url(self, url):
        self.url = url

def make_html(url):
    """ Make soup object """

    html = urllib.request.Request(url)
    response = urllib.request.urlopen(html)
    html_response = response.read().decode('utf-8')
    the_soup = BeautifulSoup(html_response, 'html.parser')
    return the_soup


def previous_bounties(bounties_list):
    """ Get list of previous bounties """

    previous_bounties = []
    with open(bounties_list, 'r') as text_file:
        previous_bounties = text_file.readlines()

    number_of_previous_bounties = len(previous_bounties)
    print("Previous Bounties: " + str(number_of_previous_bounties))
    for i in previous_bounties:
        print(str(i).strip())


def current_bounties(soup):
    """ Get list of current bounties """

    # Active Bounties
    active_bounties = soup.find_all("svg", class_="octicon octicon-issue-opened open")
    total_active_bounties = len(active_bounties)
    print("Active Bounties: " + str(total_active_bounties))

    # Bounties listed
    bounties = soup.find_all(class_="issue-list-item public")
    total_current_bounties = len(bounties)
    print("Total bounties: " + str(total_current_bounties))

    # Bounty links
    bounty_links = soup.find_all("a", href=re.compile("/bcgov/"))
    print(bounty_links[0])
    # dict of [Title, Status, Link]


def save_current_bounties(bounties, bounties_file):
    for i in bounties:
        with open(bounties_file, 'w') as text_file:
            text_file.write(i)


def make_bounty_objects():
    bounty_object_list = []

    full_html_thingy = soup.find_all("svg")
    for i in full_html_thingy:
        bounty_object_list.append(Bounty())

    bounty_links = soup.find_all("a", href=re.compile("/bcgov/"))
    for i in bounty_links:
        bounty_object_list.append()

###################################################################
# 3. MAIN
###################################################################

def main(url):

    soup = make_html(url)
    # previous_bounties('previous_bounties.txt')
    current_bounties(soup)

main(BOUNTIES_URL)

###################################################################
# 4. TESTING
###################################################################
