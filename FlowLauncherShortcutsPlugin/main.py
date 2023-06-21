# -*- coding: utf-8 -*-

import sys, os
import ShortcutParser

parent_folder_path = os.path.abspath(os.path.dirname(__file__))
sys.path.append(parent_folder_path)
sys.path.append(os.path.join(parent_folder_path, "lib"))
sys.path.append(os.path.join(parent_folder_path, "plugin"))

from flowlauncher import FlowLauncher


def get_app_icon(app_name):
    return "Images/" + app_name + ".png"


def get_shortcuts(scores):
    scuts = []
    for item in scores:
        temp_obj = {
            "Title": item["function"],
            "Subtitle": item["keybinding"],
            "IcoPath": get_app_icon(item["application"]),
        }
        scuts.append(temp_obj)
    else:
        return scuts


class Shortcuts(FlowLauncher):
    def query(self, query):
        scored = ShortcutParser.make_scores(query)
        if not scored:
            return [{"Title": "None", "SubTitle": "None", "IcoPath": "Images/app.png"}]
        else:
            return get_shortcuts(scored)

    # def context_menu(self, data):
    #     return [
    #         {
    #             "Title": "Context menu",
    #             "SubTitle": "Press enter to do nothing",
    #             "IcoPath": "Images/app.png",
    #         }
    #     ]


if __name__ == "__main__":
    ShortcutParser.create_single_string()
    Shortcuts()
