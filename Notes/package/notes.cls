\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2020/11/01 notes class]

\LoadClass[a4paper,oneside]{book}
\RequirePackage{hyperref}
\RequirePackage[total={5in, 9in}]{geometry}
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	filecolor=magenta,      
	urlcolor=cyan,
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\def\@seccntformat#1{\@ifundefined{#1@cntformat}%
	{\csname the#1\endcsname\quad}%      default
	{\csname #1@cntformat\endcsname}}%   individual control
\newcommand{\section@cntformat}{\S\thesection\quad}
\newcommand{\subsection@cntformat}{\S\thesubsection\quad}
\newcommand{\subsubsection@cntformat}{\S\thesubsubsection\quad}
\makeatletter



