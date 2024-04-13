def get_student_info(student_id)
    @USAGE: 
        python3 project_backend_basics.py get_student_info 1
    @RETURN: 
        success: {'student_id': 100, 'student_name': 'Linda Garcia', 'gender': 'female', 'email': 'lindagarcia91@university.edu', 'department_id': 3, 'gpa': 2.14}
        fail: No info found for student with student_id 1001.
              Error: student_id needs to be a positive integer.

def get_course_info(course_id)
    @USAGE: 
        python3 project_backend_basics.py get_course_info CS101
    @RETURN: 
        success: {'course_id': 'CS101', 'prof_id': 12, 'name': 'Java', 'department_id': 2, 'schedule_time': 'Tuesday 11:00', 'seat_available': 10, 'description': 'Introduction to java'}
        fail: No info found for course with course_id CSNULL.

def get_professor_info(professor_id)
    @USAGE: 
        python3 project_backend_basics.py get_professor_info 100
    @RETURN: 
        success: {'professor_id': 1, 'name': 'James Brown', 'gender': 'female', 'email': 'james.brown16@university.edu', 'department_id': 2, 'salary': 86991.23}
        fail: No info found for professor with professor_id 100.
              Error: professor_id needs to be a positive integer.

def enroll_student(student_info ={name, gender, email, department_id, gpa})
    @USAGE: 
        python3 project_backend_basics.py enroll_student '{"name": "jenny", "gender": "female", "email": "jenfsd@gmail.com", "department_id": 3, "gpa": 3.67}'
	@RETURN: 
        success: student_id 108: insert was successful.
 		fail: Insert failed.
    @ISSUES:
        format check, failed check

def withdraw_student(student_id)
    @USAGE:
        python3 project_backend_basics.py withdraw_student 113
    @RETURN: 
        success: Student with student_id 99 is successfully deleted.
 		fail: Delete failed.
    @ISSUES:
        course_taken_by change to on delete cascade or do a separate delete.

def student_enroll_course(enroll_info): # enroll_info = str(course_id) + ',' + str(student_id)
    @USAGE:
        python3 project_backend_basics.py student_enroll_course CS105,13
    @RETURN: 
        success: course_id CS105, student_id 13: insert was successful.
 		fail: Course with course_id CS15 is not exist. Course enrollment failed.
              Student with student_id 133 is not exist. Course enrollment failed.
              Student with student_id 48 is already enrolled in this course. Duplicate course enrollment is not allowed.
              Course enrollment failed.
    @ISSUE:
        check seat_available
        seat_available -1 after enrollment

def student_withdraw_course(enroll_info): # enroll_info = str(course_id) + ',' + str(student_id)
    @USAGE:
        python3 project_backend_basics.py student_withdraw_course CS105,47
    @RETURN: 
        success: course_id CS105, student_id 47: withdrawl was successful.
 		fail: Course with course_id CS10005 is not exist. Withdrawl from course failed.
              Student with student_id 51 is either not exist or not enrolled in course with course_id CS105. Course withdrawl failed.
              Course withdrawl failed. Student with student_id 48
    @ISSUE:
        seat_available +1 after withdrawl

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
              ...

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
    @ISSUE:
        student_id exist check


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
    @ISSUE:
        prof_id exist check