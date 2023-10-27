## 1.文件目录
![](attachments/679a9ec0c30af35d1f1665fd4594d208_MD5.png)


## 2. 创建建立工程脚本：
```bash
cd /home/ICer/Work_file/Vivadoprj/
gvim vivado_K7_prj.tcl
```
输入：
```
################# 一、 创建和打开项目 ######################
# 1. create_project：创建一个新的Vivado项目。
set device xc7k325t 

set package fbg676

set speed -2

set part $device$package$speed

set prjName my_project

set Prj_path /home/ICer/Work_file/Vivadoprj/K7prj/

set prjDir $Prj_path/$prjName

set srcDirc $Prj_path/Sources

create_project $prjName $prjDir -part $part

################# 二、 添加文件  #############################
# 1. 文件路径
set rtl_path /home/ICer/Work_file/VCSVerdi/rtl/
set tb_path /home/ICer/Work_file/VCSVerdi/tb/
set xdc_path /home/ICer/Work_file/VCSVerdi/xdc/
# 2. add_files: 将一个或多个文件添加到Vivado项目中。
# rtl
add_files $rtl_path/counter.v -fileset sources_1 
# tb
add_files $tb_path/counter_tb.v -fileset sim_1
# VCS要加入的
add_files $tb_path/fsdb.v -fileset sim_1
# xdc
add_files $xdc_path/led_stream.xdc -fileset constrs_1
# utils
# add_files file -fileset utils_1
# 添加当前目录所有文件用这个：
# add_files -fileset sim_1 [glob $v_path/*.v]

# 3. 更新编译顺序
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

################# 三、综合  #############################
# 指定综合和实现策略
set_property strategy Flow_AreaOptimized_high [get_runs synth_1]
set_property strategy Performance_Explore [get_runs impl_1]


```

## 3. 启动vivado：
```
vivado 
```
常用命令：
```
################# 一、 创建和打开项目 ######################
# 1. create_project：创建一个新的Vivado项目。
create_project my_project /home/ICer/Work_file/Vivadoprj/K7prj/my_project1

# 2. open_project：打开一个已经存在的Vivado项目。
open_project /home/ICer/Work_file/Vivadoprj/K7prj/my_project1

# 3. close_project：关闭当前的Vivado项目。同时也可以指定是否保存更改。
close_project -save true

# 4. delete_project：删除一个Vivado项目。
delete_project my_project

# 5. save_project：保存当前的Vivado项目。
save_project

################# 二、 添加文件  #############################
# 1. add_files: 将一个或多个文件添加到Vivado项目中。
add_files /home/user/my_project/src/test.v

# 2. add_sources：添加源文件到Vivado项目中。
add_sources /home/user/my_project/src/test.v

# 3. add_files_recursive：递归地将一个目录下的文件添加到Vivado项目中。
add_files_recursive /home/user/my_project/src/

# 4、添加IP核
# 在Vivado中添加IP核可以使用以下命令： 添加AXI GPIO IP核  其中vlnv为IP核的唯一标识符  
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0

################# 三、综合  #############################
# 1. synth_design：对设计进行综合。
synth_design -top test_module

# 2. report_utilization：生成资源使用情况的报告。
report_utilization

# 3. report_timing_summary：生成时序约束分析报告。
report_timing_summary

# 4. report_clock_interaction：生成时钟关系分析报告。
report_clock_interaction

# 5. report_power：生成功耗分析报告。
report_power


################# 四、实现  #############################
# 1. place_design：对设计进行布局。
place_design

# 2. route_design：连接完成后，对设计进行路由。
route_design

# 3. report_route_status：生成路由状态的报告。
report_route_status

# 4. report_timing_summary：生成时序约束分析报告。
report_timing_summary

# 5. validate_timing：检查时序是否符合约束要求。
validate_timing


################# 五、下载  #############################
# 1. write_bitstream：生成比特流文件。
write_bitstream -force /home/user/my_project/test.bit

# 2. program_hw_devices：下载比特流文件到FPGA。
program_hw_devices -file /home/user/my_project/test.bit

# 3. open_hw_target：打开硬件目标。
open_hw_target

# 4. close_hw_target：关闭硬件目标。
close_hw_target
```

## 3. 运行该脚本：
```
source /home/ICer/Work_file/Vivadoprj/vivado_K7_pro.tcl
```