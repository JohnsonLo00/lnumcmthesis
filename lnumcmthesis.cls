%
% This is file "lnumcmthesis.cls"
%
% Copyright (C) 2023-2024 by JL <yhlaozero2@163.com>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%



% --------------- 全局设置 --------------- %
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lnumcmthesis}[2024/07/11 v2.0 Unofficial LaTeX Template for Liaoning Undergraduate Mathematical Contest in Modeling]
% ======================================== %


% --------------- 编译器约束 --------------- %
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{lnumcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
% ======================================== %


% ---------- 文档类声明命令的可选参数初始化 ---------- %
\newif\if@lnumcmthesis@coverpage %【封面页控制，初始值为真，下同】

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax %【这句万万不可改动】
\LoadClass[a4paper, 12pt]{article} %【导入正规文档类】
% ======================================== %


% --------------- ctex宏集设置 --------------- %
\RequirePackage[UTF8, heading=true, zihao = -4]{ctex}
\ctexset{
  abstractname = {\zihao{-3}摘~ 要},
  bibname = \hfill{\zihao{3}参~ 考~ 文~ 献}\hfill,
  section = {
    format = {\centering\zihao{3}\bfseries},
    name = {,、},
    number = \zhnumber{\thesection},
    beforeskip=15pt,
    afterskip=10pt,
    aftername={},
  },
  subsection={
    format={\zihao{4}\bfseries},
	beforeskip=15pt,
    afterskip=10pt,
  },
  subsubsection={
    format={\zihao{-4}\bfseries},
	beforeskip=15pt,
    afterskip=10pt,
  }
}
% ======================================== %


% --------------- 原有的标题页三要素设置为空 --------------- %
\title{}
\author{}
\date{}
% ======================================== %


% --------------- 页面样式 --------------- %
\RequirePackage[table]{xcolor} %颜色定制
\RequirePackage{fancyhdr} %定制页眉页脚
\RequirePackage{geometry} %定制页面
\geometry{top=3.0cm, bottom=2.5cm, left=2.5cm, right=2.5cm, headsep=1.5cm}
% ======================================== %


% --------------- 字体 --------------- %
\RequirePackage{fontspec}
\setmainfont{Times New Roman} %英文字体设置
% ======================================== %


% --------------- 摘要环境 --------------- %
\RequirePackage{abstract}
\setlength{\absleftindent}{0pt} %取消左自动缩进
\setlength{\absrightindent}{0pt} %取消右自动缩进
\newcommand{\keywords}[1]{\vspace{\baselineskip}{}\noindent\bf 关键词: #1} %插入关键词
% ======================================== %


% --------------- 列表环境 --------------- %
\RequirePackage[inline]{enumitem}
\setlist{leftmargin=0pt, itemindent=2\parindent, itemsep=0pt, parsep=0pt}
% ======================================== %


% --------------- 数学环境 --------------- %
\RequirePackage{amsmath, amssymb, mathrsfs} %数学公式三件套
\numberwithin{equation}{section} %将一级章节编号添加到公式编号
\RequirePackage{siunitx} %SI制单位
\newcommand\bk{\boldsymbol}
\newcommand\lt{\left}
\newcommand\rt{\right}
\DeclareMathOperator{\diff}{\,\mathrm{d}\hspace{-1.5pt}} %微分算子
\newcommand\bfunit[1]{\unit{\bf{#1}}} %加粗的数值单位

\RequirePackage{amsthm}
\newtheoremstyle{newthmstyle}
  {3pt} %Space above
  {3pt} %Space below
  {\rm} %Body font
  {\parindent} %Indent amount
  {\bf} %Theorem head font
  {} %Punctuation after theorem head
  {1.0em} %Space after theorem head
  {} %Theorem head spec (can be left empty, meaning ‘normal’)
\theoremstyle{newthmstyle}
\newtheorem{Definition}{定义}[section]
\newtheorem{Proposition}{命题}[section]
\newtheorem{Lemma}{引理}[section]
\newtheorem{Theorem}{定理}[section]
\newtheorem{Example}{例}[section]
\newtheorem{Problem}{问题}[section]
\newtheorem{Corollary}{推论}[section]
\newtheorem{Remark}{注}[section]
\renewcommand{\proofname}{\zihao{-4}\bfseries 证明}
% ======================================== %


% --------------- 代码环境 --------------- %
\RequirePackage{verbatim} %简易代码环境（提供：verbatim 环境。缺点：不能解决断行问题。）
\RequirePackage{listings} %定制代码环境
\RequirePackage{matlab-prettifier} %MATLAB专门的代码环境
%代码环境定制
\lstset{
  basicstyle=\small\ttfamily, %整体的字号、字体
  stringstyle=\ttfamily, %字符串样式
  backgroundcolor=\color{gray!10}, %背景颜色
  frame=trbl, %显示各方向的代码框线条
  frameround=tttt, %设置代码框各棱角的形状
  breaklines=true, %自动断行
  showstringspaces=false, %取消特别的字符间距
  framexleftmargin=5pt, %内部左边距
}
% ======================================== %


% --------------- 伪代码 --------------- %
\RequirePackage[ruled, lined]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
% ======================================== %


% --------------- 标题样式：章、节、条、款、项 --------------- %
\RequirePackage{titlesec}
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
\titleformat{\paragraph}
  {\normalsize\bfseries} %字体
  {\theparagraph} %标题前的标签
  {1em} %标题和标签之间的间距
  {} %标题前没有额外的命令或内容
\titlespacing{\paragraph}
  {0pt} %标题左间距
  {0.5ex \@plus 1ex \@minus.2ex} %标题上间距
  {0.5ex \@plus .2ex} %标题下间距
\newcommand{\fourthsection}[1]{\paragraph{#1}} %将命令\paragraph改名为四级标题
% ======================================== %


% --------------- 图、表标题样式 --------------- %
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{doublespace}{~~}
\captionsetup{font=small, labelsep=doublespace, labelfont=bf, textfont=bf}
\RequirePackage[labelformat=brace]{subcaption} %(与 subfigure 宏包冲突)也能提供 subfigure 环境（需设置宽度），并使环境中的标题变成副标题样式
\numberwithin{figure}{section} %numberwithin命令必须放在amsmath宏包之后
\numberwithin{table}{section}
% ======================================== %


% --------------- 插图环境 --------------- %
\RequirePackage{graphicx}
\RequirePackage{float} %引入参数H
\graphicspath{{figures/}} %可添加多个母目录，之间用逗号隔开
% ======================================== %


% --------------- 表格环境 --------------- %
\RequirePackage{makecell}
\RequirePackage{booktabs} %【三线表】
\RequirePackage{longtable} %【跨页表格】
\RequirePackage{tabularx} %【定制表格宽度】
\RequirePackage{multirow} %【实现表格行合并】
\RequirePackage{diagbox} %【表头反斜线】
\RequirePackage{bigstrut} %【在跨行表格中输入定界符】
\RequirePackage{makecell} %【封面表格横线的宽度】
\RequirePackage{multicol} %【实现双栏/多栏环境】
% ======================================== %


% --------------- 调整行间距 --------------- %
\RequirePackage{setspace}
% ======================================== %


% --------------- 杂项 --------------- %
\RequirePackage{titletoc} % 设置目录样式（但辽省赛不需要目录）
\RequirePackage{comment} % 提供注释环境
\definecolor{coverblue}{RGB}{79,129,189}
\RequirePackage{lipsum, zhlipsum} %随机文本（用于调试）
% ======================================== %


% --------------- 参考文献 --------------- %
\RequirePackage[numbers,square,comma]{natbib}
\RequirePackage{gbt7714}
\setlength{\bibsep}{0ex}
\bibliographystyle{gbt7714-numerical}
\newcommand{\upcite}[1]{$^{\mbox{\footnotesize\cite{#1}}}${}} % 上标形式的引用
% ======================================== %


% --------------- 附录与自定义附录 --------------- %
\RequirePackage{appendix} %设置附录样式

% 自定义附录章标题、在目录中的样式
\newcounter{appendixcounting} %定义专属于附录的计数器
\addtocounter{appendixcounting}{1} %附录标题计数器的初始值设为1
\newcommand{\appendixsec}[1]{ \zihao{4}{\section*{附录\arabic{appendixcounting}\quad #1}}\addcontentsline{toc}{section}{附录\theappendixcounting\quad #1}\addtocounter{appendixcounting}{1}} %注：一定要先添加到目录、再将计数器值增1
% ======================================== %


% ------------------------- 关于论文信息的全局变量导入 ------------------------- %
\RequirePackage{ifthen} %【引入条件判断逻辑】
\RequirePackage{zhnumber} %【中文数字】
%% -------------------- 图片&表格 -------------------- %
\RequirePackage{array} %【与表格相关】
%% ============================================================ %

%% -------------------- 变量预定义 -------------------- %
\newcommand{\ttleinMAINBODY}{~} %【论文标题】
\newcommand{\lnumcmthesis@tokens@tihao}{~} %【参赛题号】
\newcommand{\lnumcmthesis@tokens@bianhao}{~} %【校内编号】
%% ============================================================ %

%% -------------------- 正式变量定义 -------------------- %
\newcommand{\ttle}[1]{\renewcommand{\ttleinMAINBODY}{#1}} %【论文标题】
\newcommand{\tihao}[1]{\renewcommand{\lnumcmthesis@tokens@tihao}{#1}} %【参赛题号】
\newcommand{\bianhao}[1]{\renewcommand{\lnumcmthesis@tokens@bianhao}{#1}} %【校内编号】
%% ============================================================ %

% ================================================================================ %


% --------------- 对sty,cls的命令的定制 --------------- %
\RequirePackage{etoolbox}

\AtBeginDocument{
\renewcommand{\baselinestretch}{1.25}
}

\newcommand{\lheadbox}{
\parbox{0.25\textwidth}{
\centering
{\zihao{-4}\bf 选择的题号} \\[8pt]
{\Large \lnumcmthesis@tokens@tihao}
}\vspace{5pt}}
\newcommand{\cheadbox}{
\parbox{0.5\textwidth}{
\centering\zihao{-4}\bf
2024\\
辽宁省大学生数学建模竞赛\\
摘要页
}\vspace{5pt}}
\newcommand{\rheadbox}{
\parbox{0.25\textwidth}{
\centering
{\zihao{-4}\bf 校内编号} \\[8pt]
{\Large \lnumcmthesis@tokens@bianhao}
}\vspace{5pt}}
\BeforeBeginEnvironment{abstract}{
%% ---------- 摘要专用页的页眉页脚 ---------- %
\thispagestyle{fancy}
\fancyhf{}
\lhead{\lheadbox}
\chead{\cheadbox}
\rhead{\rheadbox}
\renewcommand{\headrulewidth}{1.5pt} %页眉线粗细
\renewcommand{\footrulewidth}{0pt} %页脚线粗细
\cfoot{\zihao{-5} \thepage} %页脚中部
%% ======================================== %
\begin{center}
{\bf\zihao{3}\ttleinMAINBODY}
\end{center}
}

\AfterEndEnvironment{abstract}{
\pagestyle{plain} %摘要页之后设置为无页眉、有页脚的模式
}

\pretocmd{\bibliography}{
\addcontentsline{toc}{section}{参~ 考~ 文~ 献} %不能放在导言区
\vspace*{0pt}
}{\typeout{succeeds: edit the style of the part of bibliography using package etoolbox}}{\PackageError{fails: edit the style of the part of bibliography using package etoolbox}}

\apptocmd{\bibliography}{
\vspace*{0pt}
}{\typeout{succeeds: edit the flexible spacing after the part of bibliography using package etoolbox}}{\PackageError{fails: edit the flexible spacing after the part of bibliography using package etoolbox}}

\BeforeBeginEnvironment{thebibliography}{
\addcontentsline{toc}{section}{参~ 考~ 文~ 献} %不能放在导言区
\vspace*{0pt}
}

\AfterEndEnvironment{thebibliography}{
\clearpage\vspace*{0pt}
}{\typeout{succeeds: aft-style of env thebibliography}}{\typeout{fails: aft-style of env thebibliography}}

\pretocmd{\appendixsec}{
\vspace{10pt}
}{\typeout{成功：附录环境下在下一个章节前前换页}}{\PackageError{失败：附录环境下在下一个章节前前换页}}
% ======================================== %


% --------------- 超链接与交叉引用 --------------- %
\RequirePackage[hidelinks, bookmarksnumbered=true, bookmarksopen=true, breaklinks=true]{hyperref} %参数bookmarksnumbered使得PDF书签自带编号
% ======================================== %
