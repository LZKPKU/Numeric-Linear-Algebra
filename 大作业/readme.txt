代码文件介绍：

bash.m 为得出第一、二、三问结果的测试脚本，直接运行即可得到实验结果。
calc_err.m 为计算l2范数下的误差的函数
Data_A.m 为构建系数矩阵A的函数
Data_f.m 为构建常数向量f的函数
Data_gt.m 为构建真实精确解的函数
Gauss.m 为高斯消去法函数
lgs.m 为线GS迭代算法函数
lift.m 为提升算子函数
pcg.m 为预条件共轭梯度法函数
pgs.m 为点GS迭代算法函数
restrict.m 为限制算子函数
show.m 为结果展示函数
V.m 为多重网格v-cycle调用函数

Matlab命令行结果展示.txt 
是运行bash的过程中（手动），得到的Matlab命令行输入，记载了报告中所提到的结果


数值代数期末作业报告.html即为报告，由于pdf生成软件的一些问题，不能生成美观的pdf，故用html代替。
数值代数期末作业报告.md 为生成html的markdown 代码文件，其中的latex源码可以直接查看。

resource文件夹中存放的是报告中用到的图片

第二三问图文件夹中存放的是第二三问中的结果图片

代码层次结构如下：

Data_A、Data_f、Data_gt在多处用到

                           bash   ——  calc_err ——  show

                            |
                 Gauss               pcg
				      |
                                      V —— restrict —— lift
                                      |
                                 lgs      pgs
