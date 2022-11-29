def taskFunction(self,id,nbrDirection,datalist):
    # init 
    # 生成树节点标识
    Flag = False  
    # 用于判断计算是否结束的END计数器
    End_Counter = 0
    # 父节点方向
    parentdirection = []
    # 子节点方向
    childdirection = []
    # END计数器初始化为邻居数量
    End_Counter = len(nbrDirection)
    # 与邻居通信的数据格式，分别为BFS信号、END信号
    data_base = [False,0] 
    # 本地给不同邻居的数据数组
    data = []

    # 初始化data
    for i in range(len(nbrDirection)):
        data_base_temp = [False,0]
        data.append(data_base_temp)

    # id为room_1的为发起节点
    if id == "room_1":
        Flag = True
        parentdirection.append(0)  # 假定一个0方向，父节点方向为0的即为根节点/发起节点
        for i in range(len(data)):
            data[i][0] = True      # 给每个邻居发送BFS信号  

    # 循环次数为网络规模的2倍
    for m in range(20):
        nbrData = self.transmitData(nbrDirection,data)       # 同步通信函数
        nbrData_fb = nbrData[1]                              # 获取邻居传输的数据
        nbrDirection_fb = nbrData[0]                         # 获取邻居的方向数组

        # 清空BFS、END信号
        for i in range(len(data)):
            data[i][0] = False
            data[i][1] = 0

        # 如果END计数器不为0
        if  End_Counter != 0:
            for i in range(len(nbrData_fb)):
                # 如果邻居传来BFS信号
                if nbrData_fb[i][0] == True:    
                    # 如果本节点没有加入宽度优先生成树中             
                    if Flag == False:
                        Flag = True
                        parentdirection.append(nbrDirection_fb[i])  #将邻居方向加入父节点方向
                        # 向其他邻居广播BFS信号
                        for j in range(len(data)):
                            if nbrDirection[j] != nbrDirection_fb[i]:
                                data[j][0] = True
                    else:
                        # 向该邻居发送END信号 END = 1
                        for j in range(len(data)):
                            if nbrDirection[j] == nbrDirection_fb[i]:
                                data[j][0] = False                     
                                data[j][1] = 1
                    End_Counter = End_Counter - 1     

                # 如果邻居传来END信号
                if  nbrData_fb[i][1] > 0:
                    End_Counter = End_Counter - 1
                    # END = 2 说明是该节点的子节点，将邻居方向加入子节点方向数组
                    if nbrData_fb[i][1] == 2: 
                        childdirection.append(nbrDirection_fb[i])

            # 如果本轮END计数器减为0
            if End_Counter == 0:
                for i in range(len(data)):
                    data[i][0] = False
                    # 给父节点方向的邻居发送END = 2
                    if nbrDirection[i] == parentdirection[0]:
                        data[i][1] = 2
        self.sendDatatoGUI("第" + str(m+1) + "步完成")

    # 返回父节点方向、子节点方向
    value = {"parentdirection":parentdirection,"childdirection":childdirection}
    return value