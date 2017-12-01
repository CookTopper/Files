import socket
import machine
import json

#Setup Socket WebServer
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('192.168.1.6', 80))
s.listen(5)

while True:
    conn, addr = s.accept()
    print("Got a connection from %s" % str(addr))

    conn_file = conn.makefile('rwb', 0)
    while True:
    	line = conn_file.readline()
    	if not line or line == b'\r\n':
    		break

    ad0 = machine.ADC(0)
    response = json.dumps({'value': ad0.read()})
    conn.send('HTTP/1.0 200 OK\r\n')
    conn.send("Content-Type: application/json\r\n\r\n")
    conn.send(response)
    conn.close()