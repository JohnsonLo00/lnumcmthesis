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
\RequirePackage[UTF8,heading=true,zihao=-4]{ctex}
\ctexset{
  abstractname = {\zihao{-4}摘~ 要},
  bibname = \hfill{\zihao{4}参~ 考~ 文~ 献}\hfill,
  section = {
    format = {\centering\bfseries},
    name = {,、},
    number = \chinese{section},
    beforeskip=15bp,
    afterskip=10bp,
    aftername={},
  },
  subsection={
    format={\bfseries},
    beforeskip=15bp,
    afterskip=10bp,
  },
  subsubsection={
    format={\bfseries},
    beforeskip=15bp,
    afterskip=10bp,
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
\definecolor{keywordincode}{RGB}{000,000,255}
\definecolor{stringincode}{RGB}{128,128,000}
\definecolor{commentincode}{RGB}{106,153,85}

\RequirePackage{fancyhdr} %定制页眉页脚
\RequirePackage{geometry} %定制页面
\geometry{top=3.0cm, bottom=3.5cm, left=2.5cm, right=2.5cm}
% ======================================== %


% --------------- 字体 --------------- %
\RequirePackage{fontspec}
%% --------- 英文字体设置 ----------- %
\IfFontExistsTF{Times New Roman}{
    \setmainfont{Times New Roman}
  }{
    \IfFontExistsTF{./misc/times.ttf}{
      \setmainfont{times}[
        Path={./misc/},
        Extension = .ttf,
        UprightFont = times,
        BoldFont = timesbd,
        ItalicFont = timesi,
        BoldItalicFont = timesbi,
      ]
    }{
      \setmainfont{TeX Gyre Termes} %发行版内置字体
    }
  }
%% ================================== %
% ======================================== %


% --------------- 摘要环境 --------------- %
\RequirePackage{abstract}
\setlength{\absleftindent}{0pt} %取消左自动缩进
\setlength{\absrightindent}{0pt} %取消右自动缩进
\renewcommand{\abstracttextfont}{\normalsize} %修改摘要内容的字号
\newcommand{\keywords}[1]{\vspace{\baselineskip}{}\noindent\bfseries 关键词: #1} %插入关键词
% ======================================== %


% --------------- 列表环境 --------------- %
\RequirePackage[inline]{enumitem}
% ======================================== %


% --------------- 数学环境 --------------- %
\RequirePackage{amsmath,amssymb,mathrsfs} %数学公式三件套
\RequirePackage{siunitx} %SI制单位
\DeclareMathOperator{\diff}{\,\mathrm{d}\hspace{-1.5pt}} %微分算子

\RequirePackage{amsthm}

\renewcommand{\proofname}{证明}
\renewenvironment{proof}[1][\proofname]{\par
\pushQED{\qed}%
\normalfont \topsep6\p@\@plus6\p@\relax
\trivlist
\item\relax
{\hspace{\parindent}\rmfamily\bfseries #1\@addpunct{:}}\hspace\labelsep\ignorespaces
}{%
\popQED\endtrivlist\@endpefalse
}

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
\newtheorem{Definition}{定义}
\newtheorem{Proposition}{命题}
\newtheorem{Lemma}{引理}
\newtheorem{Theorem}{定理}
\newtheorem{Example}{例}
\newtheorem{Problem}{问题}
\newtheorem{Corollary}{推论}
\newtheorem{Remark}{注}
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
  breaklines=true, %自动断行
  showstringspaces=false, %取消特别的字符间距
  framexleftmargin=5pt, %内部左边距
  frame=trbl, %显示各方向的代码框线条
  frameround=tttt, %设置代码框各棱角的形状
  keywordstyle=\color{keywordincode}, %关键字样式
  stringstyle=\color{stringincode}, %字符串样式
  commentstyle=\color{commentincode}, %注释样式
}
% ======================================== %


% --------------- 伪代码 --------------- %
\RequirePackage[ruled,lined]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
% ======================================== %


% --------------- 标题样式：章、节、条、款、项 --------------- %
\RequirePackage{titlesec}
% ======================================== %


% --------------- 图、表标题样式 --------------- %
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{doublespace}{~~}
\captionsetup{font=small, labelsep=doublespace, labelfont=bf, textfont=bf}
\RequirePackage[labelformat=brace]{subcaption} %(与 subfigure 宏包冲突)也能提供 subfigure 环境（需设置宽度），并使环境中的标题变成副标题样式
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
\RequirePackage[numbers,square,comma,sort&compress]{natbib}
\RequirePackage{gbt7714}
\setlength{\bibsep}{0ex}
\bibliographystyle{gbt7714-numerical}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}} % 上标形式的引用
% ======================================== %


% --------------- 附录与自定义附录 --------------- %
\RequirePackage{appendix} %设置附录样式
% ======================================== %


% ------------------------- 关于论文信息的全局变量导入 ------------------------- %
\RequirePackage{ifthen} %【引入条件判断逻辑】
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


% ------------------------- 封面页的设置 ------------------------- %
%% 摘要页（2024--）
\fancyheadwidth[C][T]{13em}
\fancyheadwidth[L][T]{9em}
\fancyheadwidth[R][T]{9em}
\fancypagestyle{AbstractPageStyle}{
  \fancyhf{} %将原有页眉内容清除
  \fancyfoot[C]{\thepage}
  \fancyhead[C]{%
  \centering\bfseries\zihao{-4} \number\year\\[3pt]
  辽宁省大学生数学建模竞赛\\[3pt]
  摘要页\vspace{3pt}
  }
  \fancyhead[L]{%
  \centering\bfseries {\zihao{-4}选择的题号}\\[3pt]
  {\Large \lnumcmthesis@tokens@tihao}
  }
  \fancyhead[R]{%
  \centering\bfseries {\zihao{-4}校内编号}\\[3pt]
  {\Large \lnumcmthesis@tokens@bianhao}
  }
  \renewcommand{\headrulewidth}{1pt}
}
  
\setlength{\headheight}{46pt} % 编译器给的推荐长度；不能放进fancypagestyle中


%% 经典版蓝字封面页
% \newcommand{\makecoverpage}{
%   \thispagestyle{empty} %【无页眉页脚】

% ~\vspace{1ex}

% \begin{flushright}
% {\selectfont\fontsize{22}{0pt}\bf 封面}
% \end{flushright}{}\vspace{44pt}

% \begin{center}
% {\selectfont\fontsize{22}{0pt}\bf\lnumcmthesis@tokens@yearinput 年辽宁省大学生数学建模论文}
% \end{center}{}\vspace{42.0pt}

% \begin{table}[H]
%     \renewcommand\arraystretch{1.5}
%     \centering
%     \arrayrulecolor{coverblue}
%     \begin{tabular}[lc]
%       {
%       >{\fontsize{10.5pt}{0pt}\selectfont}m{7.5cm}
%       >{\centering\arraybackslash\fontsize{10.5pt}{0pt}\selectfont} m{5.5cm}
%       }
%       {\bf\color{coverblue}参赛学校(完整的学校全称，不含院系名)：} & {\bf\lnumcmthesis@tokens@school} \\
%       \hline\vspace{21.0pt}
%       {\bf\color{coverblue}参赛题号(从A/B/C中选择一项填写)：} & {\bf\lnumcmthesis@tokens@tihao} \\
%       \hline\vspace{21.0pt}
%       {\bf\color{coverblue}校内编号(与报名表上序号一致)：} & {\bf\lnumcmthesis@tokens@bianhao} \\
%       \hline\vspace{21.0pt}
%       {\bf\color{coverblue}队员姓名(打印并签名)：1、} & {\bf\lnumcmthesis@tokens@membera} \\
%       \hline\vspace{21.0pt}
%       \hspace{111.5pt} {\bf\color{coverblue}2、} & {\bf\lnumcmthesis@tokens@memberb} \\
%       \hline\vspace{21.0pt}
%       \hspace{111.5pt} {\bf\color{coverblue}3、} & {\bf\lnumcmthesis@tokens@memberc} \\
%       \hline\vspace{21.0pt}
%       {\bf\color{coverblue}指导教师或指导教师组负责人(打印并签名)：} & {\bf\lnumcmthesis@tokens@supervisor} \\
%       \hline
%       \multicolumn{2}{c}{{\color{coverblue}\kaishu（指导教师签名意味着对参赛队的行为和论文的真实性负责）}}
%     \end{tabular}
% \end{table}{}\vspace{31.5pt}

% \begin{flushright}
% {\zihao{-4}\underline{\quad\lnumcmthesis@tokens@yearinput\quad}年\underline{\quad\lnumcmthesis@tokens@monthinput\quad}月\underline{\quad\lnumcmthesis@tokens@dayinput\quad}日}
% \end{flushright}
% \arrayrulecolor{black} %使封面页之后的表格线颜色恢复正常
% \newpage
% } %【\newcommand{\makecoverpage}】
% ================================================================================ %


% --------------- 对sty,cls的命令的定制 --------------- %
\RequirePackage{etoolbox}

\AtBeginDocument{
\pagestyle{plain} %除摘要页以外的页眉页脚样式
  %% ----- 正文行距 ----- %
  % 关键系数k(基础行距换算系数)：1.296875/1.2
  % 实际的伸缩因子：
  % 1.2倍行距: 1.2*k =[approximately]= 1.297
  \linespread{1.297}\selectfont
}

%% ---------- 摘要专用页的样式&内容 ---------- %
\AddToHook{env/abstract/before}{
\thispagestyle{AbstractPageStyle}
\begin{center}
\bfseries\zihao{3}\ttleinMAINBODY
\end{center}
}
%% ======================================== %

%% ---------- 正文的样式细节调整 ---------- %
\newcommand{\setupOFmainbody}{
  \setlength{\headheight}{1ex}
  \addtolength{\footskip}{1cm}
}
%% ======================================== %

\AddToHook{env/thebibliography/before}{
  \phantomsection
  \addcontentsline{toc}{section}{参考文献}
}

%% ------- 设置附录样式 --------- %
\AddToHook{env/appendices/begin}[style_in_appendix]{
  \ctexset{
    section = {
      format = {\bfseries},
      name = {附录~,},
      number = {\arabic{section}},
      aftername = {\hspace{1em}},
      beforeskip=0.5ex,
      afterskip=0.5ex,
    }
  }
  \zihao{5}
}
\AddToHook{env/appendices/after}{
  \RemoveFromHook{env/appendices/begin}[style_in_appendix]
}
%% ======================================== %

% ======================================== %


% --------------- 超链接与交叉引用 --------------- %
\RequirePackage[hidelinks, bookmarksnumbered=true, bookmarksopen=true, breaklinks=true]{hyperref} %参数bookmarksnumbered使得PDF书签自带编号
% ======================================== %
