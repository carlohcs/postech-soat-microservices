#!/bin/bash

change_example() {
  if [ "$1" != "main.1.py" ] && [ "$1" != "main.2.py" ]; then
    echo "Parâmetro inválido. Use 'main.1.py' ou 'main.2.py'."
    return 1
  fi

  for dockerfile in $(find . -name 'Dockerfile'); do
    sed -i '' "s/main\.[12]\.py/$1/" "$dockerfile"
  done

  echo "Replacement completed for $1."
}

# Exemple:
# bash change_example.sh main.1.py
# bash change_example.sh main.2.py

change_example "$1"