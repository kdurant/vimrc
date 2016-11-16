# [![vim](http://img3.douban.com/icon/g11003-1.jpg)](http://www.vim.org/index.php)插件是什么

-------

- 这篇文章假设你已经会vim的基本操作，有了自己的vimrc文件

- 你可以参考,但不能照搬, 因为可能一些插件、按键的map完全不适合你

-------

# 去哪里下载插件
[![github](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALcAAAETCAMAAABDSmfhAAABuVBMVEX///8AAAD/wJ9i4/9Dr/+xQjrPz8/29vbT09P7+/vo6OjMzMxra2tBrP9j5f/39/dPT096enpHR0eenp6urq4+Pj5DQ0NZWVnt7e3b29u7u7saGhopKSlxcXHp6elgYGD/xaOWlpY5OTm4uLiIiIipqalf3f+Ojo7ExMSampr/wqFGtf9UVFQRERFdXV1b1/9Tyv9Owf//zKlp8v8mJib/8Ol75/8xMTGrLCGsNCv/28npzMry/f+T6///5tpm6/+p7//W9/+5k3rGe3YLGyCTAAD/0bpINy0jUVfurI/f+P+s69rJoYYrIRtiTD/y4eA4gYpJqLMnNzNCmKFQuslPa2QxcXtzmpMcQEd8qZ0sZW0RKS4AEAZZz9lEW1aXz7+NwrOg1do9jpfQ7v+//f9afYKR4+puvP+36f+j2v+Azf/j9P/T6P+63f+b3f8SL0UlWWtf3eQCBxYwgLE8nt81f5PPkI3MiobYpaKeeGO1T0i+ZmB+YlHCm4EfFxPktpeJalmBDgC5EBaeW1prODS+//FJZFw2TEXwv8HODRmRenKiRkXZiHLuqKPIalm+GRzRfWjKS0HmUEnt7gtJAAAVOElEQVR4nO2d/WPTRprH5RoiS1ZiSbYUyYn8KmM5kU3jhJhA0iRQSIG89I3Sdo+WK3vX7tJ7YbvbFgoNsLfb3bvSbu8v3pE0MxrZkm0pkRN29f0BZL3NZ0bPPPPMixSKSpQoUaJEiRIlSpQoUaJEiRIlSpQoUaJEiRIlSpQoUaJEiRIlOk5NtapGLuggXVKASiUm1C2dq5SQV4VLQksBiUrA4XzKUTbUTevwKuPofAFiOCcFKQC8EInbiHRVlBRSDf/jxVPKLSDusv/xTCSCKXiVegyE/ppF3KZ/1TwaN3sciL7SEHfHv+6fVm5U81Mt/+OnlZvuDPcnp5WbYsWhNejUcgNTaeoFuKn0nPTmcemfYm5S0L2UcSV9Rbg7Cffxco+I0E6lnZTqTc7kmnXkO7I62MrWi5YMhqLBf7KTHm/ttM8juLMNXcgXXRTVubKegb9Z+Ft1uUsUYxR0oVUvRadWhTl4t3Y5q2YKXC2VAkmWsQdBiFhVgrtYl5yNOQGRo1CRQ8UAf+tEfJKvORsrXFCgPEpFRE0KcMM4VqSpTLvvaIvg7rm7e/B5oaCvCVNAsFV3s0ZcFS02bPpQk9z8CG6PHHC2j1uF1xdcbo+KEbAbvthRuWusL/fccO5UeFNhfe8TmTslROLWwnY3GRytioJG0nm5+9Mh6+VghjF3fVzu0N1NlMJKkaYYFZKm2pKgkNyKoaoi/JUB8vhBcDrPmTjPAnFXFNz4c/NcGXsELSQ36pQ7fUgF1nKncXG5LQW2lyk+C/ZlkIOwAq9xuHnQLlCqCX/Nhey3wU7kHOyKteA9c4Pcge2l7vxkkT8sjsWtO/ehV+BvZFJjCrYtMqSBjrfHhuCegr+r8Hd1LG7URKEHLkTi5iENG4EbtRoIFpwRghvdpROOG7WJkAY2yCIdgZsW8fkhuJWVSNzQvtsOG3pqHTJP43KjAQDQHw3BTdUicaNBJ6eFQJ2xaiRuIRK3HIkbkaaaqsIavOemp5mbiKpqOLCD4edkuKPZCUXNp/rVZifIHbFeAhcyEH2j1I7OXR3NjX6H5sadESQ8bByduwSjFRR1jNHuoK5RCLF45NVK1Y3MfLk7eHB2CDcNe258LpAbRtw0MtOAQfZhQg0GsOxag4jgfeOqHj0GNx7LhYWA+psEd945goq7naFCCw3QC4Z3cMDLzXlQlOHcVXjMDvNo9MsTD2oqgZ0yw89TKdAYB4aLvdwodyt1NVPvNYZzu7E5VxVcj+WJv9ti2e1SRzATBV468KS83AWcxpxDMIyb6u/Y+XCTmo8wioK4B0YDvNxqP8FQ7mo47pDRt4fb7B/68nLT8gjunElwl6Qw3AEzX8OFXZHU1zn1cnsHLHy4achds595MeWj+mBrYSdMU1GEJ3JAVRHqbkevjxt7FEuNwXlXGg2cqX13BeUJK2AT96jmReJo1IE2ncz8CoeKHfaF5tBtFc09yXDLHw02Ib+EKriB0GoNFmZJd3uCChqTrLUiTtUzDSLvtpyRRqaQt9Vwpy8N3TLymtCwqkK2ZR9uoQdE56HQDsaoclK5WacpuuGcCnKbca4Cz0tt6JxWrUezEcAyGBDC0TL/XDIxrmQIIX+/JJ001iixbhTbq6244E4sS9PQRhi8ZW+7RZ7zq1M0TfdteA/n/M8OI1QlhUyOYXK0gUJDaziDKZhiJ69YG5zId6q28dAFjufLWVqw4wulXLOGT2hBcFutjM7zvA4uU3WT5zWr2lYFQdDr4Hq6qU0xstNSZLUmAJ4SeHFWD7vKQJFxRYeZRwMq4Jb1mmiKvQJF65IoSbLcAY6CEWRZkmpVRbaBDVFs2reR8RC2wctSTaplrA1wqijlGYoDu2pSeQrcvmZQoihYD6xe6yhUUZRlXpL5KR+4IYKBcdvNL/KvIIjWJF1R8zRVlUTByORF0aSppiRWM5lqVRElKylB5GdB4SmiiLhVWTQNNVtWWVnkCxmDE2sFwK1nG6YolXIcaNxEXrKi2LpUVjIgDyprdGpcOFuBA9tzA9zWIGxZtkNElhd1666gaOqqKNuBM+tws5JpSnUPd1U2rZuV6KrIW45c0cQyzUmgx6Z25KricPO8YXPTutyxKkimGXJ6LQOrpWudsDXhGConyKKesXihW9TkZkMynYrocNd7QlPSSG6QWadHwHCyMyaTrYmsJlnbeblc4hw7EXkFcHOsCc8OKxY673lkX3XY6Fk9WtUEZink8jJcgJKXBEGCNcHmBuVYyEiiSnCzszWnuS2Z0OQVSc443IZoqja3pOqSxgBuVRJBwmqhXi+E6+8wyH+0O826UayWkR+0Ey/lO6JULcizJDfjcmdEXqXKUiOAuw65xQHujAKuwtz1+Zpcq1KhFDAr1YOHaUEsFwg7aUkd2uUGtpxvlMUyaScd2em65MrQTqZqoupwN+QOC7mpTI3XRA5UHavBzzdEMWSHhy77cttmo4JnV5dnVVPUrZbCkKW6KjtYVr3M0LOWy5Ot4hNFFIzBeqnQwP+geplz6uWsXKXtegm4QSZEEdfLrGVs4VTq+WA7fmQWODNB5iw/qE9lGqB9UBjgyluq2mrRIHHgvBvAMssS+CXm1Ywdd6ui2AF+kFNZsFFXs4Io2X4wU5gVRdblZnRZLCtZyw8qRkcWQkc9tNBP3XYMEzxTERSoAdodYH81STIzlr+QQBPUs9qdjCDZgzX5WhnA1norzqM2RFmS7XZHtFobuQc8BifLvVqt47Q7DLjUehDAwBSqUJPkWUmajbIsLyMQk85tCfvSUtPk7WCcaWim2XH20w3ONLUsrXFZTTOc/GmGoAFBE880Z81O1W7nO6YpWIWgaxpo58EuWueylMbZlCqvgT1ZweQ7esTFBSUjrzvKZ4lAiSmxKEBiWbwfbNNWNMS40VOOtoQeNaPAk8FGiXbOQEet/9G2Yp+VK7HK6QiNEyVKlChRokSJEv1jiKED300Lq9zx3Wqk1I7IcyAeP2pwrEw1NN4ZBJqI4JDnvFaMOrROWWP3AuzARpp7iiK3wzwXerwUSq26kwLtqLM4YdMku8pzQgRyVl8h7xFl0XEE9Y8ICSGHHhW97wb66GuOQQzXl2yqXe1/0rRSYlnVEug2e+tvrrHSf718hGoyvrzTwzBlPGxLq8WWzs2Ktfm5tqW5eYkva81GFr5/i9e9kpqIgau+KwMEhVKyDa3mdwzKbNZV/yX88b0qSshvPhqoxvX8lzqQ8ntfIhVprUZ4+c6vH00hh4qjKWCA+SiaiEPJj+b4Z+EOucQ7ml5VO6mP5giridRLYzRHWE3ED/q3O0dSfJ+EIKT4Luw6kibSzrsvUh2X+Ml01QqjScKpPJnZkKAX7qIr4LsHxyz/mO5IiraGIJyO3Uwsxd+nj8ENAtXidinMsJ7BERR3iBJDVOUo3rYnHiuxVIuV+9jbHFdRVnqPq/iKO5WajbHV7B+xOVbF16un48SO8oLRmIqhy0BoJTYfHmOttBTX+GYppjYHKa5uZsB3CI5NckzcMfTkvYrJEw6sbztuxfRJuU5Qet/vPHn2yNKzJ0/2d3b2+lqn9vd7O/v78JRHT/b3gu4TU8X0GfgG2nm0W+kC2f/YqhweHu7uPn369MrTp7u74EcFHas4W4dX9r/3u1U84xG+IezeFUDzWp8WFhYqrhYWBo5Xuof7PjeLp9tD+yw8fdbt9kONp0r3ymCsE8+4FT34Ps+j7kBZjq3u7gB4czREFO6B8n4WsbAR+GTKO9fPTWJXxi154sTu04lw99fLHRf7+gWGYd64Ppr6kn0iqsjdR947xjSO0jcwuIv9yCV4wkjwC7AEUI67Xlce0zAK70nEtZJL+IxLw7HfQOch8IrXxGMaT/a+OXCI7PS6BXJw+YAB/w24co+RWCdevnwA/rsAd1U8brwwAiCiPOH3E1zc4OHTVy9evHiVpqg3hmAvgIwdfAdO/JrBT6ZyhbxnTO18lUzjKSpaUNz0d2tnz55de8xQzBCvAor74LF14sVviAInG/yQ76KNK3JksI3NBBjttxfPWrr47dCqCZ7L1TXnxMsUBbPdJQ0lpniQ7DfsEGZCPz7r6LECDCWoxIGZHDj5O7t21TUU0hXGtC6CJRr6fcxNUZfXIPfaZfz8B3UdPxcgBdUE0sDnYhq/p3kf7grAwdzfUhcCDRxwf4NOvHiAMkhyi/Fge4Z9/Lm/HuIJL1G5q5j7sh93bGOy9dHcuUDu6yO5Y3Lf7gcjyHpJcl8c2058uY99oI2xRZE9zL0KAmTGrJdd/3rp+pMeQyYViTNHK6pRyLeauiDYb2o5EtzvF7j+O6IfhI6+8gTfckUnkxIEvVnNF4yMQr7dHiiA2xLKpskJzVajbmQz9po0R6o65S40wtHgpXHbnTc87Q7MXncH37HlSUrNZI16I9/UuVmzozULxcBGKVcUuLKgN7KqEphDdwjlEeKuMKDCWeBr31FDzMQ2cNjOf02087izNhe0DJGhFXaq0RQ4Tij4tUxKY0od2mIBw3M/vuA2PG9YcdXamh1XeQLZhYrXZi7YcdXa2reMayaH+IZlOjfcsGk20xj79cBcSc3WG62mUJ7lzdmy5lo4NnArzqMOPOGpw3TjhtfYrYCXcuJYFDcSPR6OK3dM3ixrOjDQrMpGa/QZmp2q58Gz0TS92ihmWEVRrE9BuJPcbr/hOiqmC10P9tm1n7wFjjsYOH9uWFWzvuZAg1TYjNGo6qBqckKrng3zKiOj1qvcLK+1ill14M+c4FnuvUO3IJ2TLnjanO5PwJRv+IJj7AW3vzPQ6CjqlJEXeJNrFjIjyz6nGnrH1Fr1wNqLX1B3ew4LVn/3Qn+3uPLj2tpj766F1yreE93iDl4Ezhbzgjkr1IPh6aLOcXp9xKNR8brc3aG9stcWbvwY6Mxh1nBxj/iamcIaTY3TC74zKYyuG+ow5AsHdpbxAqu9QxK8DxEcqgB/stCftwXiRNd5j9MjZrNVLcIU0OX/u/bixS9/oYh+z85hcIn/WHHK/EbwKV3cVsY3O3/wcu35C6C/vrxAgO8FgS/cWLOAF7qPfwrkdn0gF9uU68HFl99cA+X94peXvxwQptK+MjiKbKvyNwDeXQD/Bph4pfsM3ST0t7LH19Vr///ym8c/vbz68y/XQHNOqbjrs39Y8SUH4I+BJwwwkwViADzO1ZrfXPv5xbUXP/8Eivz5H60dCo5U2k8Ouz6DmguVGz/+7ceBagnL+vARjkviXE9A0d9dA3ph/fNH6EezbjC+/wigV/rZF3xmIuy5hu6uG7xG8RBhxFy1mJ8/f34Vu3+m7vaTv995duXw0J7AGZwWcXituRN7bufZDi7r2WzsS/CYr1+8uPb82lVyH10kP4TW3tl/9ujK7uGhO0PVJeeqdp9eeba/Q4xPlY0JLBzM5v/nry+u/aV/t9ryjtLC4t/b23G1t/f94FyOmZ/IH1CxPN//Pn7i83YUncmbPl9yG6b5Tj4zodcArZe77t26EzCXUTLy3MDrRP6qaY3shF5Is5W1Z3fe/eijQA+gqPWWHvCmiyWtmTeGd6hikf2m0w+3bv0gDnnErSElHf6LN8ckBBW4fpgZvvKAn6R9kLJfOfr0T7eDWuZRy8bMidISslag3Ln3Q8AAe8AbYIQmse7YV07v8l98V+bQY7xAEN8fLRwu+1Ow927d9vOG4yywnsgbRn7K2JbyZ78ozq/h7FfvCH806mhyJgN/GBw3GG/VWKxR6zDZHya886d7qVZfEzLeqrETMxT7o8KffHQ7lZLJJdtZHx/Y7g22nr3A+8Yt2Lf88707qZ5uWOPM2YJnJnkORSo6nlghwsET44ZfOr1z6x5wiKm5+R4IBm9/epswYfTCt4BdTM1dpn9iFRPBgFL95Nan76Zu3boNMnEHg3E5NBLnlvd8CUcAJ+XBgfCr5O9+dGcudeejd62CxyoyPtwK9jYT+4rFoNRh3YQ268ddwn926QS5B/9qGqEe42cnLP7jwSfJTWWCS1ykMHeT5EYGfqLclBq4VpYP4Eb+/WS5QSweEI54yht9I+DUlDcQndVqrp2viK8KN2UNQRQbVd2at8qy1CB39bRyk2L+kbiNV5K79Ypy5xPu+JRwT1a+3NlXkruRcMcnl5tBsWIB/22WXunUcqP45JNfb70FN99bfh9u/erff/1vcPME+5d+Wr8JuT7c3PThfrj8Adz81+2bJ80KtX5za2N15i7iXh7O/c5mOr2xtb1+0szbG6tpoM3PINfHLvc7mPvNh8v4+Gba1uoJsq9vraahHn4IuT5bxpvvb959E27e3URZaN+dQdesbtw/CehtDJ1OL7+NSvbu5t023tx0s4Bz89YyvgrkYGvC1k4UNUh/+T0IlXp7E5fsW5vpTWTVny1vvoNO+WB5M01oY3uC2CR1evkhwgPeZAYX/WeAG+dhOb38MTrp47vLaQ/5pMp825PsJi5sUCln0pu/gj8eAjNYRtYBrBpnyHoqaS/5JKoos+VJc2YTVb4PLR+H7eEzq1Bxgb+9bP14Cw0A3O0DX51AkW94kwQu8HepNz/8+L33lwHbzMO2p/rhQn7fytPy3ff++79ANj/owwaK28qZfuz0uaXFxcWlpfPnLP9wF1oJctPYsbff35xJn1+yzl1cfH2m/ybpdMwlvtWf5Mz56TNA09PTi+fTsHlpv72JT9t8701o++eXwEn2uUs+3Kux2vj6YIozr5+xaQD60vIfAOHv/uBxGMsPbfKP09P4tLQPd3orTu5tnwRn0ksOESjIpa+++j2wg3Mk2Pmlxd9/9dXrZ+A5i+f8qEGBx8m95ZfizMzrEPyMZb0eNitT02fsvRDbt7AtxWnhvtyADpb49BLKAQSfOecY0TTiPnMugDpe7i8C0jyHsRanPcW6iAwIZszPlTiKtWKuBySKC/z8eRIQ74bZARuBxb0RI3awoWDcTWgR0+TeJbT3TGBxp+Nt69dXfRMluHHJzxBPYQZyLwZyxx2L3/QFJ7hfR2U8M5NGpXxuZlR5b8WMHVDiLjfaOrOYJjdHcE8iCF/3sXGC23Ut2K2Doh/KPYlw0NLNgeBqKPf0CO6tyVBb2t44Lu7Vrcn2673kUbknTW1pnUCPxL066d48Fhr2icC9sXXzRAet7GE2EKyOx+20O6tb2w9OkhlrffuLzz9ftDo9gdzTVmdncWlj69QMbEIxDx58+R+/+c+N1c9htI24QT9idfW3v/3NF/cfrJ/weOZQMesPgL78cnv7/pf3799/cLppEyVKlCjRRPV3zTrj2fhpPsAAAAAASUVORK5CYII=)](https://github.com)是你的不二选择，[![vim](http://img3.douban.com/icon/g11003-1.jpg)](http://www.vim.org/index.php)也会将没有放到[github][2]上的插件推送上去

这里你可以很方便的和插件作者交流、修改你认为合理的地方

例外[github](https://github.com)上面各种代码都有，程序员的宝库啊！

# 必须安装的第一个vim插件
在史前时代，vim插件都是散落在各个文件夹中，install，uninstall，update会让人崩溃。

## [pathogen][4]  不会git，也不想学git，就安装这个吧
第一个vim插件管理器是 [pathogen][4]，你只需要将单个vim插件复制到[pathogen][4]指定的目录就好。
这无疑让对vim插件的管理变得现代化了。从此你可以很方便地测试你感兴趣的插件

[pathogen][4]最大的优点就是安装和使用都非常简单。
我第一个用的就是他，虽然这时已经有了
- [vundle][5],
- [neobundle][6],
- [vim-plug][7]

###使用指南，针对windows用户
1. 设置windows的环境变量HOME为 X:/home     
2. 建立`X:/home/vimfiles/autoload`目录    
3. 手动下载`pathogen.vim`文件，放到上面的目录下    
4. 建立`X:/home/vimfiles/bundle`目录   
5. 从github上下载插件，复制`bundle`目录下    

下面的三个插件都基于[![git](http://git-scm.com/images/logo@2x.png)][8]。你需要一定的基础，如果你没有，[学起来][17]也很快。
关键是这么强大的工具，作为一个程序员是必须学会的

## [vim-plug][7]  推荐安装
`vim-plug`是一个非常小巧的插件管理器，只需要将此插件放到autoload/目录下，即完成安装。
- 包括[vundle][5]的所有功能
- 轻量级
- 如果你配置好了`ruby`，它也支持并行安装

![picture](https://raw.githubusercontent.com/junegunn/i/master/vim-plug/installer.gif)

###使用指南，针对windows用户
1. 设置windows的环境变量HOME为 X:/home    
2. 建立`X:/home/vimfiles/autoload`目录   
3. 手动下载`plug.vim`文件，放到上面的目录下    
4. 在vimrc中添加如下语句    
```viml
    set nocompatible
    filetype plugin indent on
    call plug#begin('~/.vim/bundle')
    "Plug 'vim-airline/vim-airline'
    "Plug 'xxx/yyy'
    "……
    call plug#end()
```

## [vundle][5]
[vundle][5]是第一个基于[版本管理工具git][17]的插件管理器
- 在[vimrc][1]里跟踪和配置你的脚本
- 安装、更新已经配置的插件
- 根据名称搜索可以用的vim插件
- 清除不常用的插件

![pictur](https://camo.githubusercontent.com/bc559468e6623d18947ced1ef353f68f6116e45a/687474703a2f2f692e696d6775722e636f6d2f527565683743632e706e67)

## [neobundle][6]
[neobundle][6]基于[vundle][5]，但提供了更多的选项、功能。最吸引人的功能是并行安装，但需要
[vimproc](https://github.com/Shougo/vimproc.vim)支持

# 必须安装的插件

## [airline][9]
一个漂亮的状态栏插件， 让你的vim美观很多

- 和很多插件无缝集成
- 速度很快
- 主题很多

![pic](https://github.com/bling/vim-airline/wiki/screenshots/demo.gif)

## [ctrlp][10]
杀手级插件，类似`sublime`的`<C-P>`，支持**buffer**，**file**，**mru**等等。通过externsion，甚至可以定位`mark`，`register`，`cmdline history`，`yankring`。虽然在操作体验上还不如`sublime`，但是功能上已经超越了师傅，更是拉下`fuzzyfinder`，`lookupfiles`这些老一辈Vim插件好几条街。

最大的特点，支持以`project`为单位

![](https://camo.githubusercontent.com/0a0b4c0d24a44d381cbad420ecb285abc2aaa4cb/687474703a2f2f692e696d6775722e636f6d2f7949796e722e706e67)

## [ultisnips][11]
杀手级插件，定制snippets，从此你运指如飞

![](https://camo.githubusercontent.com/296aecf30e1607233814196db6bd3f5f47e70c73/68747470733a2f2f7261772e6769746875622e636f6d2f5369725665722f756c7469736e6970732f6d61737465722f646f632f64656d6f2e676966)

## [neocomplete][14] or [YouCompleteMe][15]
`YouCompleteMe`很强大，但windows下不好配置，`neocomplete`是windows下最好用的补全插件了
期待**neovim**会对补全有更好的支持

## [nerdcommenter][12]
注释插件，支持各种语言，各种方式，程序员必备


# 推荐安装的插件
## [Ag.vim][18]
源代码搜索利器，[the_silver_searcher][19]的前端，可以自动忽略`.gitignore`里面的文件类型
速度方面：ag > ack > grep

## [vim-signature][13]
可视化的书签

![](https://github.com/kshenoy/vim-signature/raw/images/screens/vim-signature_marks_markers.png?raw=true)

## [vim-fugitive](https://github.com/tpope/vim-fugitive)
**git**命令在vim里的无缝集成

## [vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
如果你习惯使用它，它非常牛逼
![](https://camo.githubusercontent.com/d5f800b9602faaeccc2738c302776a8a11797a0e/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f333739373036322f323033393335392f61386539333864362d383939662d313165332d383738392d3630303235656138333635362e676966)

## [vim-surround]()

## [vimcdoc][16]
中文帮助文档，省的windows下还要去下载exe安装文件

[1]: https://coding.net/u/kdurant/p/vimrc/git
[2]: https://github.com
[3]: http://www.vim.org
[4]: https://github.com/tpope/vim-pathogen
[5]: https://github.com/gmarik/Vundle.vim
[6]: https://github.com/Shougo/neobundle.vim
[7]: https://github.com/junegunn/vim-plug
[8]: http://msysgit.github.io/
[9]: https://github.com/bling/vim-airline
[10]: https://github.com/kien/ctrlp.vim
[11]: https://github.com/SirVer/ultisnips
[12]: https://github.com/scrooloose/nerdcommenter
[13]: https://github.com/kshenoy/vim-signature
[14]: https://github.com/Shougo/neocomplete.vim
[15]: https://github.com/Valloric/YouCompleteMe
[16]: https://github.com/asins/vimcdoc
[17]: http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000
[18]: https://github.com/rking/ag.vim
[19]: https://github.com/ggreer/the_silver_searcher
