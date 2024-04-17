import paramiko
import sys
import json

'''
class sql_crud:
    @staticmethod
    def get_student_info(ssh, student_id):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py get_student_info {student_id}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def get_professor_info(ssh, professor_id):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py get_professor_info {professor_id}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def get_course_info(ssh, course_id):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py get_course_info {course_id}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def enroll_student(ssh, student_info): # {student_id, student_name, gender, email, department_id, gpa}
        student_info_json = json.dumps(student_info)
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py enroll_student \'{student_info_json}\'')
        print('python3 /home/ubuntu/Project/project_backend_basics.py enroll_student \'' + student_info_json + '\'')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def withdraw_student(ssh, student_id):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py withdraw_student {student_id}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def student_enroll_course(ssh, enroll_info):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py student_enroll_course {enroll_info}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def student_withdraw_course(ssh, enroll_info):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py student_withdraw_course {enroll_info}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def search_students_by_gpa(ssh, gpa_range):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py student_withdraw_course {enroll_info}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def search_students_from_professor_id(ssh, professor_id):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py search_classmates_from_professor_id {professor_id}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def search_classmates_from_student_id(ssh, student_id):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py search_classmates_from_student_id {student_id}')
        output = stdout.read().decode('utf-8')
        print(output)

    @staticmethod
    def modify_student_info(ssh, student_info):
        stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py modify_student_info {student_info}')
        output = stdout.read().decode('utf-8')
        print(output)

'''

# SSH connection setup
def connection_setup():
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    private_key_path = 'dsci551-sp24.pem'
    ssh.connect('ec2-3-15-32-113.us-east-2.compute.amazonaws.com', username ='ubuntu', key_filename = private_key_path)
    return ssh


if __name__ == "__main__":
    method_name, data = sys.argv[1], sys.argv[2]
    ssh = connection_setup()
    # obj = sql_crud()
    # getattr(obj, method_name)(ssh, data)

    stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py {method_name} {data}')
    output = stdout.read().decode('utf-8')
    print(output)

    ssh.close()