# 基于mkdocs搭建个人网站

## 1. 关于环境

基于python3.9创建虚拟环境，python环境配置指令参考[python环境设置](../003_Python/python环境设置.md)  

如果安装有anaconda，则用anaconda创建环境

```cmd
# 创建虚拟环境
conda create -n mkdocs_env python=3.9
# 激活虚拟环境：
conda activate mkdocs_env
# 检查pip list是不是空的
pip list
```

## 2. 关于mkdocs

用mkdocs在github上部署使用非常方便：可以将markdown全部转为HTML，可以部署到服务器或者github。

## 3. 安装mkdocs

```
pip install Mkdocs
```

安装 & 配置主题

```
pip install mkdocs-material
```

```
theme:
	name:material
```

--- 

文末我会附上我自己网页的**mkdocs.yml**文件

mkdocs.yml需要修改的地方：
```
site_name: # 网页名字
theme:
	favicon: assets/images/favicon.png # 网页的标签图
	logo: assets/images/logo.png   # 主页的个人log
	name:material # 想使用的主题
```

---


## 4. 创建项目

```
mkdocs new my_website
cd my_website
```

创建后文件夹是这样的：

![figure 1](images/image.png)

预览项目：先进入my_website文件夹，再运行`mkdocs serve`

```
cd my_website
mkdocs serve
```
本地链接  

![figure 2](images/image1.png)
## 5. 页面布局

[导航栏支持多级布局：](https://mkdocs-like-code.readthedocs.io/zh_CN/latest/MkDocs-advanced-operations/theme-configuration/)


## 6. github上传：


创建新的仓库 

![figure 4](images/image2.png)
将本地推送到仓库：


![figure 5](images/image3.png)
git以及上传github命令：
```
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin yourgithub.git
git push -u origin main
```

## 7. 部署到github

- 完成github仓库创建
- 本地做完后git之后push到github远程仓库
```
git push origin main
```
- 进入my_website文件夹，进行部署：
```
mkdocs gh-deploy
```
部署后需要等待>30s左右才会完成渲染，稍安勿躁。
```
https://yourhub.github.io/yourrepositories/
```
## 8. 后续上传：

在相应的文件夹下：

```
git add .
git commit -m "update"
git push -u origin main
mkdocs gh-deploy
```

非常感谢[8047-](https://www.bilibili.com/video/BV1FB4y1n7Gf/?spm_id_from=333.880.my_history.page.click&vd_source=f6b887c95aa7969fce3d0ed6ca6f2232)up主的视频帮助，让我快速掌握个人网站搭建。也非常感谢[MkDocs](https://www.mkdocs.org/) 作者的贡献，感谢[github pages](https://pages.github.com/)平台

这里是我的个人博客网站[Pisceshub](https://Pisceshub.github.io/My_website/)


## 9. 附件：

**mkdocs.yml**文件内容：

```mkdocs.yml
site_name: Pisceshub
theme:
  favicon: assets/images/favicon.png
  logo: assets/images/logo.png
  name: material
  language: en
  features:
    - navigation.path
    - navigation.instant
    - navigation.tracking
    - navigation.prune
    # - toc.integrate
    - navigation.top
    - search.share
    - header.autohide
    - announce.dismiss
    - navigation.footer

  palette:
    # Palette toggle for light mode
    - media: "(prefers-color-scheme: light)"
      scheme: default
      ## 设置颜色
      # red， pink， purple， deep purple， indigo， blue， 
      # light blue，cyan，teal，green，light green，lime，
      # yellow，amber，orange，deep orange
      primary: black  
      accent: indigo
      toggle:
        icon: material/weather-sunny
        name: Switch to dark mode

    # Palette toggle for dark mode
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: black
      accent: blue grey
      toggle:
        icon: material/weather-night
        name: Switch to light mode
  font:
    text: Roboto
    code: Roboto Mono
extra_css:
  - stylesheets/extra.css

# extra:
#   homepage: https://example.com


extra:
  version:
    provider: mike
  consent:
    title: Cookie consent
    description: >- 
      We use cookies to recognize your repeated visits and preferences, as well
      as to measure the effectiveness of our documentation and whether users
      find what they're searching for. With your consent, you're helping us to
      make our documentation better.


copyright: >
  Copyright &copy; 2016 - 2023 Martin Donath –
  <a href="#__consent">Change cookie settings</a>

extra_javascript:
  - javascripts/consent.js
  - '//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js'
  - javascripts/config.js
  - https://polyfill.io/v3/polyfill.min.js?features=es6
  - https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js

plugins:
  - search
  - tags

markdown_extensions:
  - pymdownx.arithmatex:
      generic: true

```


- 加入本站运行时间方法：

示例： 

![attachments/b838c33025abb2368b6126720b07c52f_MD5.png](attachments/b838c33025abb2368b6126720b07c52f_MD5.png)

代码：

```
<hr>  

<span id="runtime_span"></span>  

<script type="text/javascript">
function show_runtime()
{
	window.setTimeout("show_runtime()",1000);
	X=new Date("6/30/2023 17:20:00");
	Y=new Date();
	T=(Y.getTime()-X.getTime());
	M=24*60*60*1000;
	a=T/M;A=Math.floor(a);
	b=(a-A)*24;
	B=Math.floor(b);
	c=(b-B)*60;
	C=Math.floor((b-B)*60);
	D=Math.floor((c-C)*60);
	runtime_span.innerHTML="本站已运行: "+A+"天"+B+"小时"+C+"分"+D+"秒"
}
show_runtime();

</script>
```

- 快速更新网站指令：

可以将该组命令设定为Update_website.cmd文件，以后在obsidian中点击运行即可。

```update_website.cmd
cd F:\My_work_file\Program_file\Obsidian_file\My_World\04_My_website
git add .
git commit -m "update"
git push -u origin main
mkdocs gh-deploy
```

- 本地快速预览网站指令：
可以将该组命令设定为Preview_website.cmd文件，以后在obsidian中点击运行即可。

```
cd F:\My_work_file\Program_file\Obsidian_file\My_World\04_My_website
mkdocs serve
```

注：目前网站的评论功能暂时还没有参考文章调通，后续有时间我会继续补上。