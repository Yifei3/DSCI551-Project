# IMPORT LIBRARIES
import sys
from sqlalchemy import create_engine
import pymysql
import pandas as pd
import json

# create user dsci551@localhost identified by "Dsci-551";
# grant all privileges on student1.* to dsci551@localhost;
# grant all privileges on student2.* to dsci551@localhost;
# grant all privileges on university.* to dsci551@localhost;

DATABASE_CONNECTION_PARAMS = {
    'host': 'localhost',
    'user': 'dsci551',
    'password': 'Dsci-551',
}

STUDENT_DATABASE_SIZE = 2

def hash_database(student_id):
    if student_id % 100 <= 50 and student_id % 100 != 0:
        return 'student1'
    else:
        return 'student2'

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
        if cursor:
            cursor.close()
        if connection:
            connection.close()
        max_id = max(max_id, rows[0][0])
    return max_id + 1

class sql_crud:
    @staticmethod
    def get_student_info(student_id):
        # """
        # Fetches info of a student that has the specified student_id.
        # INPUT: student_id (int)
        # RETURN: info of that student
        
        # Sample Terminal Command:python3 project_backend_basics.py 13
        # Expected Sample Output: 
        # """
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

    @staticmethod
    def enroll_student(student_info):
        # print(student_info)
        student_info_dict = json.loads(student_info)
        name, gender, email, department_id, gpa = student_info_dict.get("name"), student_info_dict.get("gender"), student_info_dict.get("email"), student_info_dict.get("department_id"), student_info_dict.get("gpa")
        student_id = get_next_student_id()

        DATABASE_CONNECTION_PARAMS['database'] = hash_database(student_id)
        connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)
        cursor = connection.cursor()
        query = 'INSERT INTO students (student_id, name, gender, email, department_id, gpa) VALUES (%s, %s, %s, %s, %s, %s)'
        cursor.execute(query, (student_id, name, gender, email, department_id, gpa))
        connection.commit()
        if cursor.rowcount > 0:
            print(f"student_id {student_id}: insert was successful.")
        else:
            print("Insert failed.")

        cursor.close()
        connection.close()
        return

# Use the below main method to test your code
if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python project_backend_basics.py '<function_name>' '<student_id>'")
        # print(sys.argv)
        # print(len(sys.argv))
        sys.exit(1)
    # print('input length correct')
    method_name = sys.argv[1]
    data = sys.argv[2]
    # print(method_name, data)
    obj = sql_crud()
    getattr(obj, method_name)(data)
    #print(get_next_student_id())

