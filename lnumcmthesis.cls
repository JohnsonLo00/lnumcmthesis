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
\ProvidesClass{lnumcmthesis}[2024/06/10 v1.0 Unofficial LaTeX Template for Liaoning Undergraduate Mathematical Contest in Modeling]
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
  abstractname = {\zihao{3}摘~ 要},
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
\geometry{top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm, headsep=0.5cm}

\pagestyle{fancy}
\lhead{} %在'heading=true'下，默认左页眉为当前二级标题名称，因此要赋值为空
\rhead{} %'heading=true'下，默认右页眉为当前一级标题名称，，因此要赋值为空
\chead{}
\cfoot{\zihao{-5} \thepage}
\renewcommand{\headrulewidth}{0.4pt} %疑惑：setlength命令不起作用
\renewcommand{\footrulewidth}{0pt}
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
\newcommand{\lnumcmthesis@tokens@school}{~} %【参赛学校】
\newcommand{\lnumcmthesis@tokens@tihao}{~} %【参赛题号】
\newcommand{\lnumcmthesis@tokens@bianhao}{~} %【校内编号】
\newcommand{\lnumcmthesis@tokens@membera}{~} %【队员姓名A】
\newcommand{\lnumcmthesis@tokens@memberb}{~} %【队员姓名B】
\newcommand{\lnumcmthesis@tokens@memberc}{~} %【队员姓名C】
\newcommand{\lnumcmthesis@tokens@supervisor}{~} %【指导教师】
\newcommand{\lnumcmthesis@tokens@yearinput}{XXXX} %【年（日期）】
\newcommand{\lnumcmthesis@tokens@monthinput}{XX} %【月（日期）】
\newcommand{\lnumcmthesis@tokens@dayinput}{XX} %【日（日期）】
%% ============================================================ %


%% -------------------- 正式变量定义 -------------------- %
\newcommand{\ttle}[1]{\renewcommand{\ttleinMAINBODY}{#1}} %【论文标题】
\newcommand{\school}[1]{\renewcommand{\lnumcmthesis@tokens@school}{#1}} %【参赛学校】
\newcommand{\tihao}[1]{\renewcommand{\lnumcmthesis@tokens@tihao}{#1}} %【参赛题号】
\newcommand{\bianhao}[1]{\renewcommand{\lnumcmthesis@tokens@bianhao}{#1}} %【校内编号】
\newcommand{\membera}[1]{\renewcommand{\lnumcmthesis@tokens@membera}{#1}} %【队员姓名A】
\newcommand{\memberb}[1]{\renewcommand{\lnumcmthesis@tokens@memberb}{#1}} %【队员姓名B】
\newcommand{\memberc}[1]{\renewcommand{\lnumcmthesis@tokens@memberc}{#1}} %【队员姓名C】
\newcommand{\supervisor}[1]{\renewcommand{\lnumcmthesis@tokens@supervisor}{#1}} %【指导教师】
\newcommand{\yearinput}[1]{\renewcommand{\lnumcmthesis@tokens@yearinput}{#1}} %【年（日期）】
\newcommand{\monthinput}[1]{\renewcommand{\lnumcmthesis@tokens@monthinput}{#1}} %【月（日期）】
\newcommand{\dayinput}[1]{\renewcommand{\lnumcmthesis@tokens@dayinput}{#1}} %【日（日期）】
%% ============================================================ %

% ================================================================================ %


% ------------------------- 封面页的导入 ------------------------- %
\newcommand{\makecoverpage}{
  \thispagestyle{empty} %【无页眉页脚】

~\vspace{1ex}

\begin{flushright}
{\selectfont\fontsize{22}{0pt}\bf 封面}
\end{flushright}{}\vspace{44pt}

\begin{center}
{\selectfont\fontsize{22}{0pt}\bf\lnumcmthesis@tokens@yearinput 年辽宁省大学生数学建模论文}
\end{center}{}\vspace{42.0pt}

\begin{table}[H]
    \renewcommand\arraystretch{1.5}
    \centering
    \arrayrulecolor{coverblue}
    \begin{tabular}[lc]
      {
      >{\fontsize{10.5pt}{0pt}\selectfont}m{7.5cm}
      >{\centering\arraybackslash\fontsize{10.5pt}{0pt}\selectfont} m{5.5cm}
      }
      {\bf\color{coverblue}参赛学校(完整的学校全称，不含院系名)：} & {\bf\lnumcmthesis@tokens@school} \\
      \hline\vspace{21.0pt}
      {\bf\color{coverblue}参赛题号(从A/B/C中选择一项填写)：} & {\bf\lnumcmthesis@tokens@tihao} \\
      \hline\vspace{21.0pt}
      {\bf\color{coverblue}校内编号(与报名表上序号一致)：} & {\bf\lnumcmthesis@tokens@bianhao} \\
      \hline\vspace{21.0pt}
      {\bf\color{coverblue}队员姓名(打印并签名)：1、} & {\bf\lnumcmthesis@tokens@membera} \\
      \hline\vspace{21.0pt}
      \hspace{111.5pt} {\bf\color{coverblue}2、} & {\bf\lnumcmthesis@tokens@memberb} \\
      \hline\vspace{21.0pt}
      \hspace{111.5pt} {\bf\color{coverblue}3、} & {\bf\lnumcmthesis@tokens@memberc} \\
      \hline\vspace{21.0pt}
      {\bf\color{coverblue}指导教师或指导教师组负责人(打印并签名)：} & {\bf\lnumcmthesis@tokens@supervisor} \\
      \hline
      \multicolumn{2}{c}{{\color{coverblue}\kaishu（指导教师签名意味着对参赛队的行为和论文的真实性负责）}}
    \end{tabular}
\end{table}{}\vspace{31.5pt}

\begin{flushright}
{\zihao{-4}\underline{\quad\lnumcmthesis@tokens@yearinput\quad}年\underline{\quad\lnumcmthesis@tokens@monthinput\quad}月\underline{\quad\lnumcmthesis@tokens@dayinput\quad}日}
\end{flushright}
\arrayrulecolor{black} %使封面页之后的表格线颜色恢复正常
\newpage
} %【\newcommand{\makecoverpage}】
% ============================================================ %


% --------------- 对sty,cls的命令的定制 --------------- %
\RequirePackage{etoolbox}

\apptocmd{\makecoverpage}{
\pagestyle{plain} %摘要页设置为无页眉、有页脚的模式
\pagenumbering{arabic} %从摘要页开始计数，且设为阿拉伯数字页码
\renewcommand{\baselinestretch}{1.25}
}{\typeout{succeeds: edit the style of page using package etoolbox}}{\PackageError{fails: edit the style of page using package etoolbox}}

\BeforeBeginEnvironment{abstract}{
\begin{center}
{\bf\zihao{-2}\ttleinMAINBODY}
\end{center}
}

\pretocmd{\bibliography}{
\addcontentsline{toc}{section}{参~ 考~ 文~ 献} %不能放在导言区
\vspace*{0pt}
}{\typeout{succeeds: edit the style of the part of bibliography using package etoolbox}}{\PackageError{fails: edit the style of the part of bibliography using package etoolbox}}

\apptocmd{\bibliography}{
\vspace*{0pt}
}{\typeout{succeeds: edit the flexible spacing after the part of bibliography using package etoolbox}}{\PackageError{fails: edit the flexible spacing after the part of bibliography using package etoolbox}}

\BeforeBeginEnvironment{thebibliography}{
\vspace*{0pt}
}
% ======================================== %


% --------------- 超链接与交叉引用 --------------- %
\RequirePackage[hidelinks, bookmarksnumbered=true, bookmarksopen=true, breaklinks=true]{hyperref} %参数bookmarksnumbered使得PDF书签自带编号
% ======================================== %
