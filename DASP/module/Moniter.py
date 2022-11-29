import json
import socket
import threading
import time

class Moniter:
    def __init__(self, port = 50000):
        self.port = port

    def run(self):
        t = threading.Thread(target=self.moniter,)    
        t.setDaemon(True)
        t.start()

    def moniter(self):
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        localIP = socket.gethostbyname(socket.gethostname())
        s.bind((localIP, self.port))
        print ("moniter: {}:{}".format(localIP,self.port))
        while 1:
            try:
                data, addr = s.recvfrom(100000000)
                jdata = json.loads(data)
            except Exception:
                print ("Moniter error!")
            else:
                if jdata["key"] == "RunData":
                    if jdata['DappName'] == "FindTopology" and isinstance(jdata['info'],list):
                        filename = "utils/tree.json"
                        with open(filename, 'w') as f:
                            json.dump(jdata['info'], f)
                        # print(f"{jdata['time']} {jdata['id']:>10} {jdata['DappName']:>12}: {jdata['info']}")
                    else:
                        print(f"{jdata['time']} {jdata['id']:>10} {jdata['DappName']:>12}: {jdata['info']}")
                elif jdata["key"] == "EndData":
                    print(f"{jdata['time']} {jdata['id']:>10} {jdata['DappName']:>12}: Task finished. The result:\n{jdata['info']}")
                elif jdata["key"] == "RunFlag":
                    # print(str(jdata["tasknum"]) +str(jdata["info"]))
                    pass
                else:
                    print ("Data error!")

    def wait(self):
        while True:
            time.sleep(1)

if __name__ == '__main__':
    moniter = Moniter()
    moniter.run()
    moniter.wait()
