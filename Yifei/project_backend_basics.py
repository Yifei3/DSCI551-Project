# IMPORT LIBRARIES
import sys
from sqlalchemy import create_engine
import pymysql
import pandas as pd

# create user dsci551@localhost identified by "Dsci-551";
# grant all privileges on student1.* to dsci551@localhost;
# grant all privileges on student2.* to dsci551@localhost;
# grant all privileges on university.* to dsci551@localhost;


DATABASE_CONNECTION_PARAMS = {
    'host': 'localhost',
    'user': 'dsci551',
    'password': 'Dsci-551',
}

def hash_database(student_id):
    if student_id % 100 <= 50 or student_id % 100 == 0:
        return 'student1'
    else:
        return 'student2'

def get_info_by_student_id(student_id):
    """
    Fetches info of a student that has the specified student_id.
    INPUT: student_id (int)
    RETURN: info of that student
    
    Sample Terminal Command:python3 project_backend_basics.py 13
    Expected Sample Output: 
    """

    DATABASE_CONNECTION_PARAMS['database'] = hash_database(student_id)
    connection = pymysql.connect(**DATABASE_CONNECTION_PARAMS)

    cursor = connection.cursor()

    query = '''
            SELECT * FROM students s
            WHERE s.student_id = %s
            '''
    cursor.execute(query, student_id)
    
    rows = cursor.fetchall()

    if cursor:
        cursor.close()
    if connection:
        connection.close()
        
    if not rows:
        return
    return rows[0]


# Use the below main method to test your code
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python project_backend_basics.py '<student_id>'")
        sys.exit(1)
    student_id = int(sys.argv[1])
    info = get_info_by_student_id(student_id)
    if info:
        print(f"Information of student with student_id {student_id}: {info}")
    else:
        print(f"No info found for student with student_id {student_id}.")

