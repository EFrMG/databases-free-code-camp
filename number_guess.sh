#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
secret_number=$((RANDOM % 1000 + 1))

echo "Enter your username:"
read username

db_user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username'")

if [[ -z $db_user_id ]]; then
  # New user
  echo "Welcome, $username! It looks like this is your first time here."

  insert_user_result=$($PSQL "INSERT INTO users(username) VALUES('$username')")
  db_user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username'")
else
  # Get the rest of user data
  games_played=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $db_user_id")
  best_game=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = $db_user_id")

  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

number_of_guesses=0
echo "Guess the secret number between 1 and 1000:"

until ((guessed_number == secret_number)); do
  read guessed_number
  ((number_of_guesses++))

  if [[ ! $guessed_number =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  if ((guessed_number > secret_number)); then
    echo "It's lower than that, guess again:"
  elif ((guessed_number < secret_number)); then
    echo "It's higher than that, guess again:"
  fi
done

echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"

# Save the game
insert_game_result=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($db_user_id, $number_of_guesses)")

exit 0
