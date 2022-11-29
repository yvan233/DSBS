import random
import time
import copy
from DASP.module import Task

def computeSum(task, J):
    nbrDirection = task.nbrDirection
    parentDirection = task.parentDirection
    childDirection = task.childDirection
    End_Counter = len(childDirection)
    data_base = [0,None,J]  # 邻居方向,compute/velue, J
    
    data = []

    if len(childDirection):
        for i in range(len(childDirection)):
            data_base_temp = [childDirection[i],None,J]  
            data.append(data_base_temp)

    if parentDirection != -1:
        data_base_temp = [parentDirection,None,J]  
        data.append(data_base_temp)
    else:
        for i in range(len(data)):
            data[i][1] = "compute"  
    for m in range(20):
        time.sleep(0.1)
        for i in range(len(data)):
            if data[i][0] != 0:
                task.sendDataToDirection(data[i][0],data[i][1:3])
        task.syncNode()
        nbrData_fb = copy.deepcopy(task.nbrData)
        nbrDirection_fb = nbrDirection

        for i in range(len(data)):
            data[i][1] = None

        for i in range(len(nbrData_fb)):
            if nbrData_fb[i]:
                if nbrData_fb[i][0] == "compute":
                    if len(childDirection):
                        for k in range(len(data)):
                            if data[k][0] != nbrDirection_fb[i]:
                                data[k][1] = "compute"
                    else:
                        for k in range(len(data)):
                            if data[k][0] == nbrDirection_fb[i]:
                                data[k][1] = "value"             

                elif  nbrData_fb[i][0] == "value":
                    J = J + nbrData_fb[i][1]
                    for k in range(len(data)):
                        data[k][2] = J       
                        
                    End_Counter = End_Counter - 1
                    if End_Counter == 0:
                        for k in range(len(data)):
                            if data[k][0] == parentDirection:
                                data[k][1] = "value"
    if parentDirection == -1:
        task.sendDatatoGUI(J)
    return J

def taskFunction(self:Task, id, nbrDirection, datalist):
    while True:
        J = []
        if self.parentID != id:
            J = [[self.parentID, id]]
        value = computeSum(self, J)
        time.sleep(2)
    return value

