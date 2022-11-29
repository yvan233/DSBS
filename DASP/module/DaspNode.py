import subprocess
import threading
import time

class Node:
    """节点类
    
    用于多进程开启任务节点
    
    属性:
        num: 节点ID编号 从1开始
        mode: 是否直接打印输出数据
        printdata: 节点输出数据
        proc: 节点进程
        thread: 节点获取输出数据线程
        
        """
        
    def __init__(self, num, mode = False, printdata = []):
        """
        num: 节点ID编号 从0开始
        mode: 是否直接打印输出数据
        printdata: 节点输出数据
        """
        self.num = num
        # -u参数是为了读取缓冲区中的打印信息
        self.proc = subprocess.Popen(['python','-u','./DASP/system/initial.py', str(self.num)],\
            shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        self.printdata = printdata
        print("[node{}]pid:{}".format(num,self.proc.pid))
        self.thread = threading.Thread(target=self.getprintdata,args=(mode,))
        self.thread.setDaemon(True)
        self.thread.start()
        
    def getprintdata(self, mode = False):
        """
        获取输出数据
        """
        while True:
            rcode = self.proc.poll()
            # 若进程未结束
            if rcode is None:
                line = self.proc.stdout.readline().strip().decode('GBK',"ignore")  #cmd窗口默认GBK编码
                self.printdata.append(line)
                if mode:
                    print('[node{}]: {}'.format(self.num,line))
            else:
                break
            time.sleep(0.01)

    def kill(self):
        """
        杀死节点进程
        """
        self.proc.kill()
        self.proc.wait()
        print ("[node{}]: The process has been killed.".format(self.num))

if __name__ == '__main__':
    nodelist = []
    node = Node(1, True, [])
    nodelist.append(node)
    for i in range(11):
        node = Node(i+2, False, [])
        nodelist.append(node)
        
    # time.sleep(10)
    # 杀死重启进程测试，测试结果：通过
    # nodelist[1].kill()
    # node = Node(2, True, [])