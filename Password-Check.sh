#! /bin/bash

is_valid_password(){
  local password=$1
  if [[ ${password} -lt 8 || ${password} -gt 16 ]]; then
    return 1
  fi
  if [[ "$password" =~ [A-Z] && "$password" =~ [a-z] && "$password" =~ [0-9] && "$password" =~ [^a-zA-Z0-9] ]]; then
    return 2
  fi
  return 0
}
while true; do
  echo "Enter password (8 to 16 characters, must contain at least one capital letter, one lowercase letter, one number and one special character):"
  read -s password
  if [[ ${password} -lt 8 ]]; then
    echo "Password is too short! Please use at least 8 Characters."
  elif [[ ${password} -gt 16 ]]; then
    echo "Password is too long! Suggest you to go with a password at max 16 characters."
  else
    is_valid_password "$password"
    case $? in 
        0)
          echo "Password is valid!"
          break 
          ;;
        1)
          echo "Password should be between 8 to 16 characters only."
          ;;
        2)
          echo "Password should contain at least one uppercase, one lowercase letter, one number and one special character."
          ;;
      esac
    fi
  done
while true; do
  echo "Please confirm your password:"
  read -s confirm_password
  if [[ "$password" == "$confirm_password" ]]; then
    echo "Password confimed successfully!"
    break
  else
    echo "Password do not match. please try again."
  fi
done

