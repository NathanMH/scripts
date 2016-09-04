#!/bin/sh

# Searches for new open issues from BC open government pay for pull program.

from bs4 import BeautifulSoup
import urllib.request

url = "https://github.com/search?utf8=%E2%9C%93&q=org%3Abcgov+%241000&type=Issues&ref=searchresults"


def make_html(url):
    html = urllib.request.Request(url)
    response = urllib.request.urlopen(html)
    return response.read().decode('utf-8')


def make_soup(html):
    soup = BeautifulSoup(html, 'html.parser')
    return soup


def check_number_of_bounties(soup, filename):
    with open(filename, 'r') as text_file:
        bounties = text_file.readline()

    number_active_bounties = len(soup.find_all("svg", class_="octicon octicon-issue-opened open"))
    print("Previous Bounties: " + bounties.rstrip())
    print("Current Bounties: " + str(number_active_bounties))
    print("---------------")

    all_bounties = soup.find_all("p", class_="title")
    for i in all_bounties:
        print(i)
        print()

    # active_bounties = []
    # for i in range(1, number_active_bounties):
    #     print(all_bounties[i])
    #     active_bounties[i] = all_bounties[i]
    # print(len(active_bounties)ne)
    # for i in active_bounties:
    #     print(i)


# def __main__(url):

html = make_html(url)
soup = make_soup(html)
check_number_of_bounties(soup, 'previous_bounties.txt')
