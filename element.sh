if [[ $# -eq 0 || $# -gt 1 ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

GET_FULL_DETAILS() {
  case $1 in
    "num") QUERY_CLAUSE="e.atomic_number = $ELEMENT_ATOMIC_NUMBER" ;;
    "nam") QUERY_CLAUSE="e.name = '$ELEMENT_NAME'" ;;
    "sym") QUERY_CLAUSE="e.symbol = '$ELEMENT_SYMBOL'" ;;
  esac

  FULL_DETAILS=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements AS e INNER JOIN properties AS p ON e.atomic_number = p.atomic_number INNER JOIN types AS t ON p.type_id = t.type_id WHERE $QUERY_CLAUSE")

  IFS='|' read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$FULL_DETAILS"

  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
}

if [[ $1 =~ ^[0-9]+$ ]]; then
  ELEMENT_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1" 2> /dev/null)

  if [[ -n $ELEMENT_ATOMIC_NUMBER ]]; then
    GET_FULL_DETAILS "num"
  else
    echo "I could not find that element in the database."
  fi

elif [[ ${#1} -gt 2 ]]; then
  ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE name='$1'" 2> /dev/null)

  if [[ -n $ELEMENT_NAME ]]; then
    GET_FULL_DETAILS "nam"
  else
    echo "I could not find that element in the database."
  fi

else
  ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$1'" 2> /dev/null)

  if [[ -n $ELEMENT_SYMBOL ]]; then
    GET_FULL_DETAILS "sym"
  else
    echo "I could not find that element in the database."
  fi
fi
