
lnumcmthesis
===
**2024年辽宁省大学生数学建模竞赛论文模板**

**JL**, [yhlaozero2@163.com](yhlaozero2@163.com)
**v1.0(2024/06)**

***

#### Overview

现发布非官方版2024年辽宁省大学生数学建模竞赛论文模板。本模板参照《关于辽宁省2024年数学建模竞赛的报名通知》《全国大学生数学建模竞赛论文格式规范（2023）》进行设计，适用于辽宁省数学建模竞赛论文的编写，也供各位读者研究使用。


## 模板介绍

lnumcmthesis(**Thesis** Template for **L**iao**n**ing **U**ndergraduate **M**athematical **C**ontest in **M**odeling)，即2024年辽宁省大学生数学建模竞赛论文模板，诞生于2024年春天前际、初步成熟于当年夏天。现将本模板发布，为苦于格式调试的参赛者提供多一种选择，尽可能让参赛者**不因为格式问题、“颜值”问题而提前退出竞争**.

本模板尚未完全成熟，仍有诸多需要改进之处. 当读者在使用模板的过程中遇到bug或者格式问题，建议按照如下顺序寻求解决方案：

1.  查阅文件`gbk_of_lnumcmthesis.pdf`；
2.  查阅相关手册（e.g. texdoc）
3.  Retrieving on the Internet；
4.  GitHub：将具体情况说明提交到[Issues](https://github.com/JohnsonLo00/dlmubachelorthesis/issues)；
5.  联系JL，提供具体情况说明。

此外，本模板处于受维护状态，下一步大致的更新方向如下：

- 完善**原有设计**（结合各位读者提交的具体情况说明，或新发布的格式规范）

在此欢迎各位读者以及开发者献计、参与到本模板的后续开发中！

## 模板许可说明

本模板的发布遵守[The LaTeX Project Public License（LPPL）](https://www.latex-project.org/lppl/lppl-1-3c/)。

## 模板获取方式

目前可从三个平台上获取到本模板：

-   [**GitHub**](https://github.com/JohnsonLo00/lnumcmthesis)

-   [**Gitee**](https://gitee.com/jhonson-lo/lnumcmthesis)

-   [**Overleaf**]()

## 模板运行前的配置

为成功编译出想要的PDF文件，读者的设备需具备如下组件：

- **LaTeX发行版**(相当于源数据包、引擎)：[TeXLive](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/)(for Windows), [MacTeX](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/mac/mactex/)(for MacOS), etc
- **编辑器**(tex文件的查看、编辑、编译)：[WinEdit](https://www.winedt.com/download.html)(for Windows), [TeXShop](https://pages.uoregon.edu/koch/texshop/)(for MacOS), TeXWorks(一般会随着TeXLive的安装而附带安装), TeXstudio, VSCode, etc
- **PDF查看器**(查看编辑器编译成功后所得到的PDF文件)：[SumatraPDF](https://www.sumatrapdfreader.org/download-free-pdf-viewer)(for
    Windows), etc.

JL已通过电脑本地和OverLeaf两种方式成功实现了本模板的使用：

- 电脑本地：Windows10, TeXLive2024, WinEdit/TeXstudio, SumatraPDF

- OverLeaf：普通项目，编译器选择XeLaTeX.

其他的方案组合尚未实践，如遇问题，必要时可提交具体情况说明。

## 文件组成

模板压缩包内部的文件组成如下：

```
codes/ 用于放置源代码文件. 需写入论文中的代码可以通过文件导入的命令来实现写入
figures/ 用于放置图片文件. 需插入论文中的图片可以通过文件导入的命令来实现插入
- signature/ 用于放置封面页的队员签名截图
- fig_chx/ 用于放置第x章内的图片文件
mainbody/ 用于放置正文各章节的子tex文件. 论文的每个章节均可分为不同的tex文件进行编写，最后再汇总导入一个tex文件中(即文件main.tex)
- aabstract.tex：摘要
- chx.tex：第x章
- appendiceS.tex：附录
packages/ 用于放置第三方宏包文件. 一部分宏包不跟随LaTeX 发行版下载到本地，因此需要另外导入
gbk_of_lnumcmthesis.pdf：本模板的使用指北
lnumcmthesis.cls：本模板的文档类文件
LICENSE：The LaTeX Project Public License（LPPL）
main.tex：中枢tex文件. 聚集各章节的tex文件为一体
main.pdf：由main.tex编译生成的PDF文档
refs.bib：参考文献数据库文件. 参考文献列表可以通过bib文件导入的命令来生成
```


