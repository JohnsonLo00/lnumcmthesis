
LNUMCMTHESIS
===
**辽宁省大学生数学建模竞赛论文模板**

**Hank Lo**, [yhlaozero2@163.com](yhlaozero2@163.com)
**`v2.1.0`(2026-05-22)**

**模板许可说明**：本模板的发布遵守[The LaTeX Project Public License（LPPL）](https://www.latex-project.org/lppl/lppl-1-3c/)。禁止任何人将本模板用于任何商业用途。

**QQ交流群**: 345749407


---

## 概述

LNUMCMTHESIS 是非官方版辽宁省大学生数学建模竞赛论文 LaTeX 模板。本模板参照《辽宁省大学生数学建模竞赛报名通知》《全国大学生数学建模竞赛论文格式规范》进行设计与更新，适用于辽宁省大学生数学建模竞赛论文的编写，也供各位用户研究使用.


## 特点

- **格式与内容分离**
  - 格式已预设，让用户投入到论文内容本身
  - 让论文编写简化为文本的增删查改
- **各类编号自动化**
  - 省去手动编号繁琐/方法难、“删一个动全文”等麻烦
  - 解决各类交叉引用的“方法难”
- **完备的数学公式生态**
- **跨平台（操作系统、网络端）兼容**
- **具备较友好的高阶工具适配性**
  - 对科学软件、AI Agent 的导出内容的迁移友好


## 模板获取/更新方式

目前可从如下平台获取本模板：

- [GitHub](https://github.com/JohnsonLo00/lnumcmthesis) (当前版本：`v2.1.0` [最新])
- [Gitee](https://gitee.com/jhonson-lo/lnumcmthesis) (当前版本：`v2.1.0` [最新])
- [Overleaf]() (当前版本：`v2.1.0` [最新])
- [TeXPage]() (当前版本：`v2.1.0` [最新])

其中，可在 [GitHub Releases](https://github.com/JohnsonLo00/lnumcmthesis/releases) 或 [Gitee Releases](https://gitee.com/jhonson-lo/lnumcmthesis/releases) 板块下载模板；Overleaf 与 TeXPage 上可通过在模板库中搜索 `lnumcmthesis`(作者为 HankLo)来获取模板。特别的，Overleaf 与 TeXPage 存在审核机制，新模板上线时间一般晚于所声明的时间。

对于第一次使用的用户而言，下载后按照手册上手使用即可. 而对于升级模板的用户，**一般只需把新版本的 `lnumcmthesis.cls`、`README.md` 和 `guidebook_of_lnumcmthesis.pdf` 拷贝过来即可**.


## 文件组成

模板压缩包内部的文件组成如下：

```
lnumcmthesis/
├─ codes/ 用于放置源代码文件. 需写入论文中的代码可以通过
|         文件导入的命令来实现写入
├─ figures/ 用于放置图片文件. 需插入论文中的图片可以通过
|           文件导入的命令来实现插入
├─ mainbody/ 用于放置正文各章节的子tex文件. 论文的每个章节
|            均可分为不同的tex文件进行编写，最后再汇总导入
|            一个tex文件中(即文件main.tex)
| 
├─ guidebook_of_lnumcmthesis.pdf：[使用手册]
├─ lnumcmthesis.cls：[文档类]文件
├─ main.tex：[文档类]文件. 聚集各章节的tex文件为一体
├─ main.pdf：由main.tex编译生成的PDF文档
├─ refs.bib：参考文献数据库文件. 参考文献列表可以通过bib文件导入的命令来生成
├─ latexmkrc: [latexmk配置]文件
├─ LICENSE：开源协议文件
```


## 快速开始

可直接对主文档 `main.tex`进行编译，可选择的编译方案为：
- XeLaTeX - BiBTeX - XeLaTeX - XeLaTeX
- Latexmk


## 如何处理错误

当用户在使用模板的过程中遇到bug或者格式问题，可按照如下顺序逐步尝试：
顺序逐步尝试：
- 手动排查；
- 查阅 \verb|guidebook_of_nemcmthesis.pdf|；
- 将模板升级到最新版本；
- 在QQ群中发起提问；
- 将情况说明提交到 [GitHub-Issues](https://github.com/JohnsonLo00/lnumcmthesis/issues) 或 [Gitee-Issues](https://gitee.com/jhonson-lo/lnumcmthesis/issues).


---

## 更新日志

#### v2.1.0, 2026-05-22

**Changed**:
- 调整了页眉的对齐设置
- 删除了主文档中暂时无用的命令


#### v2.0, 2024-07-11

-   取消了往年沿用的封面页，引入了2024年竞赛组委会指定的摘要专用页

-   在主文件main.tex中加入了算法伪代码的示例

-   引入了附录中的支撑材料列表

-   优化了其他相关功能

#### v1.0, 2024-06-10

-   创建本模板
