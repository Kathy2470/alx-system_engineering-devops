#!/usr/bin/python3
"""
Python script, using a given REST API, for given employee ID,
returns information about his/her TODO list progress, exports it to CSV format.
"""

import sys
import requests
import csv


def get_todo_list_progress(employee_id):
    base_url = 'https://jsonplaceholder.typicode.com'
    url_user = f'{base_url}/users/{employee_id}'
    url_todos = f'{base_url}/todos?userId={employee_id}'

    try:
        response_user = requests.get(url_user)
        response_todos = requests.get(url_todos)

        user_data = response_user.json()
        todos_data = response_todos.json()

        total_tasks = len(todos_data)
        completed_tasks = [task for task in todos_data if task['completed']]

        print(f"Employee {user_data['name']} is done with tasks "
              f"({len(completed_tasks)}/{total_tasks}):")
        for task in completed_tasks:
            print(f"\t {task['title']}")

        # Export to CSV
        with open(f"{employee_id}.csv", mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(["USER_ID", "USERNAME", "TASK_COMPLETED_STATUS", "TASK_TITLE"])
            for task in todos_data:
                writer.writerow([user_data['id'], user_data['username'],
                                 task['completed'], task['title']])

        print(f"Exported data to {employee_id}.csv")
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        sys.exit(1)


if __name__ == "__main__":
    if len(sys.argv) != 2 or not sys.argv[1].isdigit():
        print("Usage: {} employee_id".format(sys.argv[0]))
        sys.exit(1)

    employee_id = int(sys.argv[1])
    get_todo_list_progress(employee_id)
