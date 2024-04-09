def get_student_info(student_id)
    @USAGE: 
        python local_backend_server.py '{"get_student_info": 99}'
    @RETURN: 
        success: {'student_id': 100, 'student_name': 'Linda Garcia', 'gender': 'female', 'email': 'lindagarcia91@university.edu', 'department_id': 3, 'gpa': 2.14}
        fail: No info found for student with student_id 1001.


def enroll_student(student_info ={name, gender, email, department_id, gpa})
    @USAGE: 
        python local_backend_server.py '{"enroll_student": { "name":  "jenny",  "gender":  "female",  "email":  "jenfsd@gmail.com",  "department_id": 3,  "gpa": 3.67}}' 
	@RETURN: 
        success: student_id 108: insert was successful.
 		fail: Insert failed.