# WebSockets Client Example
from websocket import create_connection

def connect(uri):
    global wscon
    wscon = create_connection(uri)
    reply = wscon.recv()
    print(reply)
    
def close():
    global wscon
    wscon.close()
    
def echo(msg):
    global wscon
    wscon.send(msg)
    print(f"send> {msg}")
    reply = wscon.recv()
    print(f"\trecv< {reply}")
    return reply
    
        
if __name__ == '__main__':
    uri = "ws://echodocker:8080/"
    connect(uri)
    go=1
    while go>0 :
        back = "*"
        ms = input("\nyour message? ")+" "
        if ms[0]=="*": 
            break
        back = echo(ms)
   
    print ("closing")
    close()
