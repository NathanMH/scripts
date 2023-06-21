import csv
import os
import jellyfish

dirname = os.path.dirname(__file__)
# shortcut_file = dirname + "\other.csv"
applications = {}
shortcuts = []

# Create a concated string of all fields per shortcut row
def create_single_string():
    for shortcut_file in os.listdir(dirname):
        if shortcut_file.endswith(".csv"):
            app = str.split(shortcut_file, ".")[0]
            applications[app] = []
            with open(shortcut_file, newline="") as csvFile:
                csv_shorts = csv.DictReader(csvFile)
                for row in csv_shorts:
                    row["string"] = " ".join(map(str, row.values()))
                    applications[app].append(row)
    # print(applications)


# Add score field to the functions data structure
def make_scores(text):
    search_words = text.split()
    try:
        if search_words[0] in applications:
            shortcuts = applications[search_words[0]]
        else:
            shortcuts = applications["all"]

        for row in shortcuts:
            row["score"] = 0
        for word in search_words:

            for row in shortcuts:

                if word == row["application"]:
                    row["score"] += 1

                row["score"] += jellyfish.jaro_similarity(word, row["function"])
                row["score"] += jellyfish.jaro_similarity(word, row["keybinding"])

        scored = sorted(shortcuts, key=lambda d: d["score"], reverse=True)
        return scored
    except IndexError:
        pass


if __name__ == "__main__":
    create_single_string()
    scored = make_scores("leader buffer")

    # scored = sorted(shortcuts, key=lambda d: d["score"], reverse=True)

    # print(scored)
    # print(scored[0])
    print(scored[1]["application"])
    print(scored[1]["keybinding"])
    print(scored[1]["function"])
    for item in scored:
        print(item["application"])
    # print(scored[2])
    # print(scored[3])
    # print(scored[4])
    # print(scored[5])
    # print(scored[6])
    # print(scored[7])
    # print(scored[8])
    # print(scored[9])
