## 1、创建编译库：
Tools=>compile simulation
![|375](attachments/c6cc6f80f004b209b71a34034d984a8d_MD5.png)
debug: HDMI 的ip核报错，缺少timescale，去vivado目录补充一下
## 2.vivado中设置
三步：
1. com中加入-sverilog
2. ela中加入-fsdb
3. sim中修改时间
netlist是修改工艺库快慢。
![](attachments/dcba4230345433b2ca0c310ca17b479d_MD5.png)

然后就可以SIMULATION出dve波形了。