import json
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

    data = request.form['data']
    ssh = initialize_ssh()
    command = f'python3 /home/ubuntu/Project/project_backend_basics.py get_student_info {data}'
    stdin, stdout, stderr = ssh.exec_command(command)
    output = stdout.read().decode('utf-8')
    print("output", output)
    ssh.close()
        # print(type(output))
    try:
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
        return render_template('error.html',result=output)

@app.route('/get_professor_info', methods=['POST'])
def get_professor_info():
    data = request.form['data']
    ssh = initialize_ssh()
    command = f'python3 /home/ubuntu/Project/project_backend_basics.py get_professor_info {data}'
    stdin, stdout, stderr = ssh.exec_command(command)
    output = stdout.read().decode('utf-8')
    print("output", output)
    ssh.close()
    try:
        info = eval(output)
        # print(type(info))
        professor_info = {
            'professor_id': info['professor_id'],
            'professor_name': info['name'],
            'gender': info['gender'],
            'email': info['email'],
            'department_id': info['department_id'],
            'salary': info['salary']
        }
        print(professor_info)
        return render_template('professor.html', result=professor_info)
    except Exception as e:
        return render_template('error.html',result=output)

@app.route('/get_course_info', methods=['POST'])
def get_course_info():
    data = request.form['data']
    ssh = initialize_ssh()
    command = f'python3 /home/ubuntu/Project/project_backend_basics.py get_course_info {data}'
    stdin, stdout, stderr = ssh.exec_command(command)
    output = stdout.read().decode('utf-8')
    print("output", output)
    ssh.close()
    try:
        info = eval(output)
        # print(type(info))
        course_info = {
            'course_id': info['course_id'],
            'prof_id': info['prof_id'],
            'name': info['name'],
            'department_id': info['department_id'],
            'schedule_time': info['schedule_time'],
            'seat_available': info['seat_available'],
            'description': info['description']
        }
        print(course_info)
        return render_template('course.html', result=course_info)
    except Exception as e:
        return render_template('error.html', result=output)

@app.route('/search_students_by_gpa', methods=['POST'])
def search_students_by_gpa():
        min_gpa = request.form['min_gpa']
        max_gpa = request.form['max_gpa']
        data = min_gpa + "," + max_gpa
        print(data)
        ssh = initialize_ssh()
        command = f'python3 /home/ubuntu/Project/project_backend_basics.py search_students_by_gpa {data}'
        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode('utf-8')
        print("output", output)
        ssh.close()
        print(type(output))
        try:
            data_list = eval(output.strip())
            print(type(data_list),data_list)
            return render_template('student_list.html', result=data_list)
        except Exception as e:
            return render_template('error.html',result="gpa value needs to be a float range from 0 to 4.00")

@app.route('/search_students_from_professor_id', methods=['POST'])
def search_students_from_professor_id():
    data = request.form['data']
    ssh = initialize_ssh()
    command = f'python3 /home/ubuntu/Project/project_backend_basics.py search_students_from_professor_id {data}'
    stdin, stdout, stderr = ssh.exec_command(command)
    output = stdout.read().decode('utf-8')
    print("output", output)
    ssh.close()
    print(type(output))
    try:
        data_list = eval(output.strip())
        print(type(data_list), data_list)
        return render_template('student_list.html', result=data_list)
    except Exception as e:
        return render_template('error.html', result=output)

@app.route('/search_classmates_from_student_id', methods=['POST'])
def search_classmates_from_student_id():
    data = request.form['data']
    ssh = initialize_ssh()
    command = f'python3 /home/ubuntu/Project/project_backend_basics.py search_classmates_from_student_id {data}'
    stdin, stdout, stderr = ssh.exec_command(command)
    output = stdout.read().decode('utf-8')
    print("output", output)
    ssh.close()
    print(type(output))
    try:
        data_list = eval(output.strip())
        print(type(data_list), data_list)
        return render_template('student_list.html', result=data_list)
    except Exception as e:
        return render_template('error.html', result=output)




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
        # print(type(data),data)
        data = json.dumps(data)
        # print(type(data), data)

        ssh = initialize_ssh()
        command = f'python3 /home/ubuntu/Project/project_backend_basics.py enroll_student \'{data}\''
        # print(command)
        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode('utf-8')
        print("output", output)
        ssh.close()

        return render_template('result.html', result=output)
    except Exception as e:
        return render_template('result.html', result="Failed")

@app.route('/student_enroll_course', methods=['POST'])
def student_enroll_course():
    try:
        student_id = request.form['student_id']
        course_id = request.form['course_id']

        data=str(course_id) + ',' + str(student_id)
        print(data)

        ssh = initialize_ssh()

        command = f'python3 /home/ubuntu/Project/project_backend_basics.py student_enroll_course {data}'
        print(command)
        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode('utf-8')
        print("output", output)
        ssh.close()
        return render_template('result.html', result=output)

    except Exception as e:
        return render_template('result.html', result="Failed")


#withdraw

@app.route('/withdraw_student', methods=['POST'])
def withdraw_student():
    try:
        data = request.form['data']
        ssh = initialize_ssh()
        command = f'python3 /home/ubuntu/Project/project_backend_basics.py withdraw_student {data}'
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
