# WebSockets Client Example
from websocket import create_connection

def connect(uri):
    global wscon
    wscon = create_connection(uri)
    
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
    uri = "ws://echo.websocket.org/"
    connect(uri)
    back = "*"
    ms = input("\nyour message1? ")
    back = echo(ms)
    print (f"\nreply>>>> {back}")
    ms = input("\nyour message2? ")
    back = echo(ms)
    print (f"\nreply>>>> {back}")
    close()
