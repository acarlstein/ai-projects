import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score

movies = pd.read_csv("ml-latest-small/movies.csv")
ratings = pd.read_csv("ml-latest-small/ratings.csv")

print("Data Loaded: OK")
print(f"Working with {len(ratings)} ratings from real people.")

features = ratings[["userId", "movieId"]] # What we know
label = ratings["rating"] # What we want to predict

print("What our AI will learn from the data (Features):")
print(features.head())
print("\nWhat our AI will try to predict (Label):")
print(label.head())

X_train, X_test, y_train, y_test = train_test_split(features, label, test_size=0.2, random_state=42)
print(f"\nData split into training and testing sets:")
print(f"Training set size: {len(X_train)} ratings")
print(f"Testing set size: {len(X_test)} ratings")

model = LinearRegression()
model.fit(X_train, y_train)
print(f"\nAI trained: OK")
print(f"Our AI studied the patterns of {len(X_train)} ratings")

predictions = model.predict(X_test)

predictions = model.predict(X_test)

# Mean Squared Error (MSE)
mse = mean_squared_error(y_test, predictions)

# Root Mean Squared Error (RMSE)
rmse = np.sqrt(mse)

print(f"\nTesting Complete: OK")
print(f"Our AI's average squared error in predicting ratings: {mse:.2f} stars².")
print(f"Our predictions are off about {rmse:.2f} stars on average.")

print(f"\nLet's ask our AI:")
print(f"What would user #1 rate movie #1 (“Toy Story”)?")

USER_ID = 1
MOVIE_ID = 1
MOVIE_TITLE = "Toy Story"

prediction_input = pd.DataFrame([[USER_ID, MOVIE_ID]], columns=["userId", "movieId"])
PREDICTION_INDEX = 0  # Index for the first (and only) prediction
predicted_rating = model.predict(prediction_input)[PREDICTION_INDEX]
print(f"User #{USER_ID}'s predicted rating for movie #{MOVIE_ID} (\"{MOVIE_TITLE}\"): {predicted_rating:.2f} stars")

# Break down the process of finding the real rating for clarity
user_movie_mask = (ratings["userId"] == USER_ID) & (ratings["movieId"] == MOVIE_ID)
user_movie_ratings = ratings[user_movie_mask]
user_movie_rating_values = user_movie_ratings["rating"].values

if len(user_movie_rating_values) > 0:
    real_rating = user_movie_rating_values[0]
    print(f"User #{USER_ID}'s actual rating for movie #{MOVIE_ID} (\"{MOVIE_TITLE}\"): {real_rating} stars")
else:
    print(f"User #{USER_ID} has not rated movie #{MOVIE_ID} (\"{MOVIE_TITLE}\").")

print("\n" + "-" * 50 + "\n") # Separator for clarity

r2 = r2_score(y_test, predictions)
print(f"Features used: userId, movieId")
print(f"Our AI's R² score: {r2:.4f} ({r2 * 100:.2f}% of variation)")
