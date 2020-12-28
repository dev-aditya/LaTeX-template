\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2020/11/01 notes class]
\LoadClass[a4paper,oneside]{book}

\RequirePackage[
backend=biber,
style=numeric,
citestyle=numeric-comp ,
sorting=none 
]{biblatex}
\RequirePackage{csquotes}
\RequirePackage{graphicx} %% for inserting images
\RequirePackage{graphics, float} %% for forcing the image to be at the same place as defined
\RequirePackage{wrapfig} %% for wrapping it around text
\RequirePackage{hyperref}
\RequirePackage{lmodern}
\RequirePackage[english]{babel}
\RequirePackage{geometry}
\geometry{margin=1.5in}
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	filecolor=magenta,      
	urlcolor=cyan,
}

\RequirePackage{fancyhdr}  %% fancy footnotes and headers
\RequirePackage{fourier-orns}
\renewcommand{\footnoterule}{\vspace{-0.5em}\noindent\textcolor{darkgray}{\floweroneright ~ \raisebox{2.9pt}{\line(1,0){100}} \leafNE} \vspace{.5em} }

\RequirePackage{xpatch}
\RequirePackage{blindtext}
\RequirePackage{xcolor}

\makeatletter
\def\thickhrulefill{\leavevmode\leaders \hrule height 1pt \hfill \kern \z@}
\def\@makechapterhead#1{%
  %\vspace*{60\p@}%
  {\parindent \z@ \centering
          {\color{black}
            \scshape \Large \textsc{\textbf{\@chapapp{} \thechapter}} 
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
%\setlength{\parskip}{1.3ex plus 0.2ex minus 0.2ex}  %change default length b/w paragrapg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\def\@seccntformat#1{\@ifundefined{#1@cntformat}%
	{\csname the#1\endcsname\quad}%      default
	{\csname #1@cntformat\endcsname}}%   individual control
\newcommand{\section@cntformat}{\S\thesection\quad}
\newcommand{\subsection@cntformat}{\S\thesubsection\quad}
\newcommand{\subsubsection@cntformat}{\S\thesubsubsection\quad}
\makeatletter



