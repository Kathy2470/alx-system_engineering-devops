#!/usr/bin/python3
"""
Python script that, using a given REST API, for a given employee ID,
returns information about his/her TODO list progress.
"""

import sys
import requests

def get_todo_list_progress(employee_id):
    url_user = f'https://jsonplaceholder.typicode.com/users/{employee_id}'
    url_todos = f'https://jsonplaceholder.typicode.com/todos?userId={employee_id}'

    try:
        response_user = requests.get(url_user)
        response_todos = requests.get(url_todos)

        user_data = response_user.json()
        todos_data = response_todos.json()

        total_tasks = len(todos_data)
        completed_tasks = [task for task in todos_data if task['completed']]

        print(f"Employee {user_data['name']} is done with tasks"
              f"({len(completed_tasks)}/{total_tasks}):")
        for task in completed_tasks:
            print(f"\t {task['title']}")
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 2 or not sys.argv[1].isdigit():
        print("Usage: {} employee_id".format(sys.argv[0]))
        sys.exit(1)

    employee_id = int(sys.argv[1])
    get_todo_list_progress(employee_id)
