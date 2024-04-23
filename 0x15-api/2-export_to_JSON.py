#!/usr/bin/python3
"""
python script that, using a given REST API, for a given employee ID,
returns information about his/her TODO list progress and exports it to JSON format.
"""

import sys
import requests
import json


def get_todo_list_progress(employee_id):
    base_url = 'https://jsonplaceholder.typicode.com'
    url_user = f'{base_url}/users/{employee_id}'
    url_todos = f'{base_url}/todos?userId={employee_id}'

    try:
        response_user = requests.get(url_user)
        response_todos = requests.get(url_todos)

        user_data = response_user.json()
        todos_data = response_todos.json()

        todo_list = [{"task": task['title'], "completed": task['completed'], "username": user_data['username']} for task in todos_data]

        with open(f"{employee_id}.json", mode='w') as file:
            json.dump({str(user_data['id']): todo_list}, file)

        print(f"Exported data to {employee_id}.json")
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        sys.exit(1)


if __name__ == "__main__":
    if len(sys.argv) != 2 or not sys.argv[1].isdigit():
        print("Usage: {} employee_id".format(sys.argv[0]))
        sys.exit(1)

    employee_id = int(sys.argv[1])
    get_todo_list_progress(employee_id)
