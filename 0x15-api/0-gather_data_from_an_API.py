#!/usr/bin/python3
"""
Retrieves to-do list information for a given employee ID.

This script accepts an employee ID as a command-line argument and fetches
the corresponding user information and to-do list from the JSONPlaceholder API.
It then prints the tasks completed by the employee.
"""

import requests
import sys


if __name__ == "__main__":
    base_url = "https://jsonplaceholder.typicode.com/"
    employee_id = sys.argv[1]
    user_info = requests.get(base_url + "users/{}".format(employee_id)).json()
    params = {"userId": employee_id}
    todo_list = requests.get(base_url + "todos", params=params).json()
    completed_tasks = [task.get("title") for task in todo_list if task.get("completed")]
    print("Employee {} is done with tasks({}/{}):".format(
        user_info.get("name"), len(completed_tasks), len(todo_list)))
    for task_title in completed_tasks:
        print("\t{}".format(task_title))
