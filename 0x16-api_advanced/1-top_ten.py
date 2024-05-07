#!/usr/bin/python3
"""
Script to print titles of the top 10 hot posts on a given Reddit subreddit.
"""

import requests


def top_ten(subreddit):
    """
    Print the titles of the top 10 hottest posts on a given subreddit.

    :param subreddit: The name of the subreddit.
    """
    # Construct the URL for the subreddit's hot posts in JSON format
    url = f"https://www.reddit.com/r/{subreddit}/hot/.json"

    # Define headers for the HTTP request, including User-Agent
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"
    }

    params = {
        "limit": 10
    }

    # Send a GET request to the subreddit's hot posts page
    response = requests.get(
        url,
        headers=headers,
        params=params,
        allow_redirects=False
    )

    if response.status_code == 404:
        print("None")
        return

    # Parse the JSON response and extract the 'data' section
    results = response.json().get("data")

    # Print the titles of the top 10 hottest posts
    for child in results.get("children"):
        print(child.get("data").get("title"))
