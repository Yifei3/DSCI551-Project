import paramiko
import sys
import json

class sql_crud:
    @staticmethod
    def get_student_info(ssh, student_id):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py {student_id}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def get_professor_info(ssh, professor_id):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py {professor_id}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def get_course_info(ssh, course_id):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py {course_id}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def enroll_student(ssh, student_info): # {student_id, student_name, gender, email, department_id, gpa}
        ...

    @staticmethod
    def withdraw_student(ssh, student_id):
        ...

    @staticmethod
    def withdraw_student(ssh, student_id):
        ...

    @staticmethod
    def student_enroll_course(ssh, student_id, course_id):
        ...

    @staticmethod
    def student_withdraw_course(ssh, student_id, course_id):
        ...

    @staticmethod
    def search_students_by_gpa(ssh, gpa_range): # [min, max]
        ...

    @staticmethod
    def search_students_from_professor_id(ssh, professor_id):
        ...

    @staticmethod
    def search_classmates_from_student_id(ssh, student_id):
        ...

    @staticmethod
    def modify_student_info(ssh, student_id, student_info):
        ...

# SSH connection setup
def connection_setup():
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    private_key_path = 'dsci551-sp24.pem'
    ssh.connect('ec2-3-14-71-47.us-east-2.compute.amazonaws.com', username ='ubuntu', key_filename = private_key_path)
    return ssh


if __name__ == "__main__":
    json_str = sys.argv[1]
    input = json.loads(json_str)
    method_name, data = next(iter(input.items()))
    print(data)
    obj = sql_crud()
    ssh = connection_setup()
    getattr(obj, method_name)(ssh, data)

    ssh.close()