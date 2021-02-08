This is a demo to make use of a simple WebSocket Client with Embedded Python in IRIS.  

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation 

Clone/git pull this repo into any local directory
```
$ git clone https://github.com/rcemper/try_embedded_python  
```

Open the terminal in this directory and run:
```
$ docker-compose build
```
this may take some time to complete

Run the IRIS container with this project:
```
$ docker-compose up -d
```

## How to Test it

- Run an Iris Session in Docker 
- Select your Websocket Echo Server
- Enter the text you want to send or generate it
- Send it and see the result

```
$ docker-compose exec iris iris session iris "##class(rccpy.WSockPy).Run()"

*** Welcome to WebSocket Embedded Python Demo ***

Collecting websocket-client
  Using cached https://files.pythonhosted.org/packages/4c/5f/f61b420143ed1c8dc69f9eaec5ff1ac36109d52c80de49d66e0c36c3dfdf/websocket_client-0.57.0-py2.py3-none-any.whl
Collecting six (from websocket-client)
  Using cached https://files.pythonhosted.org/packages/ee/ff/48bde5c0f013094d729fe4b0316ba2a24774b3ff1c52d924a8a4cb04078a/six-1.15.0-py2.py3-none-any.whl
Installing collected packages: six, websocket-client
Successfully installed six-1.15.0 websocket-client-0.57.0

%%%%%%

Known Hosts (*=Exit) [1]:
1  ws://echo.websocket.org/
2  --- server 2 ----
3  --- server 3 ----
select (1): 1 ==> ws://echo.websocket.org/
Python Connection Object:#
Enter text to get echoed from WebSocketClient Service
Terminate with * at first position
or get generated text by %
or append new text with @

1    hi this is python
2    from IRIS
3    *

Select action for WebSocket Service
Send+Listen(S),New Text(N),Exit(X) [S]S
%%%%%%%%%%%%%%%%%%%%%%%%%%

******* Submit 2 Lines *******
1       send> hi this is python
        recv< hi this is python
2       send> from IRIS
        recv< from IRIS


Select action for WebSocket Service
Send+Listen(S),New Text(N),Exit(X) [S]n
%%%%%%%%%%%%%%%%%%%%%%%%%%
Enter text to get echoed from WebSocketClient Service
Terminate with * at first position
or get generated text by %
or append new text with @

1    with some more text
2    %
2    * Lorem ipsum dolor sit amet, consectetuer adipiscing
3    * elit, sed diam nonummy nibh euismod tincidunt ut
. . . .
32   * un simplificat Angles, quam
33   * un skeptic Cambridge amico dit me que Occidental es.
34   *

Select action for WebSocket Service
Send+Listen(S),New Text(N),Exit(X) [S]s
%%%%%%%%%%%%%%%%%%%%%%%%%%

******* Submit 33 Lines *******
1       send> with some more text
        recv< with some more text
2       send> Lorem ipsum dolor sit amet, consectetuer adipiscing
        recv< Lorem ipsum dolor sit amet, consectetuer adipiscing
3       send> elit, sed diam nonummy nibh euismod tincidunt ut
        recv< elit, sed diam nonummy nibh euismod tincidunt ut
. . . .
32      send> un simplificat Angles, quam
        recv< un simplificat Angles, quam
33      send> un skeptic Cambridge amico dit me que Occidental es.
        recv< un skeptic Cambridge amico dit me que Occidental es.


Select action for WebSocket Service
Send+Listen(S),New Text(N),Exit(X) [S]x
%%%%%%%%%%%%%%%%%%%%%%%%%%

$
```
## Hints  
__%SYS.Python.html__ is a preliminary class docu to see available functions

__docker image__:  if you don't have the required image already you need to download it from containers.intersystems.com 
~~~
docker login -u="<username>" -p="<passwd>" containers.intersystems.com
docker pull containers.intersystems.com/intersystems/iris-ml:2020.3.0.304.0
~~~
__run time__: 
If the standard Python module is not yet installed this is the first action and happens only once.  
 
__iris.key:__ The container has no license included. 
You may use it as single user or provide your own container license key.  
