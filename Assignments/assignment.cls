%MIT License

%Copyright (c) 2020 Jacob Strieb

%Permission is hereby granted, free of charge, to any person obtaining a copy
%of this software and associated documentation files (the "Software"), to deal
%in the Software without restriction, including without limitation the rights
%to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%copies of the Software, and to permit persons to whom the Software is
%furnished to do so, subject to the following conditions:

%The above copyright notice and this permission notice shall be included in all
%copies or substantial portions of the Software.

%THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%SOFTWARE.

%%%% From https://github.com/jstrieb/homework-template %%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[Assignment Class]

% Based off of the `article' class
\LoadClass[12pt]{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Package options and document metadata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xkeyval}

% Take key=val options from the \documentclass declaration
\DeclareOptionX{name}[]{\newcommand{\name}{#1}}
\DeclareOptionX{num}[]{\newcommand{\assignum}{#1}}
\DeclareOptionX{course}[]{\newcommand{\course}{#1}}
\DeclareOptionX{regnum}[]{\newcommand{\regnum}{#1}}
\DeclareOptionX{type}[Assignment]{\newcommand{\assignmenttype}{#1}}
\DeclareOptionX{emaildomain}[iisermohali.ac.in]{\newcommand{\emaildomain}{#1}}
\DeclareOptionX{probword}[Problem]{\newcommand{\probword}{#1}}

\ProcessOptionsX\relax

% Raise errors if any of the options are undefined
\@ifundefined{name}{ \ClassError{assignment}{name option required}{} }{}
\@ifundefined{assignum}{ \ClassError{assignment}{assignum option required}{} }{}
\@ifundefined{course}{ \ClassError{assignment}{course option required}{} }{}
\@ifundefined{regnum}{ \ClassError{assignment}{regnum option required}{} }{}

% Set default values if optional options are undefined
\@ifundefined{emaildomain}{ \newcommand{\emaildomain}{iisermohali.ac.in} }{}
\@ifundefined{assignmenttype}{ \newcommand{\assignmenttype}{Assignment} }{}
\@ifundefined{probword}{ \newcommand{\probword}{Problem} }{}

% Define commands depending on components passed as key/values or default options
\newcommand{\assignmentname}{\assignmenttype{} \assignum}
\newcommand{\email}{\regnum @\emaildomain}

% Fix line-breaking on hyphens in URLs. See:
% https://tex.stackexchange.com/a/183831/150811
% Note: must be included before hyperref package is used
\PassOptionsToPackage{hyphens}{url}

% Set PDF metadata based on the global variables
\RequirePackage[pdftex,
    pdfauthor={\name},
    pdftitle={\course{} -- \assignmentname}]{hyperref}

% Set the author and title in case the user wants to make a title page
\title{\course{} -- \assignmentname}
\author{\name}
\date{\regnum}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Imports and formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set the page on letter paper with microtype improvements and correct URL breaking at hyphens
\RequirePackage[letterpaper]{geometry}
\RequirePackage{microtype}
\RequirePackage{multicol}
\RequirePackage{url}

% Enable strikethrough text
\RequirePackage[normalem]{ulem}

% Fix issues with fonts when highlighting code via Pandoc
\RequirePackage[T1]{fontenc}

% Fix quotes in verbatim mode (particularly for Pandoc)
\RequirePackage{upquote}

% List formatting
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\setlist[itemize]{topsep=0pt}
% Copied from pandoc template via `pandoc.exe -D latex`
\providecommand{\tightlist}{\setlength{\parskip}{0pt}}

% Skip lines and don't indent
\setlength{\parindent}{0em}
\setlength{\parskip}{1em}

% Import math fonts and symbols
\RequirePackage{amsfonts}
\RequirePackage{amsmath,amsthm,amssymb}

% Palatino typeface -- includes (old-style) text figures
\RequirePackage[osf]{mathpazo}

% Set headers and page numbers
\RequirePackage{fancyhdr}

% Ensure page number typeface matches the body
% Note: must come before header declaration since it clears header and footer
\fancyhf{}
\fancyfoot[C]{\thepage}

\lhead{\name \\ \texttt{\email}}
\rhead{\today \\ \course{} -- \assignmentname}
\pagestyle{fancyplain}
\setlength{\headheight}{2\baselineskip} % Fix first page setting above the frame

% Format section headers for use in writing ``Problem X'' in small caps with appropriate spacing
\RequirePackage{titlesec}
\titleformat{\section}{\large\sc\lowercase}{}{0em}{}
\titlespacing{\section}{0em}{1em}{1em}

\titleformat{\subsection}{\normalsize\sc\lowercase}{}{0em}{}
\titlespacing{\subsection}{0em}{0em}{1em}

% Add spacing between footnote number and text
\RequirePackage[hang, bottom]{footmisc}
\setlength{\footnotemargin}{0.75em}

% Enable including embedded PDFs and images
\RequirePackage{graphicx}
\RequirePackage{pdfpages}

% Improve table formatting
\usepackage{longtable}
\usepackage{booktabs}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom commands -- words, environments, and formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Headers for numbered problems
\newcommand{\problem}[1]{\section{\probword{} #1}}

% Boxed ``to-do'' statements to make incomplete problems clear
\newcommand{\todo}{\fbox{TO-DO}\ \ }

% 75% measure rules to split problems into sections
\newcommand{\seprule}{\begin{center} \rule{0.75\linewidth}{0.5pt} \\ \end{center}}
\newcommand{\separator}{\vfill \seprule \vfill}

% Environment for consistently-formatted claim statements
\newenvironment{claim}{\textit{Claim.}}{\vspace{-1em}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom commands -- redefined commands that should look or behave differently
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Redefine the ampersand to use the italic version by default - as-per Elements of Typographic Style
% See: https://tex.stackexchange.com/a/47353/150811
\let\textand\&
\renewcommand{\&}{\textit{\textand}}

% Redefine the maketitle command to format properly, and not have a header on the page
\let\origtitle\maketitle
\renewcommand{\maketitle}{
    \setlength{\parskip}{0em}
    \origtitle
    \thispagestyle{empty}
    \setlength{\parskip}{1em}
}

% Redefine epsilon and empty set commands to use better-looking versions
\renewcommand{\epsilon}{\ensuremath{\varepsilon}}
\renewcommand{\emptyset}{\ensuremath{\varnothing}}
% \renewcommand{\phi}{\ensuremath{\varphi}}

% Redefine the bar and vec commands to use larger overlines and bold-faced vectors
\renewcommand{\bar}{\overline}
\renewcommand{\vec}{\mathbf}
\newcommand{\arrowvec}{\mathaccent"017E}


