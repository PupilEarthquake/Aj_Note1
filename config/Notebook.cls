\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Notebook}[2025A]

\LoadClass{book}

\RequirePackage{etoolbox}
\RequirePackage{fontspec}				% XeLaTeX
\RequirePackage[CJKchecksingle]{xeCJK}	% XeCJK
\RequirePackage{CJKnumb}				% 使用 CJK 数字

% 引入 AMS 宏包 + mathtools
\RequirePackage[intlimits]{amsmath}
\RequirePackage{amssymb}
\RequirePackage[centercolon]{mathtools}

\RequirePackage{hyperref}
\RequirePackage{tabularx}  % 支持自动换行的文本框
\RequirePackage{pdfpages}  % 支持直接引入 PDF 页面
\RequirePackage{emptypage}
\RequirePackage{tikz}  % 要求载入 TikZ
% \RequirePackafe{tikzcd}
% \usetikzlibrary{cd}
\RequirePackage{paralist}  % 载入 paralist 支持itemize 和 enumerate
\RequirePackage{float}  % 允许制定图片位置
\RequirePackage{graphicx}  % 允许插入图片
\RequirePackage{ulem} % 支持删除线

\RequirePackage[
    backend=bibtex,
    style=alphabetic,
    citestyle=authoryear
    ]{biblatex}  % 使用bib管理引用
\addbibresource{ref.bib}

\input{config/fontset.tex}  % 插入字体设置
\input{config/mycommand.sty}
\input{config/myarrow.tex}

\AtEndPreamble{
	\RequirePackage[thmmarks, amsmath, hyperref]{ntheorem}	% 设置定理环境所需
    \hypersetup{
			colorlinks = true,
			linkcolor = blue,
			citecolor = blue,
			urlcolor = teal}  % 设置链接颜色

    \RequirePackage{geometry}  % 设置版面
    \geometry{
		paper=b5paper,
		headheight=5ex,
		headsep=5ex,
		textwidth=132mm,
		textheight=198mm,
		twoside,
		bindingoffset=18pt,  % 设置装订偏移为18点。这是为了预留装订的空间，防止装订后文字被遮挡。
		asymmetric	% 单双数页不分
        }

    \RequirePackage{fancyhdr}  % 设置天眉
    \fancypagestyle{plain}{ % 使空页恒空
		\fancyhead{}
		\renewcommand{\headrulewidth}{0pt}
	}
    \pagestyle{fancy}
    \renewcommand{\headrulewidth}{0pt}	% 天眉暂不加横线
	\renewcommand{\footrulewidth}{0pt}
	% \addtolength{\headheight}{0.5pt}
    % \renewcommand{\chaptermark}[1]{\markboth{
	% 		第\CJKnumber{\thechapter}章\quad #1
	% 		}{}}  % 设置页眉CHAPTER样式

    % \renewcommand{\sectionmark}[1]{\markright{\S\arabic{chapter}.\arabic{section} \quad #1}}  % 设置页眉SECTION样式

    \fancyhf{} % 先清空
	\fancyhead[EC]{\footnotesize{\leftmark}\vspace{1mm}}
	\fancyhead[OC]{\footnotesize{\rightmark}\vspace{1mm}}
	\fancyhead[LE,RO]{{\footnotesize \thepage}\vspace{1mm}} %
	\fancyhead[RE,LO]{}

    % 这段代码是在LaTeX中使用`fancyhdr`包来自定义页眉和页脚的样式。具体来说：

    % - `\pagestyle{fancy}`：这行代码设置页面样式为`fancy`，这是`fancyhdr`包提供的`一种页面样式，允许你自定义页眉和页脚。

    % - `\renewcommand{\headrulewidth}{0pt}`和`\renewcommand{\footrulewidth}{0pt}`：这两行代码将页眉和页脚下的横线的宽度设置为0，也就是说，页眉和页脚下不会有横线。

    % - `\addtolength{\headheight}{0.5pt}`：这行代码将页眉的高度增加0.5点。

    % - `\fancyhf{}`：这行代码清空页眉和页脚的内容。

    % - `\fancyhead[EC]{\CJKfamily{hei2}\footnotesize{\leftmark}\vspace{1mm}}`和`\fancyhead[OC]{\CJKfamily{hei2}\footnotesize{\rightmark}\vspace{1mm}}`：这两行代码设置了偶数页中央（EC）和奇数页中央（OC）的页眉内容。`\CJKfamily{hei2}`设置字体为黑体，`\footnotesize`设置字体大小为脚注大小，`\leftmark`和`\rightmark`分别代表左标记和右标记，通常用于显示章节名。

    % - `\fancyhead[LE,RO]{{\footnotesize \thepage}\vspace{1mm}}`：这行代码设置了偶数页左侧（LE）和奇数页右侧（RO）的页眉内容为页码。

    % - `\fancyhead[RE,LO]{}`：这行代码清空了偶数页右侧（RE）和奇数页左侧（LO）的页眉内容。
}


\AtBeginDocument{
    \renewcommand{\Re}{\operatorname{Re}}
	\renewcommand{\Im}{\operatorname{Im}}
	\renewcommand{\emptyset}{\ensuremath{\varnothing}}  % c重置空集

    \newtheorem{theorem}{Theorem}[section] % 按section编号
    \newtheorem{corollary}[theorem]{Corollary}
    \newtheorem{lemma}[theorem]{Lemma}
    \newtheorem{proposition}[theorem]{Proposition}
    \newtheorem{definition}[theorem]{Definition}
    \newtheorem{hypothesis}[theorem]{Hypothesis}
    \newtheorem{example}[theorem]{Example}

    \theorembodyfont{}
    \theoremstyle{nonumberplain}
    \theoremheaderfont{}
    \theoremseparator{\enspace}
    \theoremsymbol{$\ensuremath{\square}$}
    \newtheorem{proof}{\textit{Proof.}}
}


\AtEndDocument{
}
