<!-- ABOUT DSBS -->

## About distributed smart building simulator (DSBS)

**DSBS** use semi-physical simulation to construct a Honeycomb prototype that has been deployed in a multi-zone office. It helps to closely approximate real building scenarios and facilitates the rapid deployment of Honeycomb in actual buildings.

<img src="./docs/figure/fig_1.jpg" alt="overview" style="zoom:50%;" />

DSBS is comprised of four primary components, namely distributed application operating environment (DAOE), distributed algorithm simulation platform (DASP), semi-physical building simulator (SPBS), and occupancy measurement system (OMS). 

<img src="./docs/figure/fig_2.jpg" alt="overview" style="zoom:80%;" />

DAOE is deployed in smart nodes (Raspberry Pi) and serves as a runtime environment for distributed applications (DAPP). An upper computer can interact with one of any nodes within the DAOE to send commands and acquire data. DASP, a simulation platform that tests and validates distributed applications, simulates smart nodes on the upper computer. SPBS is a semi-physical simulator of the Honeycomb prototype that approximates the actual system model. It is used to simulate the experimental environment, execute control commands (given by the control algorithm on DAOE), and provide environmental responses. OMS uses Jeston Nano as the edge device to capture videos from a camera or a file, counts the number of occupants, and then gives this information to the control algorithm on the DAOE. 


<img src="./docs/figure/fig_3.png" alt="overview" style="zoom:80%;" />

Temperature and occupancy results in a room.

<img src="./docs/figure/fig_4.jpg" alt="overview" style="zoom:80%;" />

**Reference:**

Xing, T., Yan, H., Sun, K., Wang, Y., Wang, X., and Zhao, Q. (2022). Honeycomb: An open-source distributed system for smart buildings. Patterns 3, 100605. [(Link)](https://doi.org/10.1016/j.patter.2022.100605)

Wang, Y., Zhao, Q., Yan, H., and Yang, W. (2022). DSP, a Plug-and-Play Process-Based Distributed Algorithm Simulation Platform. Scientific Programming 2022, e3886729. [(Link)](https://doi.org/10.1155/2022/3886729)

<!-- AUTHOR -->

## Author

Yan Hu yanh20@mails.tsinghua.edu.cn