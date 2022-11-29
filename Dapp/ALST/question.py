from DASP.module import Task

def taskFunction(self:Task,id,nbrDirection:list,datalist):
    def reset():
        flag = False
        parent = -1
        child = []    
        edgesFlag = [False] * len(nbrDirection)
        edges = dict(zip(nbrDirection,edgesFlag))
        return flag,parent,child,edges

    flag,parent,child,edges = reset()
    min_uid = id
    flag = True
    step = 1
    leader_state = "non-leader"
    for ele in nbrDirection:
        self.sendAsynchData(ele,["search",id])
    j,(data,token) = self.getAsynchData()
    while True:
        if step == 1:
            while True:
                if token <= min_uid:
                    if token < min_uid:
                        min_uid = token
                        flag,parent,child,edges = reset()
                    edges[j] = True
                    if data == "end" and j == parent:
                        for ele in child:
                            self.sendAsynchData(ele,["end",min_uid]) 
                        break
                    elif data == "join":
                        if j not in child:
                            child.append(j)
                    elif data == "search":
                        if flag == False:
                            flag = True
                            parent = j 
                            for ele in nbrDirection:
                                if ele != j:
                                    self.sendAsynchData(ele,["search",min_uid])
                    if all(edges.values()):
                        if min_uid == id:
                            leader_state = "leader"
                            for ele in child:
                                self.sendAsynchData(ele,["end",min_uid]) 
                            break
                        else:
                            leader_state = "non-leader"  
                            self.sendAsynchData(parent,["join",min_uid]) 
                j,(data,token) = self.getAsynchData()
            step = 2
            self.sendDatatoGUI({"state":leader_state,"parent":parent,"child":child}) 
        if step == 2:
            break

    value = {"state":leader_state,"parent":parent,"child":child}

    return value