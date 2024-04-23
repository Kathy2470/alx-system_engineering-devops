#!/usr/bin/python3
"""
Export to-do list information for all employees to JSON format.
"""

import json
import requests


def fetch_todos():
    url = "https://jsonplaceholder.typicode.com/"
    users = requests.get(url + "users").json()
    all_tasks = {}

    for user in users:
        user_id = str(user.get("id"))
        username = user.get("username")
        todos = requests.get(url + "todos", params={"userId": user_id}).json()
        user_tasks = [{"username": username, "task": t.get("title"), "completed": t.get("completed")} for t in todos]
        all_tasks[user_id] = user_tasks

    return all_tasks


if __name__ == "__main__":
    all_tasks = fetch_todos()
    with open("todo_all_employees.json", "w") as jsonfile:
        json.dump(all_tasks, jsonfile, indent=4)
