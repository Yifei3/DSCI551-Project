import json
from flask import Flask, jsonify, redirect
from flask import Flask, request, send_from_directory
from flask import Flask, request, render_template
import paramiko
from decimal import Decimal

ssh = None

# 初始化SSH连接
def initialize_ssh():
    global ssh
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    private_key_path = 'dsci551-sp24.pem'
    ssh.connect('ec2-18-217-182-18.us-east-2.compute.amazonaws.com', username='ubuntu', key_filename=private_key_path)
    return ssh

app = Flask(__name__)

@app.route('/')
# def hello():
#     return 'Hello, World!'

def index():

    # success = request.args.get('success')
    # return render_template('index.html', success=success)

    return send_from_directory("templates", 'index.html')


#search

@app.route('/get_student_info', methods=['POST'])
def get_info_by_student_id():
    try:
        data = request.form['data']
        ssh = initialize_ssh()
        command = f'python3 /home/ubuntu/Project/project_backend_basics.py get_student_info {data}'
        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode('utf-8')
        print("output", output)
        ssh.close()
        # print(type(output))
        info = eval(output)
        # print(type(info))
        student_info = {
            'student_id': info['student_id'],
            'student_name': info['student_name'],
            'gender': info['gender'],
            'email': info['email'],
            'department_id': info['department_id'],
            'gpa': info['gpa']
        }
        print(student_info)
        return render_template('student.html', result=student_info)
    except Exception as e:
        return render_template('error.html')

@app.route('/get_professor_info', methods=['POST'])
def get_professor_info():
    try:
        data = request.form['data']
        ssh = initialize_ssh()
        command = f'python3 /home/ubuntu/Project/project_backend_basics.py get_student_info {data}'
        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode('utf-8')
        print("output", output)
        ssh.close()
        # print(type(output))
        info = eval(output)
        # print(type(info))
        student_info = {
            'student_id': info['student_id'],
            'student_name': info['student_name'],
            'gender': info['gender'],
            'email': info['email'],
            'department_id': info['department_id'],
            'gpa': info['gpa']
        }
        print(student_info)
        return render_template('student.html', result=student_info)
    except Exception as e:
        return render_template('error.html')

@app.route('/get_course_info', methods=['POST'])
def get_course_info():
    try:
        data = request.form['data']
        ssh = initialize_ssh()
        command = f'python3 /home/ubuntu/Project/project_backend_basics.py get_student_info {data}'
        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode('utf-8')
        print("output", output)
        ssh.close()
        # print(type(output))
        info = eval(output)
        # print(type(info))
        student_info = {
            'student_id': info['student_id'],
            'student_name': info['student_name'],
            'gender': info['gender'],
            'email': info['email'],
            'department_id': info['department_id'],
            'gpa': info['gpa']
        }
        print(student_info)
        return render_template('student.html', result=student_info)
    except Exception as e:
        return render_template('error.html')

@app.route('/search_students_by_gpa', methods=['POST'])
def search_students_by_gpa():
    try:
        data = request.form['data']
        ssh = initialize_ssh()
        command = f'python3 /home/ubuntu/Project/project_backend_basics.py get_student_info {data}'
        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode('utf-8')
        print("output", output)
        ssh.close()
        # print(type(output))
        info = eval(output)
        # print(type(info))
        student_info = {
            'student_id': info['student_id'],
            'student_name': info['student_name'],
            'gender': info['gender'],
            'email': info['email'],
            'department_id': info['department_id'],
            'gpa': info['gpa']
        }
        print(student_info)
        return render_template('student.html', result=student_info)
    except Exception as e:
        return render_template('error.html')

@app.route('/search_students_from_professor_id', methods=['POST'])
def search_students_from_professor_id():
    try:
        data = request.form['data']
        ssh = initialize_ssh()
        command = f'python3 /home/ubuntu/Project/project_backend_basics.py get_student_info {data}'
        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode('utf-8')
        print("output", output)
        ssh.close()
        # print(type(output))
        info = eval(output)
        # print(type(info))
        student_info = {
            'student_id': info['student_id'],
            'student_name': info['student_name'],
            'gender': info['gender'],
            'email': info['email'],
            'department_id': info['department_id'],
            'gpa': info['gpa']
        }
        print(student_info)
        return render_template('student.html', result=student_info)
    except Exception as e:
        return render_template('error.html')

@app.route('/search_classmates_from_student_id', methods=['POST'])
def search_classmates_from_student_id():
    try:
        data = request.form['data']
        ssh = initialize_ssh()
        command = f'python3 /home/ubuntu/Project/project_backend_basics.py get_student_info {data}'
        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode('utf-8')
        print("output", output)
        ssh.close()
        # print(type(output))
        info = eval(output)
        # print(type(info))
        student_info = {
            'student_id': info['student_id'],
            'student_name': info['student_name'],
            'gender': info['gender'],
            'email': info['email'],
            'department_id': info['department_id'],
            'gpa': info['gpa']
        }
        print(student_info)
        return render_template('student.html', result=student_info)
    except Exception as e:
        return render_template('error.html')





#enroll

@app.route('/enroll_student', methods=['POST'])
def enroll_student():
    try:

        student_name = request.form['student_name']
        gender = request.form['gender']
        email = request.form['email']
        department_id = request.form['department_id']
        gpa = request.form['gpa']

        data = {
            'name': student_name,
            'gender': gender,
            'email': email,
            'department_id': int(department_id),
            'gpa': float(gpa)
        }

        print(type(data),data)
        data = json.dumps(data)
        print(type(data), data)

        ssh = initialize_ssh()
        command = f'python3 /home/ubuntu/Project/project_backend_basics.py enroll_student \'{data}\''


# python3 / home / ubuntu / Project / project_backend_basics.py enroll_student '{"name": "jenny", "gender": "female", "email": "jenfsd@gmail.com", "department_id": 3, "gpa": 3.67}'

        print(command)
        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode('utf-8')
        print("output", output)
        ssh.close()

        return render_template('result.html', result=output)

    except Exception as e:
        return render_template('result.html', result="Failed")


if __name__ == '__main__':

    app.run(debug=True)
