# IMPORT LIBRARIES
import sys
from sqlalchemy import create_engine
import pymysql
import pandas as pd
import json
import csv

# create user dsci551@localhost identified by "Dsci-551";
# grant all privileges on student1.* to dsci551@localhost;
# grant all privileges on student2.* to dsci551@localhost;
# grant all privileges on university.* to dsci551@localhost;

DATABASE_CONNECTION_PARAMS = {
    'host': 'localhost',
    'user': 'dsci551',
    'password': 'Dsci-551',
}

# **********************
# change after scaling!
STUDENT_DATABASE_SIZE = 4

def is_pos_integer(s):
    try:
        int(s)
        return int(s) > 0
    except ValueError:
        return False

def is_gpa_float(s):
    try:
        value = float(s)
        return 0 <= value <= 4.00
    except ValueError:
        return False

def info_format_check(attr, value):
    # name, gender, email, department_id, gpa
    if attr == 'name':
        name = value.strip()
        if not name:
            print('Invalid name format.')
            return False
        parts = name.split()
        for part in parts:
            if not all(char.isalpha() or char in "-'" for char in part):
                print('Invalid name format.')
                return False
    elif attr == 'gender':
        if value != 'male' and value != 'female' and value != 'other':
            print('Invalid gender. Please select male / female / other.')
            return False
    elif attr == 'email':
        if not isinstance(value, str):
            print('Invalid email format.')
            return False
        try:
            user, domain = value.split('@')
            if not user or not domain or '.' not in domain:
                print('Invalid email format.')
                return False
            domain_parts = domain.split('.')
            if len(domain_parts) < 2 or any(part.strip() == '' for part in domain_parts):
                print('Invalid email format.')
                return False
        except Exception as e:
            print('Invalid email format.')
            return False
    elif attr == 'department_id':
        if not is_pos_integer(value):
            print('Invalid department_id.')
            return False
    elif attr == 'gpa':
        if not is_gpa_float(value):
            print('Invalid gpa value.')
            return False
    return True


# def hash_database(student_id):
#     student_id = int(student_id)
#     if student_id % 100 <= 50 and student_id % 100 != 0:
#         return 'student1'
#     else:
#         return 'student2'

def hash_database(student_id, num_database=STUDENT_DATABASE_SIZE):
    student_id = int(student_id)
    return 'student' + str((student_id % num_database) + 1)

# find the max student_id, +1 and return
def get_next_student_id():
    max_id = 0
    for i in range(STUDENT_DATABASE_SIZE):
        DATABASE_CONNECTION_PARAMS['database'] = 'student' + str(i + 1)
        connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
        cursor = connection.cursor()

        query = 'SELECT student_id FROM students s ORDER BY student_id desc LIMIT 1'
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
        if rows and rows[0] and rows[0][0]:
            max_id = max(max_id, rows[0][0])
    return max_id + 1

def course_seats_check(course_id):
    DATABASE_CONNECTION_PARAMS['database'] = 'university'
    connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
    cursor = connection.cursor()
    query = 'SELECT seat_available FROM courses WHERE course_id = %s'
    cursor.execute(query, course_id)
    rows = cursor.fetchall()
    cursor.close()
    connection.close()
    if not rows or not rows[0]:
        return -1
    # print(rows[0][0])
    return rows[0][0]

def course_seat_change(course_id, amount):
    DATABASE_CONNECTION_PARAMS['database'] = 'university'
    connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
    cursor = connection.cursor()
    query = 'UPDATE courses SET seat_available = seat_available + %s WHERE course_id = %s'
    cursor.execute(query, (amount, course_id))
    connection.commit()
    rows = cursor.fetchall()
    cursor.close()
    connection.close()
    return

def grant_premission(db_name):
    DATABASE_CONNECTION_PARAMS['user'] = 'root'
    connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
    cursor = connection.cursor()
    try:
        cursor.execute(f"GRANT ALL PRIVILEGES ON {db_name}.* TO 'dsci551'@'localhost'")
        cursor.execute("FLUSH PRIVILEGES")
        connection.commit()
        print("Privileges granted successfully.")
    except pymysql.Error as e:
        print("MySQL Error:", e)
    except Exception as e:
        print("An error occurred:", e)
    finally:
        cursor.close()
        connection.close()

def create_new_dbs(increasement):
    for i in range(int(increasement)):
        db_name = 'student' + str(STUDENT_DATABASE_SIZE + i + 1)
        print('db_name: ', db_name)
        connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
        cursor = connection.cursor()
        try:
            grant_premission(db_name)
            cursor.execute(f"DROP DATABASE IF EXISTS {db_name}")
            cursor.execute(f"CREATE DATABASE {db_name}")
            cursor.execute(f"USE {db_name}")
            cursor.execute(f"""
                            CREATE TABLE students (
                                                    student_id int NOT NULL,
                                                    name varchar(50) NOT NULL,
                                                    gender varchar(50) NOT NULL,
                                                    email varchar(50),
                                                    department_id int NOT NULL,
                                                    gpa decimal(3,2),
                                                    PRIMARY KEY (student_id))
                            """)
            
            cursor.execute(f"""
                            CREATE TABLE course_taken_by (
                                course_id varchar(50),
                                student_id int,
                                PRIMARY KEY (course_id, student_id),
                                FOREIGN KEY (student_id) REFERENCES students (student_id) ON DELETE CASCADE)
                            """)
            connection.commit()
            print("Database and tables created successfully.")
        except pymysql.Error as e:
            # Handle MySQL errors
            print("MySQL Error:", e)
        except Exception as e:
            # Handle other exceptions
            print("An error occurred:", e)
        finally:
            # Close the cursor and connection
            cursor.close()
            connection.close()
    return


class sql_crud:
    @staticmethod
    def get_student_info(student_id):
        # Fetches info of a student that has the specified student_id.
        # INPUT: student_id (int)
        # RETURN: info of that student
        if not is_pos_integer(student_id):
            print('Error: student_id needs to be a positive integer.')
            return
        student_id = int(student_id)
        DATABASE_CONNECTION_PARAMS['database'] = hash_database(student_id)
        connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
        cursor = connection.cursor()

        query = 'SELECT * FROM students s WHERE s.student_id = %s'
        
        cursor.execute(query, student_id)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
            
        if not rows or not rows[0]:
            print(f"No info found for student with student_id {student_id}.")
            return

        student_id, student_name, gender, email, department_id, gpa = list(rows[0])
        student_info = {
            'student_id': student_id,
            'student_name': student_name,
            'gender': gender,
            'email': email,
            'department_id': department_id,
            'gpa': float(gpa)
        }
        print(student_info)
        return

    @staticmethod
    def get_professor_info(professor_id):
        # Fetches info of a professor that has the specified professor_id.
        # INPUT: professor_id (int)
        # RETURN: info of that professor
        if not is_pos_integer(professor_id):
            print('Error: professor_id needs to be a positive integer.')
            return
        
        professor_id = int(professor_id)
        DATABASE_CONNECTION_PARAMS['database'] = 'university'
        connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
        cursor = connection.cursor()

        query = 'SELECT * FROM professors p WHERE p.professor_id = %s'
        cursor.execute(query, professor_id)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
            
        if not rows or not rows[0]:
            print(f"No info found for professor with professor_id {professor_id}.")
            return
        professor_id, name, gender, email, department_id, salary= list(rows[0])
        professor_info = {
            'professor_id': professor_id,
            'name': name,
            'gender': gender,
            'email': email,
            'department_id': department_id,
            'salary': float(salary)
        }
        print(professor_info)
        return

    @staticmethod
    def get_course_info(course_id):
        # Fetches info of a course that has the specified course_id.
        # INPUT: course_id
        # RETURN: info of that course
        DATABASE_CONNECTION_PARAMS['database'] = 'university'
        connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
        cursor = connection.cursor()

        query = 'SELECT * FROM courses c WHERE c.course_id = %s'
        cursor.execute(query, course_id)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
            
        if not rows or not rows[0]:
            print(f"No info found for course with course_id {course_id}.")
            return

        course_id, prof_id, name, department_id, schedule_time, seat_available, description= list(rows[0])
        course_info = {
            'course_id': course_id,
            'prof_id': prof_id,
            'name': name,
            'department_id': department_id,
            'schedule_time': schedule_time,
            'seat_available': seat_available,
            'description': description
        }
        print(course_info)
        return

    @staticmethod
    def enroll_student(student_info):
        # print(student_info)
        try:
            student_info_dict = json.loads(student_info)
            name, gender, email, department_id, gpa = student_info_dict.get("name"), student_info_dict.get("gender"), student_info_dict.get("email"), student_info_dict.get("department_id"), student_info_dict.get("gpa")
        except Exception as e:
            print(f"An error occurred: {e}")
            print('Invalid student_info input. Enrollment failed.')
            return 
        
        a = info_format_check("name", name)
        b = info_format_check("gender", gender)
        c = info_format_check("email", email)
        d = info_format_check("department_id", department_id)
        e = info_format_check("gpa", gpa)
        if not (a and b and c and d and e):
            print('Enrollment failed.')
            # print(a,b,c,d,e)
            return
        # print('format check passed')
        student_id = get_next_student_id()

        DATABASE_CONNECTION_PARAMS['database'] = hash_database(student_id)
        connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
        cursor = connection.cursor()
        query = 'INSERT INTO students (student_id, name, gender, email, department_id, gpa) VALUES (%s, %s, %s, %s, %s, %s)'
        try:
            cursor.execute(query, (student_id, name, gender, email, department_id, gpa))
            connection.commit()
            if cursor.rowcount > 0:
                print(f"student_id {student_id}: Enrollment was successful.")
            else:
                print("Enrollment failed.")
        except Exception as e:
            print(f"An error occurred: {e}")
        finally:
            cursor.close()
            connection.close()
        return

    @staticmethod
    def withdraw_student(student_id):
        # Delete the student from databases that has the specified student_id.
        # INPUT: student_id (int)
        # RETURN: SUCCESS / FAIL

        if not is_pos_integer(student_id):
            print('Error: student_id needs to be a positive integer.')
            return
        
        student_id = int(student_id)
        DATABASE_CONNECTION_PARAMS['database'] = hash_database(student_id)
        connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
        cursor = connection.cursor()

        query = 'DELETE FROM students s WHERE s.student_id = %s'
        
        affected_rows = cursor.execute(query, student_id)
        connection.commit()
        if affected_rows > 0:
            print(f"Student with student_id {student_id} is successfully deleted.")
        else:
            print(f"Delete failed. Student with student_id {student_id} not exist.")

        # Close the cursor and connection
        cursor.close()
        connection.close()

    @staticmethod
    def student_enroll_course(enroll_info):
        course_id, student_id = enroll_info.split(',')
        if not is_pos_integer(student_id):
            print('Error: student_id needs to be a positive integer.')
            return
        seats_remain = course_seats_check(course_id)
        if seats_remain == -1:
            print(f"Course with course_id {course_id} is not exist. Course enrollment failed.")
            return
        elif seats_remain == 0:
            print(f'Course with course_id {course_id} has no available seat remaining. Course enrollment failed.')
            return

        # if not check_empty_seat(course_id):
        #     print(f'There is no available seat remaining in course with course_id {course_id}. Course enrollment failed.')

        student_id = int(student_id)
        DATABASE_CONNECTION_PARAMS['database'] = hash_database(student_id)
        connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
        cursor = connection.cursor()
        query = 'INSERT INTO course_taken_by (course_id, student_id) VALUES (%s, %s)'
        try:
            cursor.execute(query, (course_id, student_id))
            connection.commit()
            if cursor.rowcount > 0:
                print(f"course_id {course_id}, student_id {student_id}: insert was successful.")
                course_seat_change(course_id, -1)
            else:
                print("Course enrollment failed.")

        except pymysql.IntegrityError as e:
            error_message = str(e)
            # print("IntegrityError:", e)
            if "Duplicate entry" in error_message:
                print(f"Student with student_id {student_id} is already enrolled in this course. Duplicate course enrollment is not allowed.")
            elif "a foreign key constraint fails" in error_message:
                print(f"Student with student_id {student_id} is not exist. Course enrollment failed.")
            else:
                print("Course enrollment failed.")
        except Exception as e:
            print(f"An error occurred: {e}")

        finally:
            cursor.close()
            connection.close()
        return

    @staticmethod
    def student_enroll_many_course(csv_file):
        enrollments_by_db = {}
        for i in range (STUDENT_DATABASE_SIZE):
            enrollments_by_db[f'student{i + 1}'] = []
        with open(csv_file, 'r') as file:
            reader = csv.reader(file)
            for row in reader:
                enroll_info = ','.join(row)
                course_id, student_id = enroll_info.split(',')
                db_key = hash_database(student_id)
                enrollments_by_db[db_key].append((course_id, int(student_id)))

        for db_key, enrollments in enrollments_by_db.items():
            DATABASE_CONNECTION_PARAMS['database'] = db_key
            connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
            cursor = connection.cursor()
            query = 'INSERT INTO course_taken_by (course_id, student_id) VALUES (%s, %s)'
            try:
                cursor.executemany(query, enrollments)
                connection.commit()
                for course_id, student_id in enrollments:
                    course_seat_change(course_id, -1)
            except Exception as e:
                print(f"An error occurred during enrollment: {e}")
            finally:
                cursor.close()
                connection.close()
        return



    @staticmethod
    def student_withdraw_course(withdraw_info):
        course_id, student_id = withdraw_info.split(',')
        student_id = int(student_id)

        if course_seats_check(course_id) == -1:
            print(f"Course with course_id {course_id} is not exist. withdrawl from course failed.")
            return
        
        DATABASE_CONNECTION_PARAMS['database'] = hash_database(student_id)
        connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
        cursor = connection.cursor()
        query = 'DELETE FROM course_taken_by WHERE course_id = %s AND student_id = %s'
        try:
            affected_rows = cursor.execute(query, (course_id, student_id))
            connection.commit()
            if cursor.rowcount > 0:
                print(f"course_id {course_id}, student_id {student_id}: withdrawl was successful.")
                course_seat_change(course_id, 1)
            else:
                print(f"Student with student_id {student_id} is either not exist or not enrolled in course with course_id {course_id}. Course withdrawl failed.")
        except Exception as e:
            print(f"An error occurred: {e}")
        
        finally:
            cursor.close()
            connection.close()
        return


    @staticmethod
    def search_students_by_name(name):
        if not(isinstance(name, str) and bool(name.strip())):
            print('Error: please enter a non-empty string.')
            return
        student_tuple = ()
        for i in range(STUDENT_DATABASE_SIZE):
            DATABASE_CONNECTION_PARAMS['database'] = 'student' + str(i + 1)
            connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
            cursor = connection.cursor()

            query = 'SELECT * FROM students s WHERE name LIKE %s'
            cursor.execute(query, '%' + name + '%')
            rows = cursor.fetchall()
            student_tuple = student_tuple + rows
        sorted_tuple = sorted(student_tuple, key=lambda x: x[-1])
        if sorted_tuple:
            print(sorted_tuple)
        else:
            print('No matching result.')
        return

    @staticmethod
    def search_students_by_gpa(gpa_range):
        gpa_min, gpa_max = gpa_range.split(',')
        if not is_gpa_float(gpa_min) or not is_gpa_float(gpa_max):
            print('Error: gpa value needs to be a float range from 0 to 4.00')
            return
        student_tuple = ()
        for i in range(STUDENT_DATABASE_SIZE):
            DATABASE_CONNECTION_PARAMS['database'] = 'student' + str(i + 1)
            connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
            cursor = connection.cursor()

            query = 'SELECT * FROM students s WHERE gpa >= %s AND gpa <= %s ORDER BY gpa asc'
            cursor.execute(query, (gpa_min, gpa_max))
            rows = cursor.fetchall()
            student_tuple = student_tuple + rows
        sorted_tuple = sorted(student_tuple, key=lambda x: x[-1])
        print(sorted_tuple)

    @staticmethod
    def modify_student_info(student_info):
        student_info_dict = json.loads(student_info)
        student_id = student_info_dict['student_id']
        change_attr, change_value = list(student_info_dict.items())[1][0], list(student_info_dict.items())[1][1]
        if not info_format_check(change_attr, change_value):
            return
        if not is_pos_integer(student_id):
            print('Error: student_id needs to be a positive integer.')
            return
        student_id = int(student_id)
        DATABASE_CONNECTION_PARAMS['database'] = hash_database(student_id)
        connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
        cursor = connection.cursor()

        query = f'UPDATE students s SET {change_attr} = %s WHERE s.student_id = %s'
        
        try:
            cursor.execute(query, (change_value, student_id))
            connection.commit()

            if cursor.rowcount > 0:
                print("Update successful.")
            else:
                print(f"Update failed. Either student with student_id {student_id} is not exist or the value entered is the same as previous.")

            rows = cursor.fetchall()
        except Exception as e:
            # If an exception occurs, rollback the transaction
            connection.rollback()
            print("Error:", e)
        finally:
            cursor.close()
            connection.close()
        return

    @staticmethod
    def search_classmates_from_student_id(student_id):
        '''
        select s.student_id, s.name, s.gender, s.email, s.department_id, s.gpa, GROUP_CONCAT(c.course_id ORDER BY c.course_id SEPARATOR ', ') AS course_ids 
        from course_taken_by c 
        join students s on c.student_id = s.student_id 
        where course_id in (
                        select course_id from student1.course_taken_by where student_id = 5) 
        and s.student_id != 5 
        group by s.student_id 
        order by student_id;
        '''
        if not is_pos_integer(student_id):
            print('Error: student_id needs to be a positive integer.')
            return

        student_id = int(student_id)
        subquery_db = hash_database(student_id)
        classmates_tuple = ()
        for i in range(STUDENT_DATABASE_SIZE):
            DATABASE_CONNECTION_PARAMS['database'] = 'student' + str(i + 1)
            connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
            cursor = connection.cursor()
        
            query = f"select s.student_id, s.name, s.gender, s.email, s.department_id, s.gpa, GROUP_CONCAT(c.course_id ORDER BY c.course_id SEPARATOR ', ') AS course_ids from course_taken_by c join students s on c.student_id = s.student_id where course_id in (select course_id from {subquery_db}.course_taken_by where student_id = %s) and s.student_id != %s group by s.student_id order by student_id"
            cursor.execute(query, (student_id, student_id))
            rows = cursor.fetchall()
            classmates_tuple = classmates_tuple + rows
        if not classmates_tuple:
            print(f'Error: student with student_id {student_id} either is not enrolled in any courses or does not have any classmates.')
        else:
            print(classmates_tuple)
        return

    @staticmethod
    def search_students_from_professor_id(professor_id):
        '''
        select s.student_id, s.name, s.gender, s.email, s.department_id, s.gpa, GROUP_CONCAT(c.course_id ORDER BY c.course_id SEPARATOR ', ') AS course_ids 
        from course_taken_by c 
        join students s on c.student_id = s.student_id 
        where course_id in (
                        select course_id from university.courses where prof_id = 5) 
        group by s.student_id 
        order by student_id;
        '''

        if not is_pos_integer(professor_id):  
            print('Error: professor_id needs to be a positive integer.')
            return
        professor_id = int(professor_id)
        students_tuple = ()

        for i in range(STUDENT_DATABASE_SIZE):
            DATABASE_CONNECTION_PARAMS['database'] = 'student' + str(i + 1)
            connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
            cursor = connection.cursor()
        
            query = "select s.student_id, s.name, s.gender, s.email, s.department_id, s.gpa, GROUP_CONCAT(c.course_id ORDER BY c.course_id SEPARATOR ', ') AS course_ids from course_taken_by c join students s on c.student_id = s.student_id where course_id in (select course_id from university.courses where prof_id = %s) group by s.student_id order by student_id"
            cursor.execute(query, professor_id)
            rows = cursor.fetchall()
            students_tuple = students_tuple + rows
        # for item in students_tuple:
        #     print(item)
        if not students_tuple:
            print(f'Error: professor with professor_id {professor_id} either is not teaching any courses or no student is enrolled in the course.')
        else:
            print(students_tuple)
        return


    @staticmethod
    def scale_db(increasement):
        # step 0: create new databases
        # step 1: read all data from students and course_taken_by tables and combine
        # step 2: rehash and group data
        # step 3: delete all data from students and course_taken_by tables (TRUNCATE TABLE table_name;)
        # step 4: insert all data back based on hashed values

        # step 0:
        create_new_dbs(increasement)

        # step 1:
        students_tuple = ()
        courses_enrollment_tuple = ()
        for i in range(STUDENT_DATABASE_SIZE):
            DATABASE_CONNECTION_PARAMS['database'] = 'student' + str(i + 1)
            connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
            cursor = connection.cursor()
            cursor.execute("select * from students")
            rows = cursor.fetchall()
            students_tuple = students_tuple + rows

            cursor.execute("select * from course_taken_by")
            rows = cursor.fetchall()
            courses_enrollment_tuple = courses_enrollment_tuple + rows
            cursor.close()
            connection.close()

        # with open('output1.csv', 'w', newline='') as csvfile:
        #     csv_writer = csv.writer(csvfile)
        #     for row in courses_enrollment_tuple:
        #         csv_writer.writerow(row)

        # step 2:
        increasement = int(increasement)
        students, courses_enrollment = {}, {}
        for i in range (STUDENT_DATABASE_SIZE + increasement):
            students[f'student{i + 1}'] = []
            courses_enrollment[f'student{i + 1}'] = []
        for i in students_tuple:
            db_key = hash_database(i[0], STUDENT_DATABASE_SIZE + increasement)
            students[db_key].append(i)
        for i in courses_enrollment_tuple:
            db_key = hash_database(i[1], STUDENT_DATABASE_SIZE + increasement)
            courses_enrollment[db_key].append(i)
        # print(courses_enrollment)

        # step 3:
        for i in range(STUDENT_DATABASE_SIZE):
            DATABASE_CONNECTION_PARAMS['database'] = 'student' + str(i + 1)
            connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
            cursor = connection.cursor()
            cursor.execute("DELETE FROM course_taken_by")
            cursor.execute("DELETE FROM students")
            connection.commit()
            cursor.close()
            connection.close()

        # step 4:
        for db_key, data in students.items():
            DATABASE_CONNECTION_PARAMS['database'] = db_key
            connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
            cursor = connection.cursor()

            query = "INSERT INTO students (student_id, name, gender, email, department_id, gpa) VALUES (%s, %s, %s, %s, %s, %s)"
            cursor.executemany(query, data)
            connection.commit()

            cursor.close()
            connection.close()

        for db_key, data in courses_enrollment.items():
            DATABASE_CONNECTION_PARAMS['database'] = db_key
            connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
            cursor = connection.cursor()

            query = "INSERT INTO course_taken_by (course_id, student_id) VALUES (%s, %s)"
            cursor.executemany(query, data)
            
            connection.commit()
            cursor.close()
            connection.close()
        return





# Use the below main method to test your code
if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python project_backend_basics.py '<function_name>' '<student_id>'")
        print(sys.argv)
        print(len(sys.argv))
        sys.exit(1)
    # print('input length correct')
    method_name = sys.argv[1]
    data = sys.argv[2]
    # print(data)
    obj = sql_crud()
    getattr(obj, method_name)(data)
    #print(get_next_student_id())

