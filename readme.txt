DSCI 551 Project
University Staff & Student Database 
Yifei Li, Chang Li, Zhenyu Huang





HOW TO:
    
    open the web application:
        1.Download the "Frontend" folder.
        2.Run the main.py file (python main.py).
        3.After starting the server, open a web browser and go to the following URL: http://127.0.0.1:5000, and this will launch the app in your browser.

    connect to the ec2 server:
        ssh -i "dsci551-sp24.pem" ubuntu@ec2-3-137-144-14.us-east-2.compute.amazonaws.com (ec2 address subject to change after reboot)
        Passkey pem file is included in the github repo, user can download it and change premission.

    connect to the MySQL server on ec2:
        In terminal after the ssh connection is established:
            mysql -u dsci551 -p
            password is Dsci-551
        After login, you will see multiple databases, you are now free to run any queries on the databases as a database manager.
    
    manage the database from backend:
        First connect to the ec2 server,
        then in terminal, type:
            cd Project
            python3 project_backend_basics.py <function_name> <data> (detailed usage below)
        the output will then be printed in terminal.     

NOTE:
    1. Since the processing power of this ec2 server is weak, it will sometimes be frozen. Then a server reboot is needed.
       If user encounters such issue, please email Yifei Li at yli78495@usc.edu so that I can help reboot the server and provide
       you the new ec2 address.
    
    2. If a new ec2 address is given, user needs to update the ec2 address value at line 16 of main.py file of front end to connect to the ec2 server.
    
    3. scale_db() and enroll_many_course() are manager operations, there aren't many limitations/error checking in the functions. Please use cautiously. After scale_db() is called, user needs to update the value of STUDENT_DATABASE_SIZE at line 21 of project_backend_basics.py so that the hash function can work correctly afterwards. The value is 3 at the beginning.

    4. If by any chance the database is messed up, user can run the create_schema.sql in /Project/SQL schema folder. This will reset the whole database to initial condition, which contains student1, student2, university database and around 100 students information plus course enrollment info. Then user can set the value STUDENT_DATABASE_SIZE to 2 and move on from there.

    5. After the reset using create_schema.sql, only student1 and student2 are student databases in use. There might exist student3, student4,..., etc, however, they won't have any impact on the program and will be emptied before being used. User can safely disregard these databases.

    6. If during testing, the premission of user dsci551 is not enough. One can log out and relogin with mysql -u root -p. Password is the same.



Backend documentation:

CRUD operations:
C:
    enroll_student
    student_enroll_course

R:
    get_student_info
    get_professor_info
    get_course_info
    search_students_by_name
    search_students_by_gpa
    search_classmates_from_student_id
    search_students_from_professor_id

U:
    modify_student_info

D:
    withdraw_student
    student_withdraw_course


# gets the information of the student with the specified student_id
def get_student_info(student_id)
    @USAGE: 
        python3 project_backend_basics.py get_student_info 1
    @RETURN: 
        success: {'student_id': 100, 'student_name': 'Linda Garcia', 'gender': 'female', 'email': 'lindagarcia91@university.edu', 'department_id': 3, 'gpa': 2.14}
        fail: No info found for student with student_id 1001.
              Error: student_id needs to be a positive integer.


# gets the information of the professor with the specified professor_id
def get_professor_info(professor_id)
    @USAGE: 
        python3 project_backend_basics.py get_professor_info 100
    @RETURN: 
        success: {'professor_id': 1, 'name': 'James Brown', 'gender': 'female', 'email': 'james.brown16@university.edu', 'department_id': 2, 'salary': 86991.23}
        fail: No info found for professor with professor_id 100.
              Error: professor_id needs to be a positive integer.


# gets the information of the course with the specified course_id
def get_course_info(course_id)
    @USAGE: 
        python3 project_backend_basics.py get_course_info CS101
    @RETURN: 
        success: {'course_id': 'CS101', 'prof_id': 12, 'name': 'Java', 'department_id': 2, 'schedule_time': 'Tuesday 11:00', 'seat_available': 10, 'description': 'Introduction to java'}
        fail: No info found for course with course_id CSNULL.


# add a new studnet with provided info into the student database
def enroll_student(student_info ={name, gender, email, department_id, gpa})
    @USAGE: 
        python3 project_backend_basics.py enroll_student '{"name": "jenny", "gender": "female", "email": "jenfsd@gmail.com", "department_id": 3, "gpa": 3.67}'
	@RETURN: 
        success: student_id 108: Enrollment was successful.
 		fail:   Enrollment failed.
                An error occurred: {e}
                Invalid student_info input. Enrollment failed.
        

# remove a student from the student database
def withdraw_student(student_id)
    @USAGE:
        python3 project_backend_basics.py withdraw_student 113
    @RETURN: 
        success: Student with student_id 99 is successfully deleted.
 		fail: Delete failed. Student with student_id {student_id} not exist.
              Error: student_id needs to be a positive integer.


# try to add a course enrollment info into the database, change the remaining seat of that course
def student_enroll_course(enroll_info): # enroll_info = str(course_id) + ',' + str(student_id)
    @USAGE:
        python3 project_backend_basics.py student_enroll_course CS105,13
    @RETURN: 
        success: course_id CS105, student_id 13: insert was successful.
 		fail: Error: student_id needs to be a positive integer.
              Course with course_id CS15 is not exist. Course enrollment failed.
              Student with student_id 133 is not exist. Course enrollment failed.
              Student with student_id 48 is already enrolled in this course. Duplicate course enrollment is not allowed.
              Course enrollment failed.


# remove a course enrollment info into the database, change the remaining seat of that course
def student_withdraw_course(withdraw_info): # withdraw_info = str(course_id) + ',' + str(student_id)
    @USAGE:
        python3 project_backend_basics.py student_withdraw_course CS105,47
    @RETURN: 
        success: course_id CS105, student_id 47: withdrawl was successful.
 		fail: Course with course_id CS10005 is not exist. Withdrawl from course failed.
              Student with student_id 51 is either not exist or not enrolled in course with course_id CS105. Course withdrawl failed.
              Course withdrawl failed. Student with student_id 48


# find info of all students in the student database whose name contains the input string
def search_students_by_name(name):
    @USAGE:
        python3 project_backend_basics.py search_students_by_name johnson
    @RETURN: 
        success: 
                [(23, 'Jessica Johnson', 'female', 'jessica216@gmail.com', 2, Decimal('2.43')), (36, 'Joseph Johnson', 'female', 'joseph290@gmail.com', 1, Decimal('2.79')), (46, 'Susan Johnson', 'male', 'susan262@gmail.com', 1, Decimal('3.06')), (66, 'John Johnson', 'female', 'johnjohnson95@university.edu', 2, Decimal('3.25')), (75, 'Michael Johnson', 'male', 'michaeljohnson54@university.edu', 2, Decimal('3.60')), (64, 'Linda Johnson', 'male', 'lindajohnson68@university.edu', 3, Decimal('3.63')), (96, 'Robert Johnson', 'male', 'robertjohnson54@university.edu', 1, Decimal('3.77'))]
 		fail: No matching result.


# find info of all students in the student database whose gpa is within the input range
def search_students_by_gpa(gpa_range): #3.50,4.00
    @USAGE:
        python3 project_backend_basics.py search_students_by_gpa 3.50,3.98
    @RETURN: 
        success: 
                [(92, 'William Jackson', 'male', 'williamjackson59@university.edu', 2, Decimal('3.93')), (94, 'Elizabeth Hernandez', 'female', 'elizabethhernandez56@university.edu', 2, Decimal('3.93')), (52, 'Karen Jackson', 'female', 'karenjackson100@university.edu', 2, Decimal('3.94')), (5, 'Sarah Rodriguez', 'male', 'sarah233@gmail.com', 3, Decimal('4.00'))]
 		fail: [] for empty result
              Error: gpa value needs to be a float range from 0 to 4.00


def modify_student_info(student_info): #json_string input
    @USAGE:
        python3 project_backend_basics.py modify_student_info '{"student_id": 10, "gpa": 3.99}'
    @RETURN: 
        success: 
                Update successful.
 		fail: Error: student_id needs to be a positive integer.
              Update failed.
              Error: + Exception
              

# find info of all students in the student database who is taking one or more classes together with the student that has the given student_id.
def search_classmates_from_student_id(student_id):
    @USAGE:
        python3 project_backend_basics.py search_classmates_from_student_id 9
    @RETURN: 
        success: 
                ((8, 'Michael Moore', 'male', 'michael204@gmail.com', 1, Decimal('2.84'), 'CS102'), (10, 'William Smith', 'female', 'william272@gmail.com', 1, Decimal('3.98'), 'CS102'), (12, 'William Hernandez', 'female', 'william262@gmail.com', 1, Decimal('3.01'), 'DS104'), (16, 'Robert Moore', 'female', 'robert253@gmail.com', 2, Decimal('3.26'), 'DS104'), (20, 'William Garcia', 'male', 'william223@gmail.com', 3, Decimal('3.70'), 'CS102'), (30, 'Thomas Brown', 'male', 'thomas279@gmail.com', 2, Decimal('2.60'), 'DS104'), (32, 'Jennifer Wilson', 'male', 'jennifer240@gmail.com', 1, Decimal('3.08'), 'CS102'), (34, 'Patricia Martin', 'male', 'patricia296@gmail.com', 1, Decimal('3.78'), 'CS102, DS104'), (37, 'William Rodriguez', 'female', 'william257@gmail.com', 1, Decimal('2.10'), 'CS102'), (39, 'Susan Rodriguez', 'male', 'susan217@gmail.com', 1, Decimal('2.11'), 'CS102'), (42, 'Jessica Miller', 'female', 'jessica216@gmail.com', 1, Decimal('2.43'), 'CS102, DS104'), (45, 'James Wilson', 'male', 'james281@gmail.com', 1, Decimal('3.42'), 'DS104'), (46, 'Susan Johnson', 'male', 'susan262@gmail.com', 1, Decimal('3.06'), 'CS102'), (48, 'Karen Garcia', 'male', 'karen200@gmail.com', 3, Decimal('2.96'), 'DS104'), (49, 'Robert Davis', 'female', 'robert138@gmail.com', 2, Decimal('2.90'), 'CS102'))

                +------------+-------------------+--------+-----------------------+---------------+------+--------------+
                | student_id | name              | gender | email                 | department_id | gpa  | course_ids   |
                +------------+-------------------+--------+-----------------------+---------------+------+--------------+
                |          8 | Michael Moore     | male   | michael204@gmail.com  |             1 | 2.84 | CS102        |
                |         10 | William Smith     | female | william272@gmail.com  |             1 | 3.98 | CS102        |
                |         12 | William Hernandez | female | william262@gmail.com  |             1 | 3.01 | DS104        |
                |         16 | Robert Moore      | female | robert253@gmail.com   |             2 | 3.26 | DS104        |
                |         20 | William Garcia    | male   | william223@gmail.com  |             3 | 3.70 | CS102        |
                |         30 | Thomas Brown      | male   | thomas279@gmail.com   |             2 | 2.60 | DS104        |
                |         32 | Jennifer Wilson   | male   | jennifer240@gmail.com |             1 | 3.08 | CS102        |
                |         34 | Patricia Martin   | male   | patricia296@gmail.com |             1 | 3.78 | CS102, DS104 |
                |         37 | William Rodriguez | female | william257@gmail.com  |             1 | 2.10 | CS102        |
                |         39 | Susan Rodriguez   | male   | susan217@gmail.com    |             1 | 2.11 | CS102        |
                |         42 | Jessica Miller    | female | jessica216@gmail.com  |             1 | 2.43 | CS102, DS104 |
                |         45 | James Wilson      | male   | james281@gmail.com    |             1 | 3.42 | DS104        |
                |         46 | Susan Johnson     | male   | susan262@gmail.com    |             1 | 3.06 | CS102        |
                |         48 | Karen Garcia      | male   | karen200@gmail.com    |             3 | 2.96 | DS104        |
                |         49 | Robert Davis      | female | robert138@gmail.com   |             2 | 2.90 | CS102        |
                +------------+-------------------+--------+-----------------------+---------------+------+--------------+


 		fail: Error: student_id needs to be a positive integer.
              Error: student with student_id 10000 either is not enrolled in any courses or does not have any classmates.


# find info of all students in the student database who is taught by professor with the specified professor_id
def search_students_from_professor_id(professor_id):
    @USAGE:
        python3 project_backend_basics.py search_students_from_professor_id 3
    @RETURN: 
        success: 
                ((9, 'Jennifer Hernandez', 'female', 'jennifer285@gmail.com', 1, Decimal('3.60'), 'DS104'), (12, 'William Hernandez', 'female', 'william262@gmail.com', 1, Decimal('3.01'), 'DS104'), (16, 'Robert Moore', 'female', 'robert253@gmail.com', 2, Decimal('3.26'), 'DS104'), (30, 'Thomas Brown', 'male', 'thomas279@gmail.com', 2, Decimal('2.60'), 'DS104'), (34, 'Patricia Martin', 'male', 'patricia296@gmail.com', 1, Decimal('3.78'), 'DS104'), (42, 'Jessica Miller', 'female', 'jessica216@gmail.com', 1, Decimal('2.43'), 'DS104'), (45, 'James Wilson', 'male', 'james281@gmail.com', 1, Decimal('3.42'), 'DS104'), (48, 'Karen Garcia', 'male', 'karen200@gmail.com', 3, Decimal('2.96'), 'DS104'))

                +------------+--------------------+--------+-----------------------+---------------+------+------------+
                | student_id | name               | gender | email                 | department_id | gpa  | course_ids |
                +------------+--------------------+--------+-----------------------+---------------+------+------------+
                |          9 | Jennifer Hernandez | female | jennifer285@gmail.com |             1 | 3.60 | DS104      |
                |         12 | William Hernandez  | female | william262@gmail.com  |             1 | 3.01 | DS104      |
                |         16 | Robert Moore       | female | robert253@gmail.com   |             2 | 3.26 | DS104      |
                |         30 | Thomas Brown       | male   | thomas279@gmail.com   |             2 | 2.60 | DS104      |
                |         34 | Patricia Martin    | male   | patricia296@gmail.com |             1 | 3.78 | DS104      |
                |         42 | Jessica Miller     | female | jessica216@gmail.com  |             1 | 2.43 | DS104      |
                |         45 | James Wilson       | male   | james281@gmail.com    |             1 | 3.42 | DS104      |
                |         48 | Karen Garcia       | male   | karen200@gmail.com    |             3 | 2.96 | DS104      |
                +------------+--------------------+--------+-----------------------+---------------+------+------------+

 		fail: Error: professor_id needs to be a positive integer.
              Error: professor with professor_id 4000 either is not teaching any courses or no student is enrolled in the course.


# database mangaer operation: insert many rows of course enrollment information into the database
def student_enroll_many_course(csv_file)
    @USAGE:
        python3 project_backend_basics.py student_enroll_many_course input.csv
        input.csv format:
            MATH150,99
            STAT101,66
            DCS101,15
    @NOTE: This is a manager operation, no format check and seat_available check!


# increase the number of student database by {incresement}
# if there are databases student1, student2, student3, and user runs scale_db(5)
# then databases student4, student5 will be created
# all data in student1-3 will be taken out, hashed, and reinsert into student1-5
# databases according to the new hash result.
# for detailed procedure, please check the comments of scale_db() in project_backend_basics.py
def scale_db(increasement): # increasement = num of db to increase
    @USAGE:
        python3 project_backend_basics.py scale_db 1
    @NOTE: This is a manager operation, change value of STUDENT_DATABASE_SIZE at line 21 of project_backend_basics.py after operation!








