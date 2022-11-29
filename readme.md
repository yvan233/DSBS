# DASP使用说明手册（简易版）
清华大学 严虎 2021/10/27
## 1. 运行环境
`MySql`,`Python3`,`requests`,`pymysql`,`paramiko`

`pip install requests pymysql`

## 2. 仿真运行
DASP(Distributed Algorithm Simulation Platform)继承了DSP2.0的所有功能，能够模拟分布式环境、验证DAPP(分布式算法)可行性，另外包含了调试机制，支持多个算法并行运行。

### 2.1 仿真运行流程
1. 解压DASP.zip
2. 配置好相应的软件环境
3. 根据实际拓扑修改基本拓扑文件 `Dapp/Base/topology.json`
4. 若有新的DAPP，在`Dapp`下创建新文件夹，文件夹名即DAPP名称，文件夹下导入`question.py`算法文件和`topology.json`拓扑文件，若不导入拓扑文件，则该DAPP采用默认的基本拓扑文件。
5. 在DASP文件夹目录下（勿进入DASP/DASP文件夹），运行脚本

   `python ./script_PC/demo.py`

6. 第5步执行后可在运行监控脚本的终端看到运行结果。demo下DASP启动了一个包含了9个节点的分布式网络，执行了系统任务（维护拓扑网络），并在2秒后运行了ALST示例DAPP。

### 2.2 文件说明
#### 2.2.1 控制脚本
DASP的控制脚本模板`demo.py`如下
```python
# 启动系统并运行分布式算法
import time 
import sys
sys.path.insert(1,".") # 把上一级目录加入搜索路径
from DASP.module import Node,Moniter
from DASP.control import ControlMixin

nodeNum = 9  # 节点数量
startNode = "room_1" # 起始节点ID
nodelist = [] # 节点进程列表
controlMixin = ControlMixin("Pc") # 控制函数集合

# 启动监控脚本
moniter = Moniter()
moniter.run()

# 启动节点进程
for i in range(nodeNum):
    node = Node(i)
    nodelist.append(node)

time.sleep(2)
DappName = "ALST"
print("start task: "+DappName)
controlMixin.startTask(DappName,startNode)

moniter.wait()
```
nodeNum为节点数量，startNode为任务发起节点

节点进程由类Node启动，Node初始化时输入`mode=True`可打印节点进程输出信息

ControlMixin为控制函数集合类，仿真时初始化参数"Pc"，实际运行时初始化参数"PI"，控制函数类包含运行DAPP、暂停DAPP、恢复DAPP、停止DAPP等功能，具体可参考`DASP/control/ControlMixin.py`源码。

网络的基本拓扑由`Dapp/Base/topology.json`定义。每一个DAPP为`Dapp`下的一个子文件夹，包含了`question.py`算法文件和`topology.json`拓扑文件，各任务的拓扑文件为基本拓扑的子图。

##### 其他控制脚本
在script_PC文件夹下包含了一些其他示例脚本

`demo.py`：基本模板，启动系统并运行分布式算法

`demo2.py`：并行执行DAPP示例

`demo3.py`：DAPP的暂停、恢复、终止示例

`demo4.py`：DASP逐节点启动示例

`demo5.py`：故障重连示例，模拟节点故障，并在节点重启后重连进系统

#### 2.2.2 监控类
`DASP/module/Moniter.py`为监控脚本，监听本地50000端口，节点进程的信息将发送到监控脚本显示。

#### 2.2.3 任务文件

`Dapp`为DAPP存储文件夹，每个DAPP为一个子文件夹，包含了`question.py`算法文件和`topology.json`拓扑文件。

其中`Base`子文件夹下的`topology.json`为基础拓扑，其他子文件夹下的拓扑为任务拓扑，

`Base`子文件夹下的`autostart.csv`为自启动DAPP配置文件，第一列`DAPP`为需要随系统启动的DAPP名称；time为DAPP启动的延时时间，支持浮点数输入。

#### 2.2.4 DASP源码
`module`为DASP基本实现模块

`pysnooperdb`为调试功能实现模块

`system`为节点进程启动模块

`control`为控制函数模块


## 3. 实际运行
经过仿真测试过的算法可部署在实际的树莓派系统上。

树莓派上部署了开机自启动的DASP服务，会根据自己的IP识别成对应节点，启动进程，等待上位机或邻居的消息。

### 3.1 运行准备工作


* 下载[树莓派镜像](https://cloud.tsinghua.edu.cn/d/df5ef1d584d74cb8a1b4/)并烧录系统后，启动树莓派。
* 将树莓派连接到wifi中，记录IP，并在路由器端设置静态路由，绑定树莓派的IP地址和MAC地址。
* 用putty/ssh/win10远程桌面等方式通过IP地址远程连接到树莓派，测试是否正常
* 依次对所有的树莓派执行以上操作，直到所有的树莓派都连接到局域网中，并记录IP，按照模板修改`Dapp/Base/binding.csv`文件，不在线的树莓派IP一栏为offline，同时需要更新本机(server)的IP地址

### 3.2 实际运行流程

1. 根据实际拓扑修改基本拓扑文件 `Dapp/Base/topology.json`

2. 若有新的DAPP，在`Dapp`下创建新文件夹，文件夹名即DAPP名称，文件夹下导入`question.py`算法文件和`topology.json`拓扑文件

3. 若有需要随系统启动的DAPP，更新`Dapp/Base/autostart.csv`文件，输入DAPP名称、启动节点、延时时间。

4. 和树莓派连接到同一个局域网，运行同步脚本将所有更新的文件同步到局域网内的树莓派
   
   `python ./script_PI/broadcast_file.py`

5. 重启所有树莓派，运行批量重启脚本
   
   `python ./script_PI/broadcast_command.py`

6. 在另一个终端下，运行监控脚本

   `python ./script_PC/moniter.py`

7. 运行系统启动脚本
   
   `python ./script_PI/startsystem.py`

8. 等待监控终端出现 *[node_x]system: 通信树建立完成* 提示消息后，运行DAPP启动脚本
   
   `python ./script_PI/runtask.py`

9. 第8步执行后可在运行监控脚本的终端看到运行结果。


### 3.3 文件说明
#### 3.3.1 控制脚本
与[2.2.1](#221-控制脚本)类似，区别在于ControlMixin初始化参数需设置为"PI"。

#### 3.3.2 其他文件
`broadcast_command.py`可向局域网内的所有树莓派广播执行command指令，默认为重启，修改后可执行其他指令。

`broadcast_file.py`可将DASP文件夹下的所有文件同步到局域网内的树莓派，一般用于更新拓扑和算法程序

`MysqlBackup2Server.py`用于备份树莓派下的数据库文件

## 其他参考资料

- [分布式算法培训教程](https://cloud.tsinghua.edu.cn/d/5535865a799a408d9f27/)