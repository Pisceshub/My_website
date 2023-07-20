# python环境设置

### **汇总anaconda命令：**

anaconda环境激活卸载安装创建  

- 创建虚拟环境：`conda create -n env_name python=3.9`  

- 激活虚拟环境：`conda activate env_name`  

- 退出当前环境：`conda deactivate env_name`  

- 删除环境：`conda remove -n your_env_name --all`  

- 查看安装的包：`conda list`：查看安装了哪些包。  

- 安装包：`conda install package_name`(包名)  

- 查看当前存在哪些虚拟环境：`conda env list` 或 `conda info -e`  

- 检查更新当前`conda：conda update conda`


### **镜像源网址：-i**

- 清华：`https://pypi.tuna.tsinghua.edu.cn/simple`

- 阿里云：`http://mirrors.aliyun.com/pypi/simple/`

- 中国科技大学 `https://pypi.mirrors.ustc.edu.cn/simple/`

- 华中理工大学：`http://pypi.hustunique.com/`

- 山东理工大学：`http://pypi.sdutlinux.org/`

- 豆瓣：`http://pypi.douban.com/simple/`


### whl的离线库安装：    

- pytorch的安装：  

    torch-1.11.0+cu113-cp39-cp39-win_amd64.whl + torchaudio-0.11.0+cu113-cp39-cp39-win_amd64.whl torchvision  

    https://mirror.sjtu.edu.cn/pytorch-wheels/cu113/?mirror_intel_list  

 - 查看模型的库torchsummary\prettytable


### 安装指定版本：

`pip install pytorch==0.1.10`

`conda install pytorch=0.1.10 -c soumith`  



### 当前文件夹下创建虚拟环境  

`python -m venv env_name`  

激活该环境：  

`env_name\Script\activate`  

升级该环境pip：  

`pip install --upgrade pip`


### 指定某虚拟环境安装卸载库

示例：安装python的串口的库  

- `pip install pyserial`

- `F:\Program\Programming\Python\Anaconda3\Scripts\pip3 install pyserial -i https://pypi.tuna.tsinghua.edu.cn/simple/`

- `F:\Program\Programming\Python\Python3.9.12\Scripts\pip3 install pyserial -i https://pypi.tuna.tsinghua.edu.cn/simple/`

卸载python的串口的库  

- `D:\Anaconda3_2022.10\Scripts\pip3 uninstall serial`

重装库文件

`pip install --force-reinstall -t D:\Anaconda3_2022.10\Lib\site-packages tokenizers==0.13 -i https://pypi.tuna.tsinghua.edu.cn/simple/`

### [永久设置自己的pip源为清华源](https://mirrors.tuna.tsinghua.edu.cn/help/pypi/)：

```
python -m pip install --upgrade pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```
临时使用升级pip
```
python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
```

配置多个镜像源
```
pip config set global.extra-index-url "<url1> <url2>..."
```