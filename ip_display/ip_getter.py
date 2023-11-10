import socket
import subprocess

def get_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        s.connect(('192.255.255.255', 1))
        IP = s.getsockname()[0]
    except:
        IP = '127.0.0.1'
    finally:
        s.close()
    return IP

def get_ssid():
    try:
        ret = subprocess.check_output(["iwgetid", "-r"])
    except:
        ret = "Error Getting Wifi :("
    return ret

#print(get_ip())
#print(get_ssid())
