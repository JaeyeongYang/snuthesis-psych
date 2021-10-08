%% This is file `snuthesis.cls`.
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This is an unofficial SNU LaTeX class.
%%
%% Author: zeta709 (zeta709@gmail.com)
%% https://github.com/zeta709/snuthesis
%%
%% 서울대 졸업논문 LaTeX template이다.
%% 석사, 박사 양식을 모두 지원하며, 학사는 전기공학부 양식을 지원한다.
%% 기본적으로 2011년에 만들고 그 이후엔 버그 수정만 한 것이라
%% 양식이 잘 맞을지 모르겠다.
%%
%% 사실 귀찮아서 글마당에 올라온 기존 template을 쓰려고 했으나,
%% 결정적으로 저자가 사용하려는 패키지와 기존 template 사이에
%% 너무 해결하기 어려운 충돌이 발생해서 이것을 만들게 되었다.
%% 그렇다고 무에서 시작한 것은 아니고
%% 학부 때 학부 전용으로 template을 만들어 둔 것에
%% 대학원 양식을 추가한 것이다.
%% (물론 그 과정에서는 기존 양식을 참고했다.)
%%
%% 기존 양식에는 사소한 버그가 있었다.
%% 페이지 번호가 이상하다거나, pdf 크기를 자동으로 안 잡아준다거나,
%% 양면 인쇄를 상대적으로 덜 고려했다거나하는 것 등이다.
%% 여기서는 기존 양식의 몇 가지 버그를 해결한 동시에
%% 원래는 잘 되던 것이 여기서는 안 될지도 모르겠다.
%%
%% 예전에 학부 양식을 만들 당시에는 jdj가 만든 학부 양식을 참고하였으나,
%% 사실상 대부분을 다시 작성하였던 것 같다.
%% 그리고 jdj가 KAIST 양식을 참고했다고 하여, 저자 역시
%% KAIST 양식도 참고했었다.
%% KAIST의 양식이 최초(?)의 국내 대학원 LaTeX 논문 양식이라
%% 다방면에 영향을 준 것일지도 모르겠다.
%%
%% 패키지 충돌에 당해본 관계로 이 양식은
%% 의존 패키지를 최소화하는 방향으로 만들었다.
%% 잘 되려나 모르겠다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options
%%
%% ko: 한글 논문을 작성한다.
%%
%% indentfirst: indentfirst 패키지를 사용한다.
%% noindentfirst: indentfirst 패키지를 사용하지 않는다.
%% 이것은 각 section의 첫 단락에서 들여쓰기를 할 지 말 지 결정하는 옵션이다.
%% 한글 논문에서는 사용하는 것이 기본이고,
%% 영문 논문에서는 사용하지 않는 것이 기본이다.
%%
%% easy: 편리한 설정을 위한 옵션이다.
%%
%% draft, final, leqno, fleqn, openright, openay,
%% openbib, oneside, twoside: report class에 전달한다.
%% 이 옵션들의 의미는 LaTeX 입문서에 설명되어 있다.
%%
%% nonfrench, finemath, strictcharcheck: kotex package에 전달한다.
%% 이 옵션들의 의미는 ko.TeX 사용 설명서에 설명되어 있다.
%%
%% under: 학사
%% ms, master: 석사
%% phd, doctor: 박사
%%
%% 4x6: 사륙배판을 사용한다. 석박사 양식에서만 사용가능하다.
%%      (188 mm x 258 mm)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 사용 환경
%% 
%% TeXLive를 추천한다.
%%
%% 의존성
%% 반드시 필요한 클래스와 패키지들은 다음과 같다.
%%
%% * report class
%% 기반 클래스이다.
%% * kotex package
%% 영어 논문을 써도 국문 초록을 넣어야 하므로 이 패키지가 필요하다.
%%
%% 그 외에 옵션에 따라 다른 패키지가 필요할 수 있다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 기타
%% 
%% @snu@ko와 같이 @을 넣는 것은 명령어를 내부 명령어로 사용하는 것이다.
%% 그리고 @snu를 넣은 것은 다른 패키지와 충돌할 가능성을 방지하기 위해서이다.
%% 
%% memoir나 oblivior 등의 클래스도 좋다고 생각하지만 호환성 등을 생각해서
%% report 클래스를 기반으로 하였다.
%%
%% 패키지를 수정할 때는 주석을 읽어보고 수정하는 것이 좋다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{snuthesis}
[2017/07/22 v0.99.4 unofficial SNU LaTeX class]

\newif\if@snu@under
\newif\if@snu@ms
\newif\if@snu@phd

\newif\if@snu@ko %% true이면 국문 논문.
\@snu@kofalse %% 기본값은 영문 논문.

\newif\if@snu@indentfirst %% true이면 section의 첫 단락도 들여쓴다.
\@snu@indentfirsttrue % 수정함 - 현진
\newif\if@snu@indentoptionset
\@snu@indentoptionsettrue % 수정함 - 현진

\newif\if@snu@easy %% easy 옵션. 이것저것 대신 해줌.
\@snu@easyfalse %% 기본값은 false.

\newif\if@snu@fsbp
\@snu@fsbpfalse

\DeclareOption{4x6}{\@snu@fsbptrue}

\DeclareOption{under}{\@snu@undertrue \@snu@msfalse \@snu@phdfalse}
\DeclareOption{ms}{\@snu@underfalse \@snu@mstrue \@snu@phdfalse}
\DeclareOption{master}{\@snu@underfalse \@snu@mstrue \@snu@phdfalse}
\DeclareOption{phd}{\@snu@underfalse \@snu@msfalse \@snu@phdtrue}
\DeclareOption{doctor}{\@snu@underfalse \@snu@msfalse \@snu@phdtrue}

\DeclareOption{ko}{\@snu@kotrue}
\DeclareOption{en}{\@snu@kofalse}
\DeclareOption{indentfirst}{\@snu@indentfirsttrue \@snu@indentoptionsettrue}
\DeclareOption{noindentfirst}{\@snu@indentfirstfalse \@snu@indentoptionsettrue}
\DeclareOption{easy}{\@snu@easytrue}

\DeclareOption{nonfrench}{\PassOptionsToClass{nonfrench}{kotex}}
\DeclareOption{finemath}{\PassOptionsToClass{finemath}{kotex}}
\DeclareOption{strictcharcheck}{\PassOptionsToClass{strictcharcheck}{kotex}}
%% hangul, nojosa, hanja 옵션은 의도적으로 제공하지 않음.

\ExecuteOptions{phd} % phd가 기본인 것은 박사에게 제공하는 작은 혜택?
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% "\if@snu@under"는 학부를 의미함.
%% "\if@snu@ko"는 한글 논문을 의미함. 

\newcommand{\@snu@koen}{%
    \if@snu@ko \expandafter\@firstoftwo
    \else \expandafter\@secondoftwo
    \fi
}
% Usage: \@snu@koen{한글}{English}

\newcommand{\@snu@msphd}{%
    \if@snu@ms \expandafter\@firstoftwo
    \else \expandafter\@secondoftwo
    \fi
}

\PassOptionsToClass{doc,11pt,biblatex}{apa7}
\LoadClass{apa7}

\RequirePackage{fancyhdr}
\fancyfoot{}
\rhead{}
\pagestyle{plain}

\if@snu@ko
    \PassOptionsToPackage{finemath,nonfrench}{kotex}
\fi
\RequirePackage{kotex} %% 국문 초록 때문에 필요하다.

\RequirePackage{sectsty}
\sectionfont{\clearpage\fontsize{16pt}{16pt}\selectfont\centering}
\subsectionfont{\fontsize{14pt}{14pt}\selectfont}

\PassOptionsToPackage{titles}{tocloft}
\RequirePackage{tocloft} % when you don't use subfigure package

\if@snu@ko
    \renewcommand\cftfigpresnum{그림~}
    \renewcommand\cfttabpresnum{표~}
\else
    \renewcommand\cftfigpresnum{Figure~}
    \renewcommand\cfttabpresnum{Table~}
\fi
\newlength{\mytmplen}
\settowidth{\mytmplen}{\bfseries\cftfigpresnum\cftfigaftersnum}
\addtolength{\cftfignumwidth}{\mytmplen}
\settowidth{\mytmplen}{\bfseries\cfttabpresnum\cfttabaftersnum}
\addtolength{\cfttabnumwidth}{\mytmplen}

\if@snu@ko
    \renewcommand{\figurename}{그림}
    \renewcommand{\tablename}{표}
    \renewcommand{\contentsname}{목차}
    \renewcommand{\listfigurename}{그림 목차}
    \renewcommand{\listtablename}{표 목차}
    \newcommand{\appendixnamelocal}{부록}
    \newcommand{\abstractnameko}{국문초록}
    \newcommand{\abstractnameen}{영문초록}
    \newcommand{\acknowledgementname}{감사의 글}
\else
    \newcommand{\appendixnamelocal}{Appendix}
    \newcommand{\abstractnameko}{Abstract in Korean}
    \newcommand{\abstractnameen}{Abstract}
    \newcommand{\acknowledgementname}{Acknowledgement}
\fi
\newcommand{\keywordnameen}{Keywords}
\newcommand{\keywordnameko}{주요어}
\newcommand{\studentnumbernameko}{학번}
\newcommand{\studentnumbernameen}{Student Number}

\RequirePackage{indentfirst}
% \if@snu@indentoptionset
%     \if@snu@indentfirst
% 	\RequirePackage{indentfirst}
%     \fi
% \else
%     \if@snu@ko
% 	\RequirePackage{indentfirst}
%     \fi
% \fi

\RequirePackage{ifpdf}

%% maketitle 명령 제거.
\let\oldmaketitle=\maketitle
\renewcommand\maketitle{}

%% 여백 설정.
%% a4paper : 210 mm X 297 mm
%% B5 (ISO) : 176 mm X 250 mm
%% B5 (JIS) : 182 mm X 257 mm
%% 4X6배판 : 188 mm X 258 mm
%% 학부 양식에서는 A4를 사용한다.
%% 대학원의 doc 양식은 B5 (JIS)를 쓰고 있다.
%% LaTeX의 b5paper는 ISO 규격으로 약간 작으므로,
%% 직접 고쳐준다.

\if@snu@under
    \setlength{\paperwidth}{210mm}
    \setlength{\paperheight}{297mm}
    \setlength{\textwidth}{160mm} %% 210 mm - (2.5 cm)*2
    \setlength{\textheight}{232mm} %% 297 mm - 3 cm - 3.5 cm
    % 좌우 여백 2.5 cm
    % 상단 여백 3 cm, 하단 여백 3.5 cm
\else
    \setlength{\paperwidth}{182mm}
    \setlength{\paperheight}{257mm}
    \setlength{\textwidth}{132mm} %% 182 mm - (2.5 cm)*2
    \setlength{\textheight}{192mm} %% 257 mm - 3 cm - 3.5 cm
    % 좌우 여백 2.5 cm
    % 상단 여백 3 cm, 하단 여백 3.5 cm
\fi
\setlength{\hoffset}{-1in}
\setlength{\voffset}{-1in}
\setlength{\topmargin}{30mm}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm} %% 헤더는 사용하지 않음.
\addtolength{\marginparwidth}{-1.2cm}
\setlength{\oddsidemargin}{25mm}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\footskip}{15mm} % 아래 page number 위치
\ifpdf
    \setlength{\pdfpagewidth}{\paperwidth}
    \setlength{\pdfpageheight}{\paperheight}
\fi


%% 줄간격
\linespread{1.7}
\let\@snu@oldfootnote=\footnote
\renewcommand{\footnote}[1]{\linespread{1.0}\@snu@oldfootnote{#1}}

%% \@onlypreamble 남용 금지.
%% \@onlypreamble을 남용하는 것은 좋지 않다.
%% 표지에는 영문 성명을 넣고
%% 인준지에는 한글 성명을 넣고 싶은 사람도 있을 것이고,
%% 양쪽 모두에 한글 성명을 사용하고 싶은 사람도 있을 것이다.
%% 그렇기 때문에 \authorko와 \authoren을 따로
%% 만드는 방법은 완전한 해결 방법이 될 수 없다.
%% 그래서 단순히 \author과 \author*만은 만들었다.
%% 여기서 *이 붙은 버전은 멋(?)을 내기 위한
%% 스페이스를 넣은 이름을 쓰기 위해서 사용한다.
%% 아무튼 \makefrontcover와 \makeapproval 사이에서
%% 이름을 바꾸는 것을 허용하면,
%% 영문 성명과 한글 성명을 섞어 쓰고 싶은 사람도
%% 배려할 수 있게 된다.

%% 제목
\let\@oldtitle=\title
\def\title{\@ifstar\@snu@title\@oldtitle}
\def\@snu@title#1{\gdef\@titlealt{#1}}
\def\@titlealt{\@latex@error{No \noexpand\title* given}\@ehc}
%\@onlypreamble{\title}

%% 학문 (단, 학사는 공학으로 고정)
\def\academicko#1{\gdef\@snu@academic@ko{#1}}
\def\@snu@academic@ko{공학}
\def\academicen#1{\gdef\@snu@academic@en{#1}}
\def\@snu@academic@en{Engineering}

%% 대학
\def\schoolko#1{\gdef\@snu@school@ko{#1}}
\def\schoolen#1{\gdef\@snu@school@en{#1}}
\def\schoolensub#1{\gdef\@snu@school@ensub{#1}} % 불필요?
\if@snu@under
    \def\@snu@school@ko{서울대학교 사회과학대학}
\else
    \def\@snu@school@ko{서울대학교 대학원}
\fi
\def\@snu@school@en{COLLEGE OF ENGINEERING}
\def\@snu@school@ensub{SEOUL NATIONAL UNIVERSITY}
%onlypreamble{\schoolko}
%onlypreamble{\schoolen}
%onlypreamble{\schoolensub}

%% 학부
\def\departmentko#1{\gdef\@snu@department@ko{#1}}
\def\departmenten#1{\gdef\@snu@department@en{#1}}
\def\@snu@department@ko{심리학과}
\def\@snu@department@en{DEPARTMENT OF PSYCHOLOGY}
%\@onlypreamble{\departmentko}
%\@onlypreamble{\departmenten}

%% 이름
% \let\@oldauthor=\author
\def\author{\@ifstar{\@snu@authoralt}{\@snu@author}}
\def\@snu@author#1{\gdef\@author{#1}}
\def\@author{\@latex@error{No \noexpand\author given}\@ehc}
\def\@snu@authoralt#1{\gdef\@authoralt{#1}}
\def\@authoralt{\@latex@error{No \noexpand\author* given}\@ehc}
% \@onlypreamble{\author}

%% 학번
\def\studentnumber#1{\gdef\@snu@studentnumber{#1}}
\def\@snu@studentnumber{\@latex@error{No \noexpand\studentnumber given}\@ehc}
%\@onlypreamble{\studentnumber}

%% 지도교수
\def\advisor{\@ifstar\@snu@advisoralt\@snu@advisor}
\def\@snu@advisoralt#1{\gdef\@advisoralt{#1}}
\def\@snu@advisor#1{\gdef\@advisor{#1}}
\def\@advisoralt{\@latex@error{No \noexpand\advisor* given}\@ehc}
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}
%\@onlypreamble{\advisor}

%% 학위 수여일 - 표자에 들어감
\def\graddate#1{\gdef\@snu@graddate{#1}}
\def\@snu@graddate{\@latex@error{No \noexpand\graddate given}\@ehc}
\def\graddateen#1{\gdef\@snu@graddateen{#1}}
\def\@snu@graddateen{\@latex@error{No \noexpand\graddateen given}\@ehc}
%\@onlypreamble{\graddate}

%% 논문 제출일 - 인준지에 들어감 (학사 제외)
\def\submissiondate#1{\gdef\@snu@submissiondate{#1}}
\def\@snu@submissiondate{\@latex@error{No \noexpand\submissiondate given}\@ehc}
%\@onlypreamble{\submissiondate}

%% 논문 인준일 - 인준지에 들어감
\def\approvaldate#1{\gdef\@snu@approvaldate{#1}}
\def\@snu@approvaldate{\@latex@error{No \noexpand\approvaldate given}\@ehc}
%\@onlypreamble{\approvaldate}

%% 위원장, 부위원장, 위원
\def\committeemembers#1#2#3#4#5{%
    \gdef\@snu@committeememberA{#1}
    \gdef\@snu@committeememberB{#2}
    \gdef\@snu@committeememberC{#3}
    \gdef\@snu@committeememberD{#4}
    \gdef\@snu@committeememberE{#5}
}
\def\@snu@committeememberA{}
\def\@snu@committeememberB{}
\def\@snu@committeememberC{}
\def\@snu@committeememberD{}
\def\@snu@committeememberE{}

%% 연락처
\def\phonenumber#1{\gdef\@snu@phonenumber{#1}}

%% 동의서 날짜
\def\agreementdate#1{\gdef\@snu@agreementdate{#1}}

%% Copied def. of \cleardoublepage from memoir.cls
\def\cleardoublepage{\clearpage\ifodd\c@page\else
   %\hbox{}\thispagestyle{cleared}%
  \hbox{}\thispagestyle{empty}%
  \newpage\if@twocolumn\hbox{}\newpage\fi\fi}

%% 표지
%% 표지 하단 여백은 3 cm (5 mm 작음)
%% 표지 좌우 여백은 2 cm (5 mm 작음)
%% 제목의 linespread 1.3
\newlength{\@snu@covertextheight}
\setlength{\@snu@covertextheight}{\textheight}
%\addtolength{\@snu@covertextheight}{5mm} % removed at version 0.99
\newcommand{\makefrontcover}{%
    %% 여백 재조정
    \cleardoublepage
    \addtolength{\textwidth}{10mm}
    \addtolength{\oddsidemargin}{-5mm}
    \addtolength{\evensidemargin}{-5mm}
    \if@twocolumn \@restonecoltrue
    \else \@restonecolfalse \fi
    \onecolumn
    \thispagestyle{empty}
    \noindent
    \parbox[][\@snu@covertextheight][s]{\textwidth}{%
        \centering
        \normalfont
        \linespread{1.3}\selectfont

        \if@snu@under % 학부
            \fontsize{16pt}{16pt}\selectfont
            심리학학사학위논문\\
            \vspace{2cm}\nointerlineskip
            \fontsize{21pt}{21pt}\selectfont
            \@title\\
            \vfill
            \fontsize{16pt}{16pt}\selectfont
            \@snu@koen{\@snu@graddate}{\@snu@graddateen}\\
            \vspace{4cm}\nointerlineskip
            \@snu@school@ko\\
            \vspace{1cm}\nointerlineskip
            \@snu@department@ko\\
            \vspace{1cm}\nointerlineskip
            \@author

        \else % 대학원
            \fontsize{14pt}{14pt}\selectfont
            \if@snu@ms
                \@snu@koen{\@snu@academic@ko석사학위논문}%
                {Master's Thesis of \@snu@academic@en}\\
                % \@snu@academic@ko석사 학위논문\\
            \else
                \@snu@koen{\@snu@academic@ko박사 학위논문}%
                {Ph.D. Dissertation of \@snu@academic@en}\\
                % \@snu@academic@ko박사 학위논문\\
            \fi

            % Title
            \vspace{2cm}\nointerlineskip
            \fontsize{22pt}{22pt}\selectfont
            \@title\\
            % Alternative title
            \vspace{1cm}\nointerlineskip
            \fontsize{16pt}{16pt}\selectfont
            \@titlealt\\
            \vfill
            % Graduation date
            \fontsize{14pt}{14pt}\selectfont
            \@snu@koen{\@snu@graddate}{\@snu@graddateen}\\
            \vspace{4cm}\nointerlineskip
            \if@snu@ko
                \fontsize{16pt}{16pt}\selectfont
                \@snu@school@ko\\
    
                \vspace{5mm}\nointerlineskip
                \fontsize{14pt}{16pt}\selectfont
                \@snu@department@ko\\
    
                \vspace{5mm}\nointerlineskip
                \fontsize{16pt}{16pt}\selectfont
                \@authoralt
            \else
                \fontsize{14pt}{14pt}\selectfont
                \@snu@department@en\\
                \@snu@school@en\\
                \@snu@school@ensub \\
            \fi
        \fi
    }
    %\end{minipage}
    %% 여백 원래대로
    \newpage
    \addtolength{\textwidth}{-10mm}
    \addtolength{\oddsidemargin}{5mm}
    \addtolength{\evensidemargin}{5mm}
    \if@restonecol \twocolumn \fi
%% 참고사항
%% center enviornment를 사용하면 하단 여백이 안 맞음.
%% 여백 설정이 조금만 어긋나면 페이지가 인쇄되지 않음.
%% minipage와 parbox 중 무엇이 더 나은지 테스트 중.
}

%% 인준지
%% 인준지 하단 여백 2 cm (15 mm 작음)
\newlength{\@snu@approvaltextheight}
\setlength{\@snu@approvaltextheight}{\textheight}
%\addtolength{\@snu@approvaltextheight}{15mm}
\addtolength{\@snu@approvaltextheight}{10mm} % modified at version 0.99
%% underline length
\newlength{\committeenameunderlinelength}
\setlength{\committeenameunderlinelength}{5cm}
\newlength{\@snu@underlinetmp}
\newlength{\@snu@underlinetmpb}
\newcommand{\committeestyle}[1]{%
    \setlength{\@snu@underlinetmp}{\committeenameunderlinelength}%
    \settowidth{\@snu@underlinetmpb}{#1}%
    \addtolength{\@snu@underlinetmp}{-\@snu@underlinetmpb}%
    \divide \@snu@underlinetmp by 2 %
    \underline{\hspace{\@snu@underlinetmp}#1\hspace{\@snu@underlinetmp}}%
}
%\newcommand{\@snu@nameline}{\underline{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}}
\newcommand{\makeapproval}{%
    \cleardoublepage
    \if@twocolumn \@restonecoltrue
    \else \@restonecolfalse \fi
    \onecolumn
    \enlargethispage{10mm} % modified at version 0.99
    \thispagestyle{empty}
    \noindent
    \parbox[][\@snu@approvaltextheight][s]{\textwidth}{%
        \centering
        \normalfont
        \linespread{1.3}\selectfont
        \if@snu@under % 학부
            \fontsize{22pt}{22pt}\selectfont
            \@title\\
            \vspace{1cm}\nointerlineskip
            \fontsize{16pt}{16pt}\selectfont
            지도교수~\@advisoralt\\
            \vspace{1cm}\nointerlineskip
            이~논문을~심리학학사~학위논문으로~제출함\\
            \@snu@submissiondate\\
            \vspace{5cm}\nointerlineskip
            \@snu@school@ko\\
            \vspace{1cm}\nointerlineskip
            \@snu@department@ko\\
            \vspace{0.5cm}\nointerlineskip
            \@authoralt\\
            \vfill
            {\@author}의~심리학학사~학위논문을~인준함\\
            \vspace{1cm}\nointerlineskip
            \@snu@approvaldate\\
            \vspace{1cm}\nointerlineskip
            \begin{tabular}[b]{ccl}
            지도교수 & \committeestyle{\@advisoralt} & (인) \\[.5em]
            \end{tabular}
        \else % 대학원
            \fontsize{\if@snu@ko 16pt \else 22pt \fi}{22pt}\selectfont
            \@title\\
            \vspace{1cm}\nointerlineskip
            \fontsize{16pt}{16pt}\selectfont
            \@titlealt\\
            \vspace{1cm}\nointerlineskip
            \fontsize{14pt}{14pt}\selectfont
            지도교수 \@advisoralt\\
            \vspace{5mm}\nointerlineskip
            \fontsize{16pt}{16pt}\selectfont
            이 논문을 %
            \@snu@academic@ko\@snu@msphd{석사}{박사} %
            학위논문으로 제출함\\
            \vspace{5mm}\nointerlineskip
            \fontsize{14pt}{14pt}\selectfont
            \@snu@submissiondate\\
            \vspace{1cm}\nointerlineskip
            \fontsize{16pt}{16pt}\selectfont
            \@snu@school@ko\\
            \vspace{5mm}\nointerlineskip
            \fontsize{14pt}{14pt}\selectfont
            \@snu@department@ko\\
            \vspace{5mm}\nointerlineskip
            \fontsize{16pt}{16pt}\selectfont
            \@authoralt\\
            \vspace{1cm}\nointerlineskip
            {\@author}의 %
            \@snu@academic@ko\@snu@msphd{석사}{박사} %
            학위논문을 인준함\\
            \vspace{5mm}\nointerlineskip
            \fontsize{14pt}{14pt}\selectfont
            \@snu@approvaldate\\
            \vfill
            \begin{tabular}[b]{ccl}
            위 \hfill 원 \hfill 장 & \committeestyle{\@snu@committeememberA} & (인) \\[.5em]
            부위원장               & \committeestyle{\@snu@committeememberB} & (인) \\[.5em]
            \if@snu@ms
            위 \hfill 원           & \committeestyle{\@snu@committeememberC} & (인) \\
            \else
            위 \hfill 원           & \committeestyle{\@snu@committeememberC} & (인) \\[.5em]
            위 \hfill 원           & \committeestyle{\@snu@committeememberD} & (인) \\[.5em]
            위 \hfill 원           & \committeestyle{\@snu@committeememberE} & (인) \\
            \fi
            \end{tabular}
        \fi
    }
%	\end{minipage}
    \newpage
    \if@restonecol \twocolumn \fi
%% 참고사항
%% center enviornment를 사용하면 하단 여백이 안 맞음.
%% 여백 설정이 조금만 어긋나면 페이지가 인쇄되지 않음.
%% minipage와 parbox 중 무엇이 더 나은지 테스트 중.
}


%% keyword
\newcommand{\@snu@keyworden}{}
\newcommand{\keyworden}[1]{\renewcommand{\@snu@keyworden}{#1}}

\def\phantomsection{}

%% abstract
\newenvironment{abstracten}{%
    \cleardoublepage
    \@afterindentfalse
    \phantomsection
    \addcontentsline{toc}{section}{\abstractnameen}
    {%
        \centering
        \normalfont
        \linespread{1.0}
        \fontsize{16pt}{16pt}\selectfont
        \textbf{\abstractnameen}\par\nobreak
    }
    \vspace{2cm}
    \@afterheading
}{%
    \vfill\vspace*{\fill}
    % better than "\vfill", "\null\vfill", \vspace*{0pt}\vfill", etc.
    \noindent
    {\bfseries \keywordnameen}:~\@snu@keyworden
    \if@snu@under\else
    \\
    \noindent
    {\bfseries \studentnumbernameen}:~\@snu@studentnumber
    \fi
    \newpage
}

%% keywordalt
\newcommand{\@snu@keywordko}{}
\newcommand{\keywordko}[1]{\renewcommand{\@snu@keywordko}{#1}}

%% abstractalt
\newenvironment{abstractko}%
{%
    \cleardoublepage
    \@afterindentfalse
    \phantomsection
    \addcontentsline{toc}{section}{\abstractnameko}
    {%
        \centering
        \normalfont
        \linespread{1.0}
        \fontsize{16pt}{16pt}\selectfont
        \textbf{\abstractnameko}\par\nobreak
    }
    \vspace{2cm}
    \@afterheading
}{%
    \vfill\vspace*{\fill}
    % better than "\vfill", "\null\vfill", \vspace*{0pt}\vfill", etc.
    \noindent
    {\bfseries \keywordnameko}:~\@snu@keywordko
    \if@snu@under\else
    \\
    \noindent
    {\bfseries \studentnumbernameko}:~\@snu@studentnumber
    \fi
      \newpage
}

%% 감사의 글
\newcommand{\acknowledgement}{%
    \cleardoublepage
    \@afterindentfalse
    \phantomsection
    \addcontentsline{toc}{section}{\acknowledgementname}
    {%
        \centering
        \normalfont
        \linespread{1.0}
        \fontsize{16pt}{16pt}\selectfont
        \textbf{\acknowledgementname}\par\nobreak
    }
    \vspace{2cm}
    \@afterheading
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 캡션 스타일
%% 캡션에서 colon(:)을 제거해야 한다.
%% report 클래스에서 베끼고 :만 지움.
%% 정렬은 알아서 됨.
%% TODO
%% caption의 마지막에 마침표가 있는지 체크
%% 표의 캡션에는 마침표가 없어야 하고
%% 그림의 캡션에는 있어야 함.
%% (반대던가??)

%\long\def\@makecaption#1#2{%
%  \vskip\abovecaptionskip
%  \sbox\@tempboxa{#1 #2}%
%  \ifdim \wd\@tempboxa >\hsize
%    #1 #2\par
%  \else
%    \global \@minipagefalse
%    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%  \fi
%  \vskip\belowcaptionskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% APA7 documentclass Appendix Section 스타일 변경

\renewcommand{\theappendix}{\@Alph\c@appendix}
\def\apaSevenappfig{%
    \renewcommand\thefigure{\theappendix\@arabic\c@figure}%
    \ifapamodeman{\renewcommand\thepostfig{\theappendix\arabic{postfig}}}{}}
\def\apaSevenapptab{%
    \renewcommand\thetable{\theappendix\@arabic\c@table}%
    \ifapamodeman{\renewcommand\theposttbl{\theappendix\arabic{posttbl}}}{}}
\def\apaSevenappeq{%
    \renewcommand\theequation{\theappendix\@arabic\c@equation}}
\newif\ifoneappendix
\oneappendixtrue % one appendix by default
\newif\ifappendix
\appendixfalse

\renewcommand{\appendix}{
    \ifapamodeman{\processdelayedfloats}{}%  BDB -- output all tables and figures prior to the appendix
    \appendixtrue
    \apaSevenappfig
    \apaSevenapptab
    \apaSevenappeq

    \let\old@apaSeven@section=\section
    \long\def\section##1{
        \makeatletter
            \def\@currentlabelname{##1}
        \makeatother
        \ifapamodeman{%
            \clearpage
            \setcounter{postfig}{0}
            \setcounter{posttbl}{0}
        }{}
        \setcounter{figure}{0}
        \setcounter{table}{0}
        \setcounter{equation}{0}
        \vskip2.5ex
        \refstepcounter{appendix}

        \ifnum\c@appendix>1\immediate\write\@auxout{\global\string\oneappendixfalse}\fi
        \old@apaSeven@section%
        [\appendixnamelocal\ifoneappendix\else~\textbf\theappendix\fi:~##1]% On TOC
        {\appendixnamelocal\ifoneappendix\else~\textbf\theappendix\fi\linebreak##1}
        \setlength{\parindent}{0.5in}
        \makeatletter
        \@afterindentfalse
        \@afterheading
        \makeatother
    }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% template과 직접적인 관련이 없는 설정으로 이것저것 대신 해준다.

\if@snu@easy
    % 이것은 KLDP에서 가져왔다.
    % http://faq.ktug.or.kr/faq/pdflatex%B0%FAlatex%B5%BF%BD%C3%BB%E7%BF%EB
    \ifpdf
        \input glyphtounicode\pdfgentounicode=1 %type 1 font사용시
        % \usepackage{dhucs-cmap} % true type 글꼴 사용시
        % \pdfmapfile{+unttf-pdftex-dhucs.map} % truetype글꼴사용시
        \usepackage[pdftex,unicode]{hyperref}
        \usepackage[pdftex]{graphicx}
        \usepackage[pdftex,svgnames]{xcolor}
    \else
        \usepackage[dvipdfmx,unicode]{hyperref}
        \usepackage[dvipdfmx]{graphicx}
        \usepackage[dvipdfmx,svgnames]{xcolor}
    \fi
    %KC2008의 공식예제인 first.tex와 ko.TEX v0.1.0 사용 설명서 참조
    %hangul-ucs 4.0 이전 버전에서는 dhucs-ucshyper라는 부가 패키지가 제공되었으나, 
    %hyperref의 기능 향상에 따라 불필요해졌으므로 
    %ko.TEX에서는 이를 제공하지 않는다.
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Author: zeta709 (zeta709@gmail.com)
%% https://github.com/zeta709/snuthesis
%%
%% # Version history
%% ## 2017
%% * 610a07b, 2017-07-22: 학문 이름을 매크로로 변경
%% * 01a6678, 2017-07-22: 클래스 이름 변경 (snueethesis.cls -> snuthesis.cls)
%% * 3066490, 2017-07-22: 대학과 학부 이름을 매크로로 변경
%% * 66b5ef0, 2017-07-20: 목차의 부록 이름 버그 수정
%% ## 2012
%% * 91fb8fa, 2012-02-27: 인준지와 동의서 약간 수정
%% * 4cde5a6, 2012-01-19: 표지와 인준지의 하단 여백을 5mm 늘림
%% * 75d2641, 2012-01-18: 동의서 양식 추가
%% ## 2011
%% * bd9e972, 2012-01-18: 4x6 옵션 추가
%% * cb304c2, 2011-12-14: 인준지 양식 수정
%% * 1e7a8b7, 2011-11-27: git에 커밋된 첫 버전
%% * 0000000, 2009-12-17: git을 사용하기 전 초기 버전
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 역사를 보존하는 의미에서 오래된 저작 정보를 남겨둔다.
%% 코드는 전부 뜯어 고쳐서 원래의 코드는 별로 남아 있지 않다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% jdj의 저작 정보는 다음과 같다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% SNU EE 학사 논문 서식
%% KAIST것을 복사해다 조금 고쳐서 만듦.
%% 구할 수 있는 유일한 것이 KAIST것이었기 때문.
%% KC2007에서 컴파일 되는 것을 확인함.
%% ... modified by jdj, to ko.tex
%% ... stripped down redundent codes
%% ... modified margins.
%%
%% @version		0.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% KAIST 템플릿의 저작 정보는 다음과 같다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% KAIST Thesis Template for LaTeX
%%
%% @version      0.4
%% @releasedate  Nov 12th, 2004
%%
%% @author       Chae, Seugbyung 채승병
%%               mailto:chess@kaist.ac.kr
%%
%% @requirements
%%    current distribution of teTeX, fpTeX, MikTeX
%%		+ Hangul-ucs 2.6.0 or higher
%%	  (please see http://faq.ktug.or.kr/faq/Hangul-ucs)
%%
%% Karnes Kim, converted to Hangul-ucs version.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%% End of file `snuthesis.cls`.
