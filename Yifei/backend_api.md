def get_student_info(student_id)
    @USAGE: 
        python3 project_backend_basics.py get_student_info 1
    @RETURN: 
        success: {'student_id': 100, 'student_name': 'Linda Garcia', 'gender': 'female', 'email': 'lindagarcia91@university.edu', 'department_id': 3, 'gpa': 2.14}
        fail: No info found for student with student_id 1001.

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



def enroll_student(student_info ={name, gender, email, department_id, gpa})
    @USAGE: 
        python3 project_backend_basics.py enroll_student '{"name": "jenny", "gender": "female", "email": "jenfsd@gmail.com", "department_id": 3, "gpa": 3.67}'
	@RETURN: 
        success: student_id 108: insert was successful.
 		fail: Insert failed.
    @ISSUES:
        format check, failed check

