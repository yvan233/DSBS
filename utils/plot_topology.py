import sys
import time
import matplotlib
import networkx as nx
import json
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from PyQt5.QtWidgets import QWidget, QPushButton, QApplication, QVBoxLayout
from PyQt5.QtCore import QTimer
from PyQt5.QtGui import QIcon
import matplotlib.pyplot as plt
from pylab import mpl

matplotlib.use('Qt5Agg')
mpl.rcParams['font.sans-serif'] = ['SimHei']
mpl.rcParams['axes.unicode_minus'] = False

class App(QWidget):
    
    
    all_nodes=['room_1','room_2','room_3','room_4','room_5','room_6','room_7','pump','heatpump']
    all_nodeslabel=['R1','R2','R3','R4','R5','R6','R7','P','HP']
    all_coordinates = [[1, 3], [3, 3], [5, 3], [1, 1], [3, 1], [5, 1], [7, 1], [6.25, 3], [7.75, 3]]  #节点标签，需要自定义
    all_npos = dict(zip(all_nodes, all_coordinates))  # 节点与坐标之间的映射关系
    all_nlabels = dict(zip(all_nodes, all_nodeslabel))  # 节点与标签之间的映射关系
    all_edges=[
        ['room_1','room_2'],
        ['room_1','room_4'],
        ['room_2','room_3'],
        ['room_2','room_5'],
        ['room_3','room_6'],
        ['room_3','pump'],
        ['room_4','room_5'],
        ['room_5','room_6'],
        ['room_6','room_7'],
        ['room_7','pump'],
        ['room_7','heatpump'],
        ['pump','heatpump']
    ]
    iter_edges = 0

    def __init__(self, parent=None):
        # 父类初始化方法
        super(App, self).__init__(parent)
        self.initUI()

    def initUI(self):
        self.setWindowTitle('Topology display')
        self.setFixedSize(1600, 600)
        # self.setMinimumSize(1600, 700)
        # self.setMaximumSize(1600, 700)
        # QWidgets
  
        self.startBtn = QPushButton('start')
        # self.endBtn = QPushButton('end')
        self.startBtn.clicked.connect(self.startTimer)
        # self.endBtn.clicked.connect(self.endTimer)
        # 时间模块
        self.timer = QTimer(self)
        self.timer.timeout.connect(self.showTime)
        #图像模块
        self.figure = plt.figure("node")
        self.canvas = FigureCanvas(self.figure)

        #垂直布局
        layout=QVBoxLayout()
        layout.addWidget(self.startBtn)
        # layout.addWidget(self.endBtn)
        layout.addWidget(self.canvas)
        self.setLayout(layout)

    def showTime(self):
        # figure1
        filename = "utils/tree.json"
        with open(filename) as f:
            edges = json.load(f)
        nodes = []
        for ele in edges:
            if ele[0] not in nodes:
                nodes.append(ele[0])
            if ele[1] not in nodes:
                nodes.append(ele[1])
        self.figure.clear()
        self.ax = self.figure.add_subplot(111)
        self.ax.set_title("Communication topology")
        G=nx.Graph()
        node_color = []
        edge_color = []
        for ele in self.all_nodes:
            if ele in nodes:
                if ele == nodes[0]:
                    node_color.append("#FFCC00")
                else:
                    node_color.append("#6CB6FF")
            else:
                node_color.append("#AAAAAA")
        
        for ele in self.all_edges:
            if ele in edges:
                edge_color.append("#6CB6FF")
            else:
                ele.reverse()
                if ele in edges:
                    edge_color.append("#6CB6FF")
                else:
                    edge_color.append("#AAAAAA")

        G.add_nodes_from(self.all_nodes)
        nx.draw_networkx_nodes(G, self.all_npos, node_size=400, node_color=node_color)  # 绘制节点
        nx.draw_networkx_edges(G, self.all_npos, self.all_edges,  width = 3, edge_color=edge_color)  # 绘制边
        nx.draw_networkx_labels(G, self.all_npos, self.all_nlabels)  # 标签

        self.canvas.draw()
    # 启动函数
    def startTimer(self):
        # 设置计时间隔并启动
        self.timer.start(500)#每隔一秒执行一次绘图函数 showTime
        self.startBtn.setEnabled(False)#开始按钮变为禁用
        # self.endBtn.setEnabled(True)#结束按钮变为可用

    def endTimer(self):
        self.timer.stop()#计时停止
        self.startBtn.setEnabled(True)#开始按钮变为可用
        self.endBtn.setEnabled(False)#结束按钮变为可用

# 运行程序
if __name__ == '__main__':
    # QApplication.setAttribute(Qt.AA_EnableHighDpiScaling)
    app = QApplication(sys.argv)
    main_window = App()
    main_window.show()
    app.exec()