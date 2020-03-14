# REGIE

REGIE is a command line application developed in Ruby + MySQL
Project description [here](https://classes.cs.uchicago.edu/archive/2020/winter/51410-1/project.description.html)

### User stories

1. As a user, I want to login in REGIE :heavy_check_mark:
    1. Login must recognize which persona this user is (Student/Professor/Admin) :heavy_check_mark:
    2. Login must redirect user to correct application :heavy_check_mark:

2. As a user, I want to change my password

3. As a student, I want to see my current courses :heavy_check_mark:
    1. Must return the name of each course the student is currently enrolled in :heavy_check_mark:

4. As a student, I want to search a course
    1. Must be able to search by name :heavy_check_mark:
    2. Must be able to search by code

5. As a student, I want to register for a course
    1. Must not allow more than 3 active courses in a quarter
    2. Must check if prerequisites are met
    3. Must enroll for accompanying labs

6. As a student, I want to see my grades :heavy_check_mark:
    1. Must print all past grades, divided by quarter :heavy_check_mark:

7. As a professor, I want to see my current courses :heavy_check_mark:
    1. Must show building/room assignment

8. As a professor, I want to see my current students :heavy_check_mark:
    1. Must show a list of students per current course :heavy_check_mark:

9. As a professor, I want to grade a student
    1. Must be able to create a grade
    2. Must be able to change a grade

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

### Running the app

`ruby launcher.rb`

### Running tests

`rspec`

### Linting

`rubocop`

### Credits

This project is designed and implemented by `Manuel Puyol` exclusively for `MPCS 51410 Object Oriented Programming` class from `UChicago`.
