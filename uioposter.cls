%% Base Implemented by Martin Helsø (martibhe@math.uio.no)
%% Version: 23-09-2019

%% Agile Cards roadmap design implemented by Hariz Hasecic (Hariz@KTH.se)
%% Version: 2020


\NeedsTeXFormat{LaTeX2e}


\ProvidesClass{uioposter}

\DeclareOption{english}{\def\uioposter@lang{english}}
\DeclareOption{norsk}
{
    \def\uioposter@lang{norsk}
    \pretolerance = 2000
    \tolerance    = 6000
    \hbadness     = 6000
}


\DeclareOption{portrait}
{
    \PassOptionsToPackage{orientation = portrait}{beamerposter}
    \def\uioposter@orientation{}
}
\DeclareOption{landscape}
{
    \PassOptionsToPackage{orientation = landscape}{beamerposter}
    \def\uioposter@orientation{landscape}
}


\DeclareOption{a0paper}{\def\uioposter@size{a0paper}}
\DeclareOption{a1paper}{\def\uioposter@size{a1paper}}
\DeclareOption{a2paper}{\def\uioposter@size{a2paper}}
\DeclareOption{a3paper}{\def\uioposter@size{a3paper}}
\DeclareOption{a4paper}{\def\uioposter@size{a4paper}}
\DeclareOption{a5paper}{\def\uioposter@size{a5paper}}
\DeclareOption{a6paper}{\def\uioposter@size{a6paper}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}


\ExecuteOptions{a0paper}
\ExecuteOptions{english}
\ExecuteOptions{portrait}
\ProcessOptions
\relax


\LoadClass[t]{beamer}


\RequirePackage[size = a0, scale = 1.5]{beamerposter}
%\RequirePackage{etoolbox}
\RequirePackage{pgfpages}
\RequirePackage[utf8]{inputenx}
\RequirePackage[T1]{fontenc}
\RequirePackage{calc}
\RequirePackage[final]{microtype}
\RequirePackage{lmodern}
\RequirePackage[scaled]{beramono}

%Added
\RequirePackage{wiki} %Funkar inte än (För enkel markup i boxes)
\RequirePackage{hyperref}
\RequirePackage{etex} 
\RequirePackage{minted}
\RequirePackage{attachfile} %Om man vill bädda in andra filer
\RequirePackage{xcolor}
\RequirePackage{vwcol}
\RequirePackage{fancyvrb}
\RequirePackage{verbatim}
\RequirePackage{ragged2e} %Justifierar text i beamr frames

\usemintedstyle{monokai}
\RequirePackage{etoolbox,ltxcmds}

\definecolor{LightGray}{gray}{0.9}

\setminted[csharp]{frame=lines,framesep=2mm,baselinestretch=1.2,bgcolor=uioblack,linenos,numberblanklines=false,autogobble=true}


%\newminted{csharp}{frame=lines,framesep=2mm,baselinestretch=1.2,bgcolor=black,linenos,numberblanklines=false,stripnl=true}


\RequirePackage{catchfilebetweentags} % Fångar delar av andra dokument (Och visar upp dom i detta dokument
\newtoks\temptoken


\hypersetup{colorlinks,
            urlcolor  = uiolink,
            linkcolor =,
            citecolor =,
            filecolor =}
\renewcommand{\sfdefault}{phv}
\DeclareFontShape{OMX}{cmex}{m}{n}
{
    <-7.5>    cmex7
    <7.5-8.5> cmex8
    <8.5-9.5> cmex9
    <9.5->    cmex10
}{}
\SetSymbolFont{largesymbols}{normal}{OMX}{cmex}{m}{n}
\SetSymbolFont{largesymbols}{bold}  {OMX}{cmex}{m}{n}
\setlength{\marginparwidth}{2cm}
\setlength{\emergencystretch}{1em}
\frenchspacing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usefonttheme{serif}
\useinnertheme{rectangles}
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{caption}[numbered]
\setbeamertemplate{caption label separator}{: }
\setbeamertemplate{qed symbol}{\(\blacksquare\)}
\setbeamertemplate{itemize items}{\color{itemize item.fg}\(\blacksquare\)}


\setlength{\labelsep}{3ex}
\setlength{\leftmargini}{18ex}
\setbeamersize{text margin left = 3cm, text margin right = 6cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{uiored}{cmyk}{0, 1, 1, 0}
\definecolor{uiowhite}{cmyk}{0, 0, 0, 0}
\definecolor{uioblack}{cmyk}{0, 0, 0, 1}
\definecolor{uioheader}{cmyk}{0, 0, 0, 0.6}
\definecolor{uiobackground}{cmyk}{0, 0, 0, 0.2}
\definecolor{uiolink}{HTML}{0B5A9D}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamercolor{structure}{fg = uioheader}
\setbeamercolor{alerted text}{fg = uiored}
\setbeamercolor{background canvas}{fg = uioblack, bg = uiobackground}
\setbeamercolor{headline}{fg = uiowhite, bg = uioblack}
\setbeamercolor{title in headline}{fg = uiored}
\setbeamercolor{author in headline}{fg = uiowhite}
\setbeamercolor{footline}{fg = uiowhite, bg = uioblack}


\setbeamercolor{block title}{fg = uiowhite, bg = structure}
\setbeamercolor{block title example}{fg = uiowhite, bg = uioblack}
\setbeamercolor{block title alerted}{fg = uiowhite, bg = uiored}


\setbeamercolor{block body} {fg = uioblack, bg = uiowhite}
\setbeamercolor{block body example} {fg = uioblack, bg = uiowhite}
\setbeamercolor{block body alerted} {fg = uioblack, bg = uiowhite}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defining various fontstyles:

\setbeamerfont{title in headline}{family = \sffamily,
                                  series = \bfseries,
                                  size   = \VeryHuge}
\setbeamerfont{author in headline}{family = \sffamily,
                                   series = \bfseries,
                                   size   = \Large}
\setbeamerfont{institute}{family = \sffamily,
                          series = \mdseries,
                          size   = \normalsize}


\setbeamerfont{block title}{family = \sffamily,
                            series = \bfseries,
                            size   = \large}
\setbeamerfont{block title alerted}{family = \sffamily,
                                    series = \bfseries,
                                    size   = \large}
\setbeamerfont{block title example}{family = \sffamily,
                                    series = \bfseries,
                                    size   = \large}


\setbeamerfont{block body}{family = \rmfamily,
                           series = \normalfont,
                           size   = \normalsize}
\setbeamerfont{block body example}{family = \rmfamily,
                                   series = \normalfont,
                                   size   = \normalsize}
\setbeamerfont{block body alerted}{family = \rmfamily,
                                   series = \normalfont,
                                   size   = \normalsize}


\setbeamerfont{item projected}{family = \sffamily,
                               series = \bfseries,
                               size   = \small}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamertemplate{headline}
{
    \begin{beamercolorbox}[wd = \paperwidth,
                           leftskip  = 3cm,
                           rightskip = 3cm plus 20cm]{headline}

        \usebeamerfont{title in headline}
        \usebeamercolor{title in headline}
        \color{fg}
        \vskip0ex
        \hskip-0.05ex
        \ExecuteMetaData[Summary]{title}
        \vskip1ex
        \usebeamerfont{author in headline}
        \usebeamercolor{author in headline}
        \color{fg}
        \hskip-0.05ex
        \ExecuteMetaData[Summary]{subtitle}
        \ifdefempty{\insertinstitute}{} %Om tom gör inget
                                        %Annars gör det nedan
        {
            \vskip1ex
            \usebeamerfont{institute}
            \def\beamer@andinst{\quad}
            \insertinstitute
        }                               %
        \vskip3cm
        
        \ExecuteMetaData[Summary]{cutecode}

    \end{beamercolorbox}
    \vskip1cm
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamertemplate{block begin}
{
    \setbeamercolor{itemize item}  {fg = block title.bg}
    \setbeamercolor{item projected}{fg = block title.fg,
                                    bg = block title.bg}
    \setbeamercolor{description item}{fg = structure}

    \begin{beamercolorbox}[ht        = 3.2 ex,
                           dp        = 1.3 ex,
                           leftskip  = 2 ex,
                           rightskip = 2 ex]
                          {block title}

        \usebeamerfont*{block title}
        \insertblocktitle
        
    \end{beamercolorbox}

    \nointerlineskip

    \begin{beamercolorbox}[dp        = 2 ex,
                           leftskip  = 2 ex,
                           rightskip = 2 ex,
                           vmode]
                          {block body}

        \usebeamerfont{block body}
        \vskip2ex
        \begin{minipage}{\textwidth-4ex}
             \setlength{\parskip}{1.5ex}
             \setlength{\abovecaptionskip}{1ex}
             
}


\setbeamertemplate{block end}
{
            
        \end{minipage}
    \vskip0.2ex
    \end{beamercolorbox}
    \vskip3cm
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% TESTAR HELT NY BLOCK DESIGN &&&&&&&&&

\setbeamertemplate{block code begin}
{
    \setbeamercolor{itemize item}  {fg = block title.bg}
    \setbeamercolor{item projected}{fg = block title.fg,
                                    bg = block title.bg}
    \setbeamercolor{description item}{fg = structure}

    \begin{beamercolorbox}[ht        = 3.2 ex,
                           dp        = 1.3 ex,
                           leftskip  = 2 ex,
                           rightskip = 2 ex]
                          {block title}

        \usebeamerfont*{block title}
        \insertblocktitle
        
    \end{beamercolorbox}

    \nointerlineskip

    \begin{beamercolorbox}[dp        = 2 ex,
                           leftskip  = 2 ex,
                           rightskip = 2 ex,
                           vmode]
                          {block code body}

        \usebeamerfont{block body}
        \vskip2ex
        \begin{minipage}{\textwidth-4ex}
             \setlength{\parskip}{1.5ex}
             \setlength{\abovecaptionskip}{1ex}
}


\setbeamertemplate{block code end}
{
        \end{minipage}
    \vskip0.2ex
    \end{beamercolorbox}
    \vskip3cm
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamertemplate{block example begin}
{
    \setbeamercolor{itemize item}  {fg = block title example.bg}
    \setbeamercolor{item projected}{fg = block title example.fg,
                                    bg = block title example.bg}
    \setbeamercolor{description item}{fg = structure}

    \begin{beamercolorbox}[ht        = 3.2 ex,
                           dp        = 1.3 ex,
                           leftskip  = 2 ex,
                           rightskip = 2 ex]
                          {block title example}

        \usebeamerfont*{block title example}
        \insertblocktitle

    \end{beamercolorbox}

    \nointerlineskip

    \begin{beamercolorbox}[dp        = 2 ex,
                           leftskip  = 2 ex,
                           rightskip = 2 ex,
                           vmode]
                          {block body example}

        \usebeamerfont{block example body}
        \vskip2ex
        

        \begin{minipage}{\textwidth-4ex}
             \setlength{\parskip}{1.5ex}
             \setlength{\abovecaptionskip}{1ex}
}


\setbeamertemplate{block example end}
{
        \end{minipage}
    \vskip0.2ex
    \end{beamercolorbox}
    \vskip3cm
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamertemplate{block alerted begin}
{
    \setbeamercolor{itemize item}  {fg = block title alerted.bg}
    \setbeamercolor{item projected}{fg = block title alerted.fg,
                                    bg = block title alerted.bg}
    \setbeamercolor{description item}{fg = structure}

    \begin{beamercolorbox}[ht        = 3.2 ex,
                           dp        = 1.3 ex,
                           leftskip  = 2 ex,
                           rightskip = 2 ex]
                          {block title alerted}

        \usebeamerfont*{block title alerted}
        \insertblocktitle

    \end{beamercolorbox}

    \nointerlineskip

    \begin{beamercolorbox}[dp        = 2 ex,
                           leftskip  = 2 ex,
                           rightskip = 2 ex,
                           vmode]
                          {block body alerted}

        \usebeamerfont{block body alerted}
        \vskip2ex
        \begin{minipage}{\textwidth-4ex}
             \setlength{\parskip}{1.5ex}
             \setlength{\abovecaptionskip}{1ex}
}


\setbeamertemplate{block alerted end}
{
        \end{minipage}
    \vskip0.2ex
    \end{beamercolorbox}
    \vskip3cm
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\enumitem}[1]
{
    \leavevmode\unskip
    \hbox
    {%
        \usebeamerfont*{item projected}%
        \usebeamercolor[bg]{item projected}%
        \vrule width2.25ex height1.85ex depth.4ex%
        \hskip-2.25ex%
        \hbox to2.25ex
        {%
            \hfil%
            \color{fg}#1%
            \hfil
        }%
    }%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pgfpagesdeclarelayout{resize and center}
{
    \def\pgfpageoptionborder{0pt}
}
{
    \pgfpagesphysicalpageoptions
    {
        logical pages   = 1,
        physical height = \pgfpageoptionheight,
        physical width  = \pgfpageoptionwidth
    }
    \pgfpageslogicalpageoptions{1}
    {
        resized width  = \pgfphysicalwidth,
        resized height = \pgfphysicalheight,
        border shrink  = \pgfpageoptionborder,
        center         = \pgfpoint{.5\pgfphysicalwidth}{.5\pgfphysicalheight}
    }
}


\ifdefstring{\uioposter@size}{a0paper}{}
{
    \pgfpagesuselayout{resize and center}[\uioposter@size,
                                          \uioposter@orientation]
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setbeamertemplate{footline}
{

    \leavevmode
    \begin{beamercolorbox}[wd = \textwidth]{footline}
        %\color{fg}
        %\vskip0ex
        %\hskip-0.05ex
        %\inserttitle
        %\vskip1ex
        
        %\vskip1cm %Behövs ant inte
        \begin{columns}[onlytextwidth]
        
            \hskip3cm %Behövs ant inte
            \begin{column}{0.1\textwidth} % KOL1
            % \hskip1cm %Behövs ant inte
            
            \includegraphics[scale =1.5]{bilder/alpha-symbol.png}
            
            \end{column}
            
            \usebeamerfont{institute}

            \begin{column}{0.5\textwidth} %KOL 2
            \vskip1cm 
            Summary
            
            %\vskip2cm  
            \usebeamercolor{author in headline}
            \justifying %justifierar blocket fint
            \ExecuteMetaData[Summary]{summary}
            
            \end{column}
            
            \begin{column}{0.3\textwidth} %KOL 3
            \vskip1cm 

            %\justifying
            \ExecuteMetaData[Summary]{names}
            
                %\vskip1cm

            \end{column}
            
            \begin{column}{0.01\textwidth}
            \end{column}
            
        \end{columns}
        \vskip2cm
    \end{beamercolorbox}
}

%%%%%%%%%%%%%%%%
%Egna Tillägg

\newenvironment{code}[4][htp]
 {\VerbatimEnvironment
  \begin{figure}[#1]
  \centering
  \caption{#3}\label{#4}
  \begin{minted}[frame=lines]{#2}}
 {\end{minted}\end{figure}}

\newenvironment{redblock}[2]
{\begin{alertblock}{\stepcounter{BlockCounter}  \arabic{BlockCounter}| #1} #2}
{\end{alertblock}}

\newenvironment{blackblock}[2]
{\begin{exampleblock}{\stepcounter{BlockCounter}  \arabic{BlockCounter}| #1} #2}
{\end{exampleblock}}

\newenvironment{greyblock}[2]
{\begin{block}{ \stepcounter{BlockCounter}  \arabic{BlockCounter}| #1}#2}
{\end{block}}

%Räknar Roadmap N %
\newcounter{NumFiles}
%\setcounter{NumFiles}{-1} % fileName_0.pdf ... fileName_?.pdf
\newboolean{stop}
\whiledo{\NOT\boolean{stop}}{
  \stepcounter{NumFiles}
  \IfFileExists{./somefiles/OldRoadMaps/Roadmap\theNumFiles.pdf}{}{
    \setboolean{stop}{true}
  }
}

\newcommand{\green}[1]{\textcolor{green}{#1}}

\newcommand{\red}[1]{\textcolor{red}{#1}}

\def\done{[\green{\hspace{6mm} DONE \hspace{6mm}}]}
\def\waiting{[\red{WAITING}]}
\def\redovisad{[\green{REDOVISAD}]}
\def\ejredovisad{[\red{EJREDOVISAD}]}
\def\godkend{[\green{GODKÄND}]}


% in the document body:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput