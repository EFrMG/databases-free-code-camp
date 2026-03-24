#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

echo -e "\n/===|  Random Services Scheduler  |===\\ \n"

BEGIN() {
  echo "What is your phone number?"
  read CUSTOMER_PHONE

  DB_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'" | sed -E "s/^\s+|\s+$//g")

  if [[ -z $DB_PHONE ]]; then
    echo "What is your name? (optional, we only care about your phone for spamming... Too late)"
    read CUSTOMER_NAME

    CUSTOMER_NAME=$(echo "$CUSTOMER_NAME" | sed -E "s/^\s+|\s+$//g")

    # Create customer entry
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    echo "$INSERT_CUSTOMER_RESULT" # For debugging

    DB_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'" | sed -E "s/^\s+|\s+$//g")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$DB_PHONE'" | sed -E "s/^\s+|\s+$//g")

    DB_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$DB_PHONE'" | sed -E "s/^\s+|\s+$//g")
  fi

  echo "What time do you prefer the service be provided? (optional, we do not guarantee anything)"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, time, service_id) VALUES ($DB_CUSTOMER_ID, '$SERVICE_TIME', $SERVICE_ID_SELECTED)")
  echo "$INSERT_APPOINTMENT_RESULT" # For debugging

  DB_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED" | sed -E "s/^\s+|\s+$//g")
  CUSTOMER_NAME=$(echo "$CUSTOMER_NAME" | sed -E "s/^\s+|\s+$//g")

  echo "I have put you down for a $DB_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}
START() {
  if [[ -n $1 ]]; then
    echo -e "\n\n$1\n"
  fi

  echo -e "\nWe provide the following rervices:"

  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  echo "$AVAILABLE_SERVICES" | while IFS=" | " read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  echo -e "\nEnter a number to pick one!\n"

  read SERVICE_ID_SELECTED
  
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    START "That is not one of our services..."
  else
    SERVICE_ID_VALID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")

    if [[ -z $SERVICE_ID_VALID ]]; then
      START "That is not one of our services..."
    else
      BEGIN
    fi
  fi
}

START

# 1) Email reading
# 2) Explain arithmetics on time wasted over a lifetime
# 3) A non-consecuential opinion on matters of relatively minor importance but never above forementioned importance level as pertaining to the relative conclusions of any of the parties involved in discussing such matters in order not to offend those who might be listening passing by
