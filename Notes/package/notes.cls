\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2020/11/01 notes class]

\LoadClass[a4paper,oneside]{book}
\RequirePackage{hyperref}
\RequirePackage[english]{babel}
\RequirePackage{geometry}
\geometry{margin=1.5in}
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	filecolor=magenta,      
	urlcolor=cyan,
}
%\RequirePackage[]{fncychap}
\RequirePackage{xpatch}
\RequirePackage{blindtext}
\RequirePackage{graphics}
\RequirePackage{xcolor}

\makeatletter
\def\thickhrulefill{\leavevmode\leaders \hrule height 1pt \hfill \kern \z@}
\def\@makechapterhead#1{%
  %\vspace*{60\p@}%
  {\parindent \z@ \centering
          {\color{black}
            \scshape \Large \textbf{\@chapapp{} \thechapter} 
		  }
		  \par\nobreak
		  \thickhrulefill
        \par\nobreak
        \interlinepenalty\@M
	{\Huge \bf #1 \par}
    \thickhrulefill
    %\par\nobreak
    \vskip 40\p@
  }}
\makeatother

\makeatletter
\xpatchcmd{\@makeschapterhead}{%
  \Huge \bfseries  #1\par\nobreak%
}{%
  \Huge \bfseries\centering #1\par\nobreak%
}{\typeout{Patched makeschapterhead}}{\typeout{patching of @makeschapterhead failed}}

\xpatchcmd{\@makechapterhead}{%
  \huge\bfseries \@chapapp\space \thechapter
}{%
  \huge\bfseries\centering \@chapapp\space \thechapter
}{\typeout{Patched @makechapterhead}}{\typeout{Patching of @makechapterhead failed}}

\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\def\@seccntformat#1{\@ifundefined{#1@cntformat}%
	{\csname the#1\endcsname\quad}%      default
	{\csname #1@cntformat\endcsname}}%   individual control
\newcommand{\section@cntformat}{\S\thesection\quad}
\newcommand{\subsection@cntformat}{\S\thesubsection\quad}
\newcommand{\subsubsection@cntformat}{\S\thesubsubsection\quad}
\makeatletter



