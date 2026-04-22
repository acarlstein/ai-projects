import pandas as pd

# Load our data
movies = pd.read_csv('ml-latest-small/movies.csv')
ratings = pd.read_csv('ml-latest-small/ratings.csv')

# Let's see what we're working with
print("=== MOVIES ===")
print(movies.head())

print("\n=== RATINGS ===")
print(ratings.head())

print("\n=== HOW MUCH DATA DO WE HAVE? ===")
print(f"Number of movies: {len(movies)}")
print(f"Number of ratings: {len(ratings)}")