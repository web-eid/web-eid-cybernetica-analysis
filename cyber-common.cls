% cyber-common.cls
% Common macro and design for the official documents of the Cybernetica AS

% Class definition
\ProvidesClass{cyber-common}

% Class options for handling documents in different languages
\newcommand{\@CyberStringConfidential}{Konfidentsiaalne}
\newcommand{\@CyberStringDate}{Kuup\"aev:}
\newcommand{\@CyberStringDocumentType}{Tehniline dokument}
\newcommand{\@CyberStringVersion}{Versioon}
\newcommand{\@CyberStringPages}{lk}
\newcommand{\@CyberStringDocument}{Dok}
\newcommand{\@CyberStringBackofTitlePage}{\copyright\ Cybernetica AS, \the\year}
\newcommand{\@CyberStringCopyrightFooter}{\copyright\ Cybernetica AS, \the\year}

\DeclareOption{et-lang}{%
	\renewcommand{\@CyberStringConfidential}{Konfidentsiaalne}%
	\renewcommand{\@CyberStringDate}{Kuup\"aev:}%
	\renewcommand{\@CyberStringDocumentType}{Tehniline dokument}%
	\renewcommand{\@CyberStringVersion}{Versioon}%
	\renewcommand{\@CyberStringPages}{lk}%
	\renewcommand{\@CyberStringDocument}{Dok}%
}
\DeclareOption{en-lang}{%
	\renewcommand{\@CyberStringConfidential}{Confidential}%
	\renewcommand{\@CyberStringDate}{Date:}%
	\renewcommand{\@CyberStringDocumentType}{Technical document}%
	\renewcommand{\@CyberStringVersion}{Version}%
	\renewcommand{\@CyberStringPages}{pages}%
	\renewcommand{\@CyberStringDocument}{Doc.}%
}

% Class option "rdf-logo" for including EU logo in the title page
\newcommand{\@CyberRDFLogo}{}
\global\let\@CyberRDFLogo\@empty
\DeclareOption{rdf-logo}{%
	\renewcommand{\@CyberRDFLogo}{EL_Regionaalareng_horisontaal}%
}

\ProcessOptions\relax


% Base class, which we will modify
\LoadClass[a4paper, twoside, 12pt, article]{memoir}

% Make the figure and table captions separated by full stops rather than colons.
\usepackage{caption}
\captionsetup[table]{labelsep=period}
\captionsetup[figure]{labelsep=period}

% margins
\usepackage[top=1in,bottom=1in,left=1in,right=1in,pdftex]{geometry}

% For figuring out, how many pages there is in the document
\usepackage{lastpage}

% We want to do later MakeUppercase for the section heads and when \label{} is included in the section head, then it will break everything.
% Textcase package provides more intelligent MakeUppercase command
\usepackage[overload]{textcase}

% utf8 fileformat
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
% Times New Roman font for body text
% txtext was here, but it is deprecated and conflicting with amsmath
\usepackage{newtxtext}
% Arial font for section headlines. The font can be installed
% with ftp://tug.org/tex/getnonfreefonts/install-getnonfreefonts utility
%\usepackage[scaled]{uarial}
\renewcommand*{\familydefault}{\sfdefault}

\newcommand{\CyberArial}{\fontfamily{phv} \selectfont}

% Commands for setting the document type, number, version, etc.
\newcommand{\CyberDefineDocumentType}[1]{\def\@CyberStringDocumentType{#1}}
\newcommand{\CyberDefineDocumentNumber}[1]{\def\@CyberDocumentNumber{#1}}
\newcommand{\CyberDefineDocumentVersion}[1]{\def\@CyberDocumentVersion{#1}}
\newcommand{\CyberDefineDocumentSecurity}[1]{\renewcommand{\@CyberStringConfidential}{#1}}
\newcommand{\CyberDefineAcknowledgement}[1]{\def\@CyberAcknowledgement{#1}}
\newcommand{\CyberDefineCopyrightFooter}[1]{\renewcommand{\@CyberStringCopyrightFooter}{#1}}
\newcommand{\CyberDefineBackofTitlePage}[1]{\renewcommand{\@CyberStringBackofTitlePage}{#1}}

% .. and initialize them to empty
\CyberDefineDocumentNumber{}
\global\let\@CyberDocumentNumber\@empty
\CyberDefineDocumentVersion{}
\global\let\@CyberDocumentVersion\@empty
\CyberDefineAcknowledgement{}
\global\let\@CyberAcknowledgement\@empty

% Pagestyle with headers and footers
\setlength{\headwidth}{\textwidth}
\makepagestyle{CyberFancy}
\makerunningwidth{CyberFancy}{\headwidth}

% No indent of paragraphs
\setlength{\parindent}{0pt}
\setlength{\parskip}{1.5ex}

% TODO: Single command for this?
\makeoddhead{CyberFancy}{}{}{
	\CyberArial 	\tiny \@CyberStringConfidential}
\makeevenhead{CyberFancy}{}{}{
	\CyberArial \tiny \@CyberStringConfidential}

% Headers for recto and verso pages
%\makeoddhead{CyberFancy}{\CyberArial \scriptsize \@CyberDocumentNumber}{}{\CyberArial \scriptsize \@CyberStringVersion~\@CyberDocumentVersion}
%\makeevenhead{CyberFancy}{\CyberArial \scriptsize \@CyberStringVersion~\@CyberDocumentVersion}{}{\CyberArial \scriptsize \@CyberDocumentNumber}
%\makeheadrule{CyberFancy}{\headwidth}{\normalrulethickness}
% Separation between header and textblock
%\setlength{\headsep}{30pt}

% Footers for recto and verso pages
%\makeoddfoot{CyberFancy}{\CyberArial \scriptsize \@CyberStringCopyrightFooter}{}{\CyberArial \scriptsize \thepage\ / \pageref{LastPage}}
%\makeevenfoot{CyberFancy}{\CyberArial \scriptsize \thepage\ / \pageref{LastPage}}{}{\CyberArial \scriptsize \@CyberStringCopyrightFooter}

\makeoddfoot{CyberFancy}{
	\CyberArial
	{\tiny
		{\bfseries \hspace{-0.75em}\@title} \\
			\@date}}
	{}
	{
	\CyberArial
	{\tiny
		\@CyberDocumentVersion \\
		\thepage\ / \pageref{LastPage}}}
\makeevenfoot{CyberFancy}{
	\CyberArial
	{\tiny
		{\bfseries \hspace{-0.75em}\@title} \\
			\@date}}
	{}
	{
	\CyberArial
	{\tiny
		\@CyberDocumentVersion \\
		\thepage\ / \pageref{LastPage}}}

\makefootrule{CyberFancy}{\headwidth}{\normalrulethickness}{0pt}

% We have multiline headers, therefore less space is available
% for text.
\addtolength{\footskip}{2mm}

% Enforce pagestyle for pages with new chapters as well
\aliaspagestyle{chapter}{CyberFancy}

% Set the new style as the default
\pagestyle{CyberFancy}

% Titlepage style with headings
\makepagestyle{CyberTitle}
\makerunningwidth{CyberTitle}{\headwidth}
\makeoddhead{CyberTitle}{
	\begin{minipage}[t]{0.5\textwidth}
		\hspace{-7mm}
		\includegraphics[width=93mm]{cybernetica_logo.pdf}
	\end{minipage}
	}{}{
	\raisebox{2.5mm}{\CyberArial \scriptsize \bfseries \@CyberStringConfidential}
	}
%\makeoddfoot{CyberTitle}{\CyberArial \scriptsize Cybernetica AS}{\CyberArial \scriptsize M\"aealuse 2/1, 12618 Tallinn, ESTONIA}{\CyberArial \scriptsize \url{http://www.cyber.ee}}

% Chapter and section headline style

\renewcommand{\printchapternum}{\LARGE \bfseries \CyberArial \thechapter}
\renewcommand{\printchaptertitle}[1]{\LARGE \bfseries \CyberArial #1}
\setlength{\beforechapskip}{60pt}
\setlength{\afterchapskip}{40pt}

\let\stdchapter\chapter
\renewcommand\chapter{\clearpage\ \stdchapter}

\setsecheadstyle{\normalsize \bfseries \CyberArial}
\setsubsecheadstyle{\normalsize \bfseries \CyberArial}
\setsubsubsecheadstyle{\CyberArial}

\usepackage{graphicx}
% title page
\makeatletter
\renewcommand{\maketitle}{%
	\thispagestyle{CyberTitle}
	% \vspace{2cm}

	\begin{minipage}[t]{0.5\textwidth}
		%\vspace{-6.5mm}
		%\hfill
		\ifx\@CyberRDFLogo\@empty
			% Don't include the RDF logo
			\vspace{31mm} % Just empty space instead of logo.
		\else
			\vspace{1mm} % Otherwise it will overlap with Cybernetica's logo.
			\hspace{-10mm}
			\includegraphics[width=52mm]{EL_Regionaalareng_horisontaal.pdf}
		\fi
	\end{minipage}
	\vspace{4cm}
	\begin{flushleft}
		\CyberArial
		{\LARGE \bfseries \@title}
		\vfill
		{\Large \bfseries
			\@CyberStringDocumentType

			\ifx\@CyberDocumentVersion\@empty
				Dok. versiooninumber defineerimata. Kasuta CyberDefineDocumentVersion käsku või Cyber-Document-Version stiili.
			\else
				\@CyberStringVersion~\@CyberDocumentVersion
			\fi

			\@date

			\pageref{LastPage} \@CyberStringPages\\[1.5ex]

			\ifx\@CyberDocumentNumber\@empty
				Dok. hoidla ning järjenumber defineerimata. Kasuta CyberDefineDocumentNumber käsku või Cyber-Document-Number stiili.
			\else
				\@CyberStringDocument~\@CyberDocumentNumber
			\fi
		}\par
		\vspace{2cm}
		{\scriptsize \@CyberAcknowledgement}
	\end{flushleft}
	\pagebreak
%	\thispagestyle{empty}
%	\@CyberStringBackofTitlePage
%	\cleardoublepage
}
\makeatother

% Make dots appear in the table of contents also for chapters
\renewcommand{\cftchapterdotsep}{\cftdotsep}

% URL formating, URL breaking and linked entries in the PDF

\usepackage{url}
\usepackage{breakurl}
\usepackage[pdfborder={0 0 0}, pdftex, pdfpagelayout=TwoPageRight]{hyperref}
% hyperref and memoir is incompatible, this fixes the problems
\usepackage{memhfixc}

% make enumerate and itemize lists tighter
\firmlists
% and change the numbering for nested lists
\renewcommand{\labelenumi}{\arabic{enumi}.}
\renewcommand{\labelenumii}{\arabic{enumi}.\arabic{enumii}}
\renewcommand{\labelenumiii}{\arabic{enumi}.\arabic{enumii}.\arabic{enumiii}}
\renewcommand{\labelenumiv}{\arabic{enumi}.\arabic{enumii}.\arabic{enumiii}.\arabic{enumiii}.\arabic{enumiv}}
% make LaTeX observe right margins at all costs:
\sloppy
