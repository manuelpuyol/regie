# REGIE

REGIE is a command line application developed in Ruby + MySQL
Project description [here](https://classes.cs.uchicago.edu/archive/2020/winter/51410-1/project.description.html)

### User stories

1. As a user, I want to login in REGIE :heavy_check_mark:
    1. Login must recognize which persona this user is (Student/Professor/Admin) :heavy_check_mark:
    2. Login must redirect user to correct application :heavy_check_mark:

2. As a user, I want to change my password :heavy_check_mark:

3. As a student, I want to see my current courses :heavy_check_mark:
    1. Must return the name of each course the student is currently enrolled in :heavy_check_mark:

4. As a student, I want to search a course :heavy_check_mark:
    1. Must be able to search by name :heavy_check_mark:
    2. Must be able to search by code (Did not implement since search by name is enough)

5. As a student, I want to register for a course :heavy_check_mark:
    1. Must not allow more than 3 active courses in a quarter :heavy_check_mark:
    2. Must check if prerequisites are met :heavy_check_mark:
    3. Must enroll for accompanying labs (Decided to not implement labs to reduce the scope)

6. As a student, I want to see my grades :heavy_check_mark:
    1. Must print all past grades, divided by quarter :heavy_check_mark:

7. As a professor, I want to see my current courses :heavy_check_mark:
    1. Must show building/room assignment (Decided to not implement room assignment to reduce the scope)

8. As a professor, I want to see my current students :heavy_check_mark:
    1. Must show a list of students per current course :heavy_check_mark:

9. As a professor, I want to grade a student :heavy_check_mark:
    1. Must be able to create a grade :heavy_check_mark:
    2. Must be able to change a grade :heavy_check_mark:

10. As an admin, I want to create a user :heavy_check_mark:
    1. Must be able to create student :heavy_check_mark:
    2. Must be able to create professor :heavy_check_mark:
    3. Must be able to create admin :heavy_check_mark:

11. As an admin, I want to create a quarter :heavy_check_mark:

12. As an admin, I want to create a course :heavy_check_mark:

13. As an admin, I want to assign a course to a quarter :heavy_check_mark:
    1. A course may be offered on multiple quarters :heavy_check_mark:

### Setting up the app

First, make sure you have the correct `ruby` installed. I recommend using [RVM](https://rvm.io):

1. `\curl -sSL https://get.rvm.io | bash -s stable`
2. `rvm install "ruby-2.6.0"`

Then, install `bundler`

1. `gem install bundler`

Install necessary gems

1. `bundle install`

### Setting up the database

Please update the `.env` file to add your database credentials. I recommend keeping the database name `regie_db`

There are 3 SQL scripts on the `sql` folder:

1. `reset_dbs` - drops and creates the DBs for development and tests
2. `create_db` - to create the correct schema
3. `populate_db` - some simple data for the development database.

To setup, you can run in your cmd:

```bash
echo 'Reseting DBs'
mysql -u DB_USER -pDB_PASS < reset_dbs.sql
echo 'Creating dev DB'
mysql -u DB_USER -pDB_PASS regie_db < create_db.sql
echo 'Populating dev DB'
mysql -u DB_USER -pDB_PASS regie_db < populate_db.sql
echo 'Creating test DB'
mysql -u DB_USER -pDB_PASS regie_db_test < create_db.sql
echo 'Done'

```

### Running the app

`ruby launcher.rb`

If you used the `populate_db` script, there are 3 users:

1. `admin@uchicago.edu`
2. `professor@uchicago.edu`
3. `student@uchicago.edu`

All passwords are `1`.

Keep in mind that the command line frontend is not the focus of this project, so it can have some unhandled errors.

### Running tests

`rspec`

### Linting

`rubocop`

### Credits

This project is designed and implemented by `Manuel Puyol` exclusively for `MPCS 51410 Object Oriented Programming` class from `UChicago`.
