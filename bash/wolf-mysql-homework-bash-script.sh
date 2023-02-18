#!/bin/bash

# 1. Install MySQL using the yum package manager
sudo apt install mysql-server -y

# 2. Start the MySQL service
sudo systemctl start mysql.service

# 3. Change the default password for the MySQL root user
echo "Please enter NEW password:"
read -s pass

sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$pass';"

# 4. Connect to the MySQL server as the root user
# 5. Create a database called mentorship
mysql -u root -p"$pass" -e "CREATE DATABASE IF NOT EXISTS mentorship;"

# 6. Use the mentorship database
# 7. Create two tables within the mentorship database: student and mentor.
# 8. Both tables should have the following columns: name, last_name, age, city, username, password, and favorite movie.
mysql -u root -p"$pass" -e "CREATE TABLE IF NOT EXISTS mentorship.student (
  name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  city VARCHAR(255),
  username VARCHAR(255),
  password VARCHAR(255),
  movie VARCHAR(255)
);"

mysql -u root -p"$pass" -e "CREATE TABLE IF NOT EXISTS mentorship.mentor (
  name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  city VARCHAR(255),
  username VARCHAR(255),
  password VARCHAR(255),
  movie VARCHAR(255)
);"

# 9. The bash script should accept one argument, either student or mentor,
add_to_student_table() {
  echo "Please enter your first name:"
  read first_name

  echo "Please enter your last name:"
  read last_name

  echo "Please enter your age:"
  read age

  echo "Please enter your city:"
  read city

  echo "Please enter your username:"
  read username

  echo "Please enter your password:"
  read password

  echo "Please enter your movie:"
  read movie

  mysql -u root -p"$pass" -e "INSERT INTO mentorship.student(name, last_name, age, city, username, password, movie)
  VALUES ("\"$first_name\"", "\"$last_name\"", "\"$age\"", "\"$city\"", "\"$username\"", "\"$password\"", "\"$movie\"");"
}

add_to_mentor_table() {
  echo "Please enter your first name:"
  read first_name

  echo "Please enter your last name:"
  read last_name

  echo "Please enter your age:"
  read age

  echo "Please enter your city:"
  read city

  echo "Please enter your username:"
  read username

  echo "Please enter your password:"
  read password

  echo "Please enter your movie:"
  read movie

  mysql -u root -p"$pass" -e "INSERT INTO mentorship.mentor(name, last_name, age, city, username, password, movie)
  VALUES ("\"$first_name\"", "\"$last_name\"", "\"$age\"", "\"$city\"", "\"$username\"", "\"$password\"", "\"$movie\"");"
}

add_random_entries() {
  # 10. Add 20 random entries to the student table
  mysql -u root -p"$pass" -e "INSERT INTO mentorship.student(name, last_name, age, city, username, password, movie)
  VALUES
  ('Kim', 'Jones', 24, 'New York', 'kimjones', 'pass12345', 'The Godfather'),
  ('John', 'Smith', 22, 'Los Angeles', 'johnsmith', 'pass12345', 'Star Wars'),
  ('Pablo', 'Garcia', 28, 'Chicago', 'pablogarcia', 'pass12345', 'Gone with the Wind'),
  ('Alex', 'Fernandez', 19, 'Houston', 'alexfernandez', 'pass12345', 'The Shawshank Redemption'),
  ('Chris', 'Anderson', 22, 'Philadelphia', 'chrisanderson', 'pass12345', 'The Dark Knight'),
  ('Brian', 'Gonzalez', 23, 'Phoenix', 'briangonzalez', 'pass12345', 'Schindlers List'),
  ('Sara', 'Collins', 20, 'San Antonio', 'saracollins', 'pass12345', 'The Lord of the Rings'),
  ('Daniel', 'Lopez', 25, 'San Diego', 'daniellopez', 'pass12345', 'Fight Club'),
  ('Edward', 'Carpenter', 27, 'Dallas', 'edwardcarpenter', 'pass12345', 'The Matrix'),
  ('Julia', 'Walker', 22, 'San Jose', 'juliawalker', 'pass12345', 'Forrest Gump'),
  ('Kevin', 'Morris', 23, 'Austin', 'kevinmorris', 'pass12345', 'Inception'),
  ('Taylor', 'Hill', 24, 'Jacksonville', 'taylorhill', 'pass12345', 'Goodfellas'),
  ('Thomas', 'Green', 27, 'Indianapolis', 'thomasgreen', 'pass12345', 'The Silence of the Lambs'),
  ('Steven', 'Wilson', 25, 'Columbus', 'stevenwilson', 'pass12345', 'The Usual Suspects'),
  ('Emily', 'King', 21, 'Fort Worth', 'emilyking', 'pass12345', 'Pulp Fiction'),
  ('Abigail', 'Lee', 28, 'Charlotte', 'abigaillee', 'pass12345', 'The Departed'),
  ('Timothy', 'Scott', 22, 'Detroit', 'timothyscott', 'pass12345', 'The Lion King'),
  ('Rachel', 'White', 19, 'El Paso', 'rachelwhite', 'pass12345', 'The Prestige'),
  ('Madison', 'Hall', 23, 'Memphis', 'madisonhall', 'pass12345', 'Saving Private Ryan'),
  ('Samantha', 'Adams', 20, 'Seattle', 'samanthaadams', 'pass12345', 'Interstellar');"

  # 10. Add 20 random entries to the mentor table
  mysql -u root -p"$pass" -e "INSERT INTO mentorship.mentor(name, last_name, age, city, username, password, movie)
  VALUES
  ('James', 'Brown', 30, 'New York', 'jamesbrown', 'pass12345', 'The Godfather'),
  ('Michael', 'Davis', 33, 'Los Angeles', 'michaeldavis', 'pass12345', 'Star Wars'),
  ('Joseph', 'Garcia', 25, 'Chicago', 'josephgarcia', 'pass12345', 'Gone with the Wind'),
  ('David', 'Miller', 28, 'Houston', 'davidmiller', 'pass12345', 'The Shawshank Redemption'),
  ('Christopher', 'Martinez', 27, 'Philadelphia', 'christophermartinez', 'pass12345', 'The Dark Knight'),
  ('Richard', 'Taylor', 40, 'Phoenix', 'richardtaylor', 'pass12345', 'Schindlers List'),
  ('Jessica', 'Wilson', 35, 'San Antonio', 'jessicawilson', 'pass12345', 'The Lord of the Rings'),
  ('Andrew', 'White', 32, 'San Diego', 'andrewwhite', 'pass12345', 'Fight Club'),
  ('Danielle', 'Anderson', 37, 'Dallas', 'danielleanderson', 'pass12345', 'The Matrix'),
  ('John', 'Lee', 29, 'San Jose', 'johnlee', 'pass12345', 'Forrest Gump'),
  ('Matthew', 'Gonzalez', 42, 'Austin', 'matthewgonzalez', 'pass12345', 'Inception'),
  ('Jennifer', 'Thomas', 36, 'Jacksonville', 'jenniferthomas', 'pass12345', 'Goodfellas'),
  ('Amanda', 'Harris', 44, 'Indianapolis', 'amandaharris', 'pass12345', 'The Silence of the Lambs'),
  ('Ryan', 'King', 39, 'Columbus', 'ryanking', 'pass12345', 'The Usual Suspects'),
  ('Elizabeth', 'Walker', 34, 'Fort Worth', 'elizabethwalker', 'pass12345', 'Pulp Fiction'),
  ('Jonathan', 'Adams', 40, 'Charlotte', 'jonathanadams', 'pass12345', 'The Departed'),
  ('Brandon', 'Smith', 33, 'Detroit', 'brandonsmith', 'pass12345', 'The Lion King'),
  ('Sophia', 'Moore', 32, 'El Paso', 'sophiamoore', 'pass12345', 'The Prestige'),
  ('Anthony', 'Hall', 36, 'Memphis', 'anthonyhall', 'pass12345', 'Saving Private Ryan'),
  ('Emily', 'Jenkins', 38, 'Seattle', 'emilyjenkins', 'pass12345', 'Interstellar');"
}

if [ "$1" == "student" ]; then
  add_to_student_table
elif [ "$1" == "mentor" ]; then
  add_to_mentor_table
elif [ "$#" == 0 ]; then
  add_random_entries
fi
