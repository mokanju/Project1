# Project1
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Images/netwk_diagram2.PNG

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the configuration file may be used to install only certain pieces of it, such as Filebeat.

Ansible/filebeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balancer and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable, in addition to restricting access to the network.
- What aspect of security do load balancers protect? Access control.    -  - What is the advantage of a jump box?_The advantage of the jump box is that it acts a launch pad from which to access other servers on the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the memory and system logs.
- What does Filebeat watch for? It watches for file changes to the file system as to what changed and when.
- What does Metricbeat record? It records metrics and statistics

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function   | IP Address              | Operating System |
|----------|------------|-------------------------|------------------|
| Jump Box | Gateway    | 20.106.241.233 10.0.0.4 | Linux            |
| Web-1    | Webserver  | 20.124.244.83 10.0.0.9  | Linux            |
| Web-2    | Webserver  | 20.124.244.83 10.0.0.8  | Linux            |
| ElkVM    | Log Server | 168.61.180.82 10.2.0.4  | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Network Security Group machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
		67.164.41.26
		73.170.10.204

Machines within the network can only be accessed by TCP specifically (SSH and HTTP).

Access to the ELK VM machine is only allowed from the following IP addresses:
		67.164.41.26
		73.170.10.204

The ELK VM’s IP address is 52.176.54.27


A summary of the access policies in place can be found in the table below.


| Name     | Publicly Accessible | Allowed IP Addresses       |
|----------|---------------------|----------------------------|
| Jump Box | Yes                 | 67.164.41.26 73.170.10.204 |
| Web-1    | No                  |                            |
| Web-2    | No                  |                            |
| ElkVM    | Yes                 | 67.164.41.26 73.170.10.204 |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it could be quickly recreated.
- What is the main advantage of automating configuration with Ansible? The main advantage is automation. Automate install process.

The playbook implements the following tasks:
- In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; start service; enable on boot; and restart system.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

 output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- List the IP addresses of the machines you are monitoring
	10.0.0.8
	10.0.0.9

We have installed the following Beats on these machines:
- Specify which Beats you successfully installed
		filebeat-7.4.0-amd64.deb
		metricbeat-7.4.0-amd64.deb

These Beats allow us to collect the following information from each machine:
-In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

Filebeat monitors log files and collects events e.g syslog which logs system events such as backups and failed log in attempts.
While Metricbeat takes the metrics and statistics that it collects and send them to the output that one specifies.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the public key file to webservers on Azure.
- Update the config file to include host IP address
- Run the playbook, and navigate to the ELK server to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Filebeat-playbook.yml It is the file that does the installs and downloads. Where do you copy it? /etc/ansible. You get it for 
- _Which file do you update to make Ansible run the playbook on a specific machine? The ansible config file (ansible.cfg). How do I specify which machine to install the ELK server on versus which to install Filebeat on?_Update the host hosts file.
- _Which URL do you navigate to in order to check that the ELK server is ruing? Try to connect to the IP address of the server which in our case is in our case 168.61.180.82  

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.
 ansible-playbook my-playbook.yml 
