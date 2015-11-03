# [![vim](http://img3.douban.com/icon/g11003-1.jpg)](http://www.vim.org/index.php)插件是什么

-------

- 这篇文章假设你已经会vim的基本操作，map等等

- 你可以参考,但不能照搬, 因为可能一些插件、按键的map完全不适合你

-------

# 去哪里下载插件
[![github](http://baike.baidu.com/picture/3366456/3366456/0/6159252dd42a2834b1c7cf5b59b5c9ea15cebf79.html?fr=lemma&ct=single#aid=0&pic=6159252dd42a2834b1c7cf5b59b5c9ea15cebf79)](https://github.com)是你的不二选择，[![vim](http://img3.douban.com/icon/g11003-1.jpg)](http://www.vim.org/index.php)也会将没有放到[github][2]上的插件推送上去

这里你可以很方便的和插件作者交流、修改你认为合理的地方

例外[github](https://github.com)上面各种代码都有，程序员的宝库啊！

# 必须安装的第一个vim插件
在史前时代，vim插件都是散落在各个文件夹中，install，uninstall，update会让人崩溃。因为这个，我放弃过学习vim。

## [pathogen][4]
第一个vim插件管理器是 [pathogen][4]，你只需要将单个vim插件复制到[pathogen][4]指定的目录就好。
这无疑让对vim插件的管理变得现代化了。从此你可以很方便地测试你感兴趣的插件

[pathogen][4]最大的优点就是安装和使用都非常简单。
我第一个用的就是他，虽然这时已经有了
- [vundle][5],
- [neobundle][6],
- [vim-plug][7]

上面的三个插件都基于[![git](http://git-scm.com/images/logo@2x.png)][8]。你需要一定的基础，如果你没有，[学起来][17]也很快。
关键是这么强大的工具，作为一个程序员是必须学会的

## [vundle][5]
[vundle][5]是第一个基于[伟大的版本管理工具git][17]的插件管理器
- 在[vimrc][1]里跟踪和配置你的脚本
- 安装、更新已经配置的插件
- 根据名称搜索可以用的vim插件
- 清除不常用的插件

![pictur](https://camo.githubusercontent.com/bc559468e6623d18947ced1ef353f68f6116e45a/687474703a2f2f692e696d6775722e636f6d2f527565683743632e706e67)

## [neobundle][6]
[neobundle][6]基于[vundle][5]，但提供了更多的选项、功能。最吸引人的功能是并行安装，但需要
[vimproc](https://github.com/Shougo/vimproc.vim)支持

## [vim-plug][7]
`vim-plug`是一个非常小巧的插件管理器，只需要将此插件放到autoload/目录下，即完成安装。
- 包括[vundle][5]的所有功能
- 轻量级
- 如果你配置好了`ruby`，它也支持并行安装

![picture](https://raw.githubusercontent.com/junegunn/i/master/vim-plug/installer.gif)

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
