import paramiko
import sys

# SSH connection setup
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

private_key_path = 'dsci551-sp24.pem'
ssh.connect('ec2-3-14-71-47.us-east-2.compute.amazonaws.com', username ='ubuntu', key_filename = private_key_path)

student_id = sys.argv[1]
stdin, stdout, stderr = ssh.exec_command(f'python3 /home/ubuntu/Project/project_backend_basics.py {student_id}')

#Reading output (optional)
output = stdout.read().decode('utf-8')
print(output)

# Close SSH connection
ssh.close()
