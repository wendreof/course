Ò
OC:\Users\wendr\OneDrive\Documentos\course\course.api\Business\Entities\Curso.cs
	namespace 	
course
 
. 
api 
. 
Business 
. 
Entities &
{ 
public 

class 
Curso 
{ 
public 
int 
Codigo 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	Descricao 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
CodigoUsuario  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
virtual 
Usuario 
Usuario &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
}   
}!! º
QC:\Users\wendr\OneDrive\Documentos\course\course.api\Business\Entities\Usuario.cs
	namespace 	
course
 
. 
api 
. 
Business 
. 
Entities &
{ 
public 

class 
Usuario 
{ 
public 
int 
Codigo 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Login 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Senha 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ·
WC:\Users\wendr\OneDrive\Documentos\course\course.api\Business\Repos\ICursoRepository.cs
	namespace 	
course
 
. 
api 
. 
Business 
. 
Repos #
{ 
public		 

	interface		 
ICursoRepository		 %
{

 
void 
Add 
( 
Curso 
curso 
) 
; 
void 
Commit 
( 
) 
; 
IList 
< 
Curso 
> 
Get 
( 
int 
codigoUsuario *
)* +
;+ ,
} 
} Ó
YC:\Users\wendr\OneDrive\Documentos\course\course.api\Business\Repos\IUsuarioRepository.cs
	namespace 	
course
 
. 
api 
. 
Business 
. 
Repos #
{ 
public		 

	interface		 
IUsuarioRepository		 '
{

 
void 
Add 
( 
Usuario 
usuario  
)  !
;! "
void 
Commit 
( 
) 
; 
Task 
< 
Usuario 
> 
ObterUsuario "
(" #
string# )
login* /
)/ 0
;0 1
} 
} ı	
PC:\Users\wendr\OneDrive\Documentos\course\course.api\Configs\DbFactoryContext.cs
	namespace 	
course
 
. 
api 
. 
Configs 
{ 
public

 

class

 
DbFactoryContext

 !
:

" #'
IDesignTimeDbContextFactory

$ ?
<

? @
CursoDbContext

@ N
>

N O
{ 
public 
CursoDbContext 
CreateDbContext -
(- .
string. 4
[4 5
]5 6
args7 ;
); <
{ 	
var 
optionsBuilder 
=  
new! $#
DbContextOptionsBuilder% <
<< =
CursoDbContext= K
>K L
(L M
)M N
;N O
optionsBuilder 
. 
	UseSqlite $
($ %
$str% <
)< =
;= >
CursoDbContext 
cursoDbContext )
=* +
new, /
CursoDbContext0 >
(> ?
optionsBuilder? M
.M N
OptionsN U
)U V
;V W
return 
cursoDbContext !
;! "
} 	
} 
} Ì
VC:\Users\wendr\OneDrive\Documentos\course\course.api\Configs\IAuthenticationService.cs
	namespace 	
course
 
. 
api 
. 
Configs 
{ 
public 

	interface "
IAuthenticationService +
{		 
string 

GerarToken 
( "
UsuarioViewModelOutput 0"
usuarioViewModelOutput1 G
)G H
;H I
} 
} ø
JC:\Users\wendr\OneDrive\Documentos\course\course.api\Configs\JwtService.cs
	namespace		 	
course		
 
.		 
api		 
.		 
Configs		 
{

 
public 

class 

JwtService 
: "
IAuthenticationService 4
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 

JwtService 
( 
IConfiguration (
configuration) 6
)6 7
{ 	
_configuration 
= 
configuration *
;* +
} 	
public 
string 

GerarToken  
(  !"
UsuarioViewModelOutput! 7"
usuarioViewModelOutput8 N
)N O
{ 	
var 
secret 
= 
Encoding !
.! "
ASCII" '
.' (
GetBytes( 0
(0 1
_configuration1 ?
.? @

GetSection@ J
(J K
$strK e
)e f
.f g
Valueg l
)l m
;m n
var    
symmetricSecurityKey   $
=  % &
new  ' * 
SymmetricSecurityKey  + ?
(  ? @
secret  @ F
)  F G
;  G H
var!! #
securityTokenDescriptor!! '
=!!( )
new!!* -#
SecurityTokenDescriptor!!. E
{"" 
Subject## 
=## 
new## 
ClaimsIdentity## ,
(##, -
new##- 0
Claim##1 6
[##6 7
]##7 8
{$$ 
new%% 
Claim%% 
(%% 

ClaimTypes%% (
.%%( )
NameIdentifier%%) 7
,%%7 8"
usuarioViewModelOutput%%9 O
.%%O P
Codigo%%P V
.%%V W
ToString%%W _
(%%_ `
)%%` a
)%%a b
,%%b c
new&& 
Claim&& 
(&& 

ClaimTypes&& (
.&&( )
Name&&) -
,&&- ."
usuarioViewModelOutput&&/ E
.&&E F
Login&&F K
.&&K L
ToString&&L T
(&&T U
)&&U V
)&&V W
,&&W X
new'' 
Claim'' 
('' 

ClaimTypes'' (
.''( )
Email'') .
,''. /"
usuarioViewModelOutput''0 F
.''F G
Email''G L
.''L M
ToString''M U
(''U V
)''V W
)''W X
}(( 
)(( 
,(( 
Expires)) 
=)) 
DateTime)) "
.))" #
UtcNow))# )
.))) *
AddDays))* 1
())1 2
$num))2 3
)))3 4
,))4 5
SigningCredentials** "
=**# $
new**% (
SigningCredentials**) ;
(**; < 
symmetricSecurityKey**< P
,**P Q
SecurityAlgorithms**R d
.**d e
HmacSha256Signature**e x
)**x y
}++ 
;++ 
var-- #
jwtSecurityTokenHandler-- '
=--( )
new--* -#
JwtSecurityTokenHandler--. E
(--E F
)--F G
;--G H
var.. 
tokenGenerated.. 
=..  #
jwtSecurityTokenHandler..! 8
...8 9
CreateToken..9 D
(..D E#
securityTokenDescriptor..E \
)..\ ]
;..] ^
var// 
token// 
=// #
jwtSecurityTokenHandler// /
./// 0

WriteToken//0 :
(//: ;
tokenGenerated//; I
)//I J
;//J K
return11 
token11 
;11 
}22 	
}33 
}44 ö(
SC:\Users\wendr\OneDrive\Documentos\course\course.api\Controllers\CursoController.cs
	namespace

 	
course


 
.

 
api

 
.

 
Controllers

  
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 
] 
public 

class 
CursoController  
:! "
ControllerBase# 1
{ 
private 
readonly 
ICursoRepository )
_cursoRepository* :
;: ;
public 
CursoController 
( 
ICursoRepository /
cursoRepository0 ?
)? @
{ 	
_cursoRepository 
= 
cursoRepository .
;. /
} 	
[## 	
SwaggerResponse##	 
(## 

statusCode## #
:### $
$num##% (
,##( )
description##* 5
:##5 6
$str##7 S
,##S T
Type##U Y
=##Z [
typeof##\ b
(##b c 
CursoViewModelOutput##c w
)##w x
)##x y
]##y z
[$$ 	
SwaggerResponse$$	 
($$ 

statusCode$$ #
:$$# $
$num$$% (
,$$( )
description$$* 5
:$$5 6
$str$$7 G
)$$G H
]$$H I
[%% 	
HttpPost%%	 
]%% 
[&& 	
Route&&	 
(&& 
$str&& 
)&& 
]&& 
public'' 
IActionResult'' 
Post'' !
(''! "
CursoViewModelInput''" 5
cursoViewModelInput''6 I
)''I J
{(( 	
Curso)) 
curso)) 
=)) 
new)) 
Curso)) #
{** 
Nome++ 
=++ 
cursoViewModelInput++ *
.++* +
Nome+++ /
,++/ 0
	Descricao,, 
=,, 
cursoViewModelInput,, /
.,,/ 0
	Descricao,,0 9
,,,9 :
CodigoUsuario-- 
=-- 
int--  #
.--# $
Parse--$ )
(--) *
User--* .
.--. /
	FindFirst--/ 8
(--8 9
c--9 :
=>--; =
c--> ?
.--? @
Type--@ D
==--E G

ClaimTypes--H R
.--R S
NameIdentifier--S a
)--a b
?--b c
.--c d
Value--d i
)--i j
}.. 
;.. 
_cursoRepository// 
.// 
Add//  
(//  !
curso//! &
)//& '
;//' (
_cursoRepository00 
.00 
Commit00 #
(00# $
)00$ %
;00% &
return11 
Created11 
(11 
$str11 
,11 
cursoViewModelInput11 2
)112 3
;113 4
}22 	
[88 	
SwaggerResponse88	 
(88 

statusCode88 #
:88# $
$num88% (
,88( )
description88* 5
:885 6
$str887 P
,88P Q
Type88R V
=88W X
typeof88Y _
(88_ ` 
CursoViewModelOutput88` t
)88t u
)88u v
]88v w
[99 	
SwaggerResponse99	 
(99 

statusCode99 #
:99# $
$num99% (
,99( )
description99* 5
:995 6
$str997 G
)99G H
]99H I
[:: 	
HttpGet::	 
]:: 
[;; 	
Route;;	 
(;; 
$str;; 
);; 
];; 
public<< 
IActionResult<< 
Get<<  
(<<  !
)<<! "
{== 	
var>> 
codigoUsuario>> 
=>> 
int>>  #
.>># $
Parse>>$ )
(>>) *
User>>* .
.>>. /
	FindFirst>>/ 8
(>>8 9
c>>9 :
=>>>; =
c>>> ?
.>>? @
Type>>@ D
==>>E G

ClaimTypes>>H R
.>>R S
NameIdentifier>>S a
)>>a b
?>>b c
.>>c d
Value>>d i
)>>i j
;>>j k
var@@ 
cursos@@ 
=@@ 
_cursoRepository@@ )
.@@) *
Get@@* -
(@@- .
codigoUsuario@@. ;
)@@; <
.@@< =
Select@@= C
(@@C D
s@@D E
=>@@F H
new@@I L 
CursoViewModelOutput@@M a
(@@a b
)@@b c
{AA 
NomeBB 
=BB 
sBB 
.BB 
NomeBB 
,BB 
	DescricaoCC 
=CC 
sCC 
.CC 
	DescricaoCC '
,CC' (
LoginDD 
=DD 
sDD 
.DD 
UsuarioDD !
.DD! "
LoginDD" '
}EE 
)EE 
;EE 
returnGG 
OkGG 
(GG 
cursosGG 
)GG 
;GG 
}HH 	
}II 
}JJ £/
UC:\Users\wendr\OneDrive\Documentos\course\course.api\Controllers\UsuarioController.cs
	namespace 	
course
 
. 
api 
. 
Controllers  
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
ApiController 
] 
public 

class 
UsuarioController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IUsuarioRepository +
_usuarioRepository, >
;> ?
private 
readonly "
IAuthenticationService /
_auth0 5
;5 6
public 
UsuarioController  
(  !
IUsuarioRepository! 3
usuarioRepository4 E
,E F"
IAuthenticationService "
auth# '
)' (
{ 	
_usuarioRepository 
=  
usuarioRepository! 2
;2 3
_auth 
= 
auth 
; 
}   	
['' 	
SwaggerResponse''	 
('' 

statusCode'' #
:''# $
$num''% (
,''( )
description''* 5
:''5 6
$str''7 N
,''N O
Type''P T
=''U V
typeof''W ]
(''] ^
LoginViewModelInput''^ q
)''q r
)''r s
]''s t
[(( 	
SwaggerResponse((	 
((( 

statusCode(( #
:((# $
$num((% (
,((( )
description((* 5
:((5 6
$str((7 `
,((` a
Type((b f
=((g h
typeof((i o
(((o p(
ValidaCamposViewModelOutput	((p ã
)
((ã å
)
((å ç
]
((ç é
[)) 	
SwaggerResponse))	 
()) 

statusCode)) #
:))# $
$num))% (
,))( )
description))* 5
:))5 6
$str))7 E
,))E F
Type))G K
=))L M
typeof))N T
())T U!
ErroGenericoViewModel))U j
)))j k
)))k l
]))l m
[** 	
HttpPost**	 
]** 
[++ 	
Route++	 
(++ 
$str++ 
)++ 
]++ 
[,, 	*
ValidacaoModelStateCustomizado,,	 '
],,' (
public-- 
async-- 
Task-- 
<-- 
IActionResult-- '
>--' (
Logar--) .
(--. /
LoginViewModelInput--/ B
loginViewModelInput--C V
)--V W
{.. 	
Usuario// 
usuario// 
=// 
await// #
_usuarioRepository//$ 6
.//6 7
ObterUsuario//7 C
(//C D
loginViewModelInput//D W
.//W X
Login//X ]
)//] ^
;//^ _
if11 
(11 
usuario11 
==11 
null11 
)11  
{22 
return33 

BadRequest33 !
(33! "
$str33" <
)33< =
;33= >
}44 
var66 "
usuarioViewModelOutput66 &
=66' (
new66) ,"
UsuarioViewModelOutput66- C
(66C D
)66D E
{77 
Codigo88 
=88 
usuario88  
.88  !
Codigo88! '
,88' (
Login99 
=99 
loginViewModelInput99 +
.99+ ,
Login99, 1
,991 2
Email:: 
=:: 
usuario:: 
.::  
Email::  %
};; 
;;; 
var== 
token== 
=== 
_auth== 
.== 

GerarToken== (
(==( )"
usuarioViewModelOutput==) ?
)==? @
;==@ A
return?? 
Ok?? 
(?? 
new?? 
{@@ 
TokenAA 
=AA 
tokenAA 
,AA 
UsuarioBB 
=BB "
usuarioViewModelOutputBB 0
}CC 
)CC 
;CC 
}DD 	
[KK 	
HttpPostKK	 
]KK 
[LL 	
RouteLL	 
(LL 
$strLL 
)LL 
]LL 
[MM 	*
ValidacaoModelStateCustomizadoMM	 '
]MM' (
publicNN 
asyncNN 
TaskNN 
<NN 
IActionResultNN '
>NN' (
	RegistrarNN) 2
(NN2 3"
RegistroViewModelInputNN3 I"
registroViewModelInputNNJ `
)NN` a
{OO 	
varPP 
usuarioExistePP 
=PP 
awaitPP  %
_usuarioRepositoryPP& 8
.PP8 9
ObterUsuarioPP9 E
(PPE F"
registroViewModelInputPPF \
.PP\ ]
LoginPP] b
)PPb c
;PPc d
ifRR 
(RR 
usuarioExisteRR 
!=RR  
nullRR! %
)RR% &
{SS 
returnTT 

BadRequestTT !
(TT! "
$strTT" :
)TT: ;
;TT; <
}UU 
varWW 
usuarioWW 
=WW 
newWW 
UsuarioWW %
{XX 
LoginYY 
=YY "
registroViewModelInputYY .
.YY. /
LoginYY/ 4
,YY4 5
SenhaZZ 
=ZZ "
registroViewModelInputZZ .
.ZZ. /
SenhaZZ/ 4
,ZZ4 5
Email[[ 
=[[ "
registroViewModelInput[[ .
.[[. /
Email[[/ 4
}\\ 
;\\ 
_usuarioRepository]] 
.]] 
Add]] "
(]]" #
usuario]]# *
)]]* +
;]]+ ,
_usuarioRepository^^ 
.^^ 
Commit^^ %
(^^% &
)^^& '
;^^' (
return`` 
Created`` 
(`` 
$str`` 
,`` "
registroViewModelInput`` 5
)``5 6
;``6 7
}aa 	
}bb 
}cc ¨
^C:\Users\wendr\OneDrive\Documentos\course\course.api\Filters\ValidacaoModelStateCustomizado.cs
	namespace 	
course
 
. 
api 
. 
Filters 
{ 
public 

class *
ValidacaoModelStateCustomizado /
:0 1!
ActionFilterAttribute2 G
{ 
public 
override 
void 
OnActionExecuting .
(. /"
ActionExecutingContext/ E
contextF M
)M N
{ 	
if 
( 
! 
context 
. 

ModelState #
.# $
IsValid$ +
)+ ,
{ 
var  
validaCampoViewModel (
=) *
new+ .'
ValidaCamposViewModelOutput/ J
(J K
contextK R
.R S

ModelStateS ]
.] ^

SelectMany^ h
(h i
smi k
=>l n
smo q
.q r
Valuer w
.w x
Errorsx ~
)~ 
.	 Ä
Select
Ä Ü
(
Ü á
s
á à
=>
â ã
s
å ç
.
ç é
ErrorMessage
é ö
)
ö õ
)
õ ú
;
ú ù
context 
. 
Result 
=  
new! $"
BadRequestObjectResult% ;
(; < 
validaCampoViewModel< P
)P Q
;Q R
} 
} 	
} 
} Ó
LC:\Users\wendr\OneDrive\Documentos\course\course.api\Infra\CursoDbContext.cs
	namespace 	
course
 
. 
api 
. 
Infra 
{ 
public

 

class

 
CursoDbContext

 
:

  !
	DbContext

" +
{ 
public 
CursoDbContext 
( 
DbContextOptions .
<. /
CursoDbContext/ =
>= >
options? F
)F G
:H I
baseJ N
(N O
optionsO V
)V W
{ 	
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
ApplyConfiguration +
(+ ,
new, /
CursoMapping0 <
(< =
)= >
)> ?
;? @
modelBuilder 
. 
ApplyConfiguration +
(+ ,
new, /
UsuarioMapping0 >
(> ?
)? @
)@ A
;A B
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
} 	
public!! 
DbSet!! 
<!! 
Usuario!! 
>!! 
Usuario!! %
{!!& '
get!!( +
;!!+ ,
set!!- 0
;!!0 1
}!!2 3
public&& 
DbSet&& 
<&& 
Curso&& 
>&& 
Curso&& !
{&&" #
get&&$ '
;&&' (
set&&) ,
;&&, -
}&&. /
}'' 
}(( ç
XC:\Users\wendr\OneDrive\Documentos\course\course.api\Infra\Data\Mappings\CursoMapping.cs
	namespace 	
course
 
. 
api 
. 
Infra 
. 
Data 
.  
Mappings  (
{ 
public

 

class

 
CursoMapping

 
:

 $
IEntityTypeConfiguration

  8
<

8 9
Curso

9 >
>

> ?
{ 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
Curso0 5
>5 6
builder7 >
)> ?
{ 	
builder 
. 
ToTable 
( 
$str &
)& '
;' (
builder 
. 
HasKey 
( 
key 
=> !
key" %
.% &
Codigo& ,
), -
;- .
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Codigo$ *
)* +
.+ ,
ValueGeneratedOnAdd, ?
(? @
)@ A
;A B
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Nome$ (
)( )
;) *
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
	Descricao$ -
)- .
;. /
builder 
. 
HasOne 
( 
p 
=> 
p  !
.! "
Usuario" )
)) *
. 
WithMany 
( 
) 
. 
HasForeignKey )
() *
fk* ,
=>- /
fk0 2
.2 3
CodigoUsuario3 @
)@ A
;A B
} 	
} 
} ≠
ZC:\Users\wendr\OneDrive\Documentos\course\course.api\Infra\Data\Mappings\UsuarioMapping.cs
	namespace 	
course
 
. 
api 
. 
Infra 
. 
Data 
.  
Mappings  (
{ 
public

 

class

 
UsuarioMapping

 
:

  !$
IEntityTypeConfiguration

" :
<

: ;
Usuario

; B
>

B C
{ 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
Usuario0 7
>7 8
builder9 @
)@ A
{ 	
builder 
. 
ToTable 
( 
$str (
)( )
;) *
builder 
. 
HasKey 
( 
key 
=> !
key" %
.% &
Codigo& ,
), -
;- .
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Codigo$ *
)* +
.+ ,
ValueGeneratedOnAdd, ?
(? @
)@ A
;A B
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Login$ )
)) *
;* +
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Senha$ )
)) *
;* +
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Email$ )
)) *
;* +
} 	
} 
} ã
XC:\Users\wendr\OneDrive\Documentos\course\course.api\Infra\Data\Repos\CursoRepository.cs
	namespace 	
course
 
. 
api 
. 
Infra 
. 
Data 
.  
Repos  %
{ 
public 

class 
CursoRepository  
:! "
ICursoRepository# 3
{ 
private 
readonly 
CursoDbContext '
_cursoDbContext( 7
;7 8
public 
CursoRepository 
( 
CursoDbContext -
cursoDbContext. <
)< =
{ 	
_cursoDbContext 
= 
cursoDbContext ,
;, -
} 	
public 
void 
Add 
( 
Curso 
curso #
)# $
{ 	
_cursoDbContext 
. 
Curso !
.! "
Add" %
(% &
curso& +
)+ ,
;, -
} 	
public## 
void## 
Commit## 
(## 
)## 
{$$ 	
_cursoDbContext%% 
.%% 
SaveChanges%% '
(%%' (
)%%( )
;%%) *
}&& 	
public++ 
IList++ 
<++ 
Curso++ 
>++ 
Get++ 
(++  
int++  #
codigoUsuario++$ 1
)++1 2
{,, 	
return-- 
_cursoDbContext-- "
.--" #
Curso--# (
.--( )
Include--) 0
(--0 1
i--1 2
=>--3 5
i--6 7
.--7 8
Usuario--8 ?
)--? @
.--@ A
Where--A F
(--F G
w--G H
=>--I K
w--L M
.--M N
CodigoUsuario--N [
==--\ ^
codigoUsuario--_ l
)--l m
.--m n
ToList--n t
(--t u
)--u v
;--v w
}.. 	
}// 
}00 Ò
ZC:\Users\wendr\OneDrive\Documentos\course\course.api\Infra\Data\Repos\UsuarioRepository.cs
	namespace 	
course
 
. 
api 
. 
Infra 
. 
Data 
.  
Repos  %
{ 
public 

class 
UsuarioRepository "
:# $
IUsuarioRepository% 7
{ 
private 
readonly 
CursoDbContext '
_cursoDbContext( 7
;7 8
public 
UsuarioRepository  
(  !
CursoDbContext! /
cursoDbContext0 >
)> ?
{ 	
_cursoDbContext 
= 
cursoDbContext ,
;, -
} 	
public 
void 
Add 
( 
Usuario 
usuario  '
)' (
{ 	
_cursoDbContext 
. 
Usuario #
.# $
Add$ '
(' (
usuario( /
)/ 0
;0 1
} 	
public"" 
void"" 
Commit"" 
("" 
)"" 
{## 	
_cursoDbContext$$ 
.$$ 
SaveChanges$$ '
($$' (
)$$( )
;$$) *
}%% 	
public** 
async** 
Task** 
<** 
Usuario** !
>**! "
ObterUsuario**# /
(**/ 0
string**0 6
login**7 <
)**< =
{++ 	
return,, 
await,, 
_cursoDbContext,, (
.,,( )
Usuario,,) 0
.,,0 1
FirstOrDefaultAsync,,1 D
(,,D E
u,,E F
=>,,G I
u,,J K
.,,K L
Login,,L Q
==,,R T
login,,U Z
),,Z [
;,,[ \
}-- 	
}.. 
}// Ä*
_C:\Users\wendr\OneDrive\Documentos\course\course.api\Migrations\20220208004003_InitialCreate.cs
	namespace 	
course
 
. 
api 
. 

Migrations 
{ 
public 

partial 
class 
InitialCreate &
:' (
	Migration) 2
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
CreateTable		 (
(		( )
name

 
:

 
$str

 "
,

" #
columns 
: 
table 
=> !
new" %
{ 
Codigo 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
nullable/ 7
:7 8
false9 >
)> ?
. 

Annotation #
(# $
$str$ :
,: ;
true< @
)@ A
,A B
Login 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
nullable1 9
:9 :
true; ?
)? @
,@ A
Email 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
nullable1 9
:9 :
true; ?
)? @
,@ A
Senha 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
nullable1 9
:9 :
true; ?
)? @
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 4
,4 5
x6 7
=>8 :
x; <
.< =
Codigo= C
)C D
;D E
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str  
,  !
columns 
: 
table 
=> !
new" %
{ 
Codigo 
= 
table "
." #
Column# )
<) *
int* -
>- .
(. /
nullable/ 7
:7 8
false9 >
)> ?
. 

Annotation #
(# $
$str$ :
,: ;
true< @
)@ A
,A B
Nome 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
nullable0 8
:8 9
true: >
)> ?
,? @
	Descricao 
= 
table  %
.% &
Column& ,
<, -
string- 3
>3 4
(4 5
nullable5 =
:= >
true? C
)C D
,D E
CodigoUsuario   !
=  " #
table  $ )
.  ) *
Column  * 0
<  0 1
int  1 4
>  4 5
(  5 6
nullable  6 >
:  > ?
false  @ E
)  E F
}!! 
,!! 
constraints"" 
:"" 
table"" "
=>""# %
{## 
table$$ 
.$$ 

PrimaryKey$$ $
($$$ %
$str$$% 2
,$$2 3
x$$4 5
=>$$6 8
x$$9 :
.$$: ;
Codigo$$; A
)$$A B
;$$B C
table%% 
.%% 

ForeignKey%% $
(%%$ %
name&& 
:&& 
$str&& D
,&&D E
column'' 
:'' 
x''  !
=>''" $
x''% &
.''& '
CodigoUsuario''' 4
,''4 5
principalTable(( &
:((& '
$str((( 4
,((4 5
principalColumn)) '
:))' (
$str))) 1
,))1 2
onDelete**  
:**  !
ReferentialAction**" 3
.**3 4
Cascade**4 ;
)**; <
;**< =
}++ 
)++ 
;++ 
migrationBuilder-- 
.-- 
CreateIndex-- (
(--( )
name.. 
:.. 
$str.. 1
,..1 2
table// 
:// 
$str// !
,//! "
column00 
:00 
$str00 '
)00' (
;00( )
}11 	
	protected33 
override33 
void33 
Down33  $
(33$ %
MigrationBuilder33% 5
migrationBuilder336 F
)33F G
{44 	
migrationBuilder55 
.55 
	DropTable55 &
(55& '
name66 
:66 
$str66  
)66  !
;66! "
migrationBuilder88 
.88 
	DropTable88 &
(88& '
name99 
:99 
$str99 "
)99" #
;99# $
}:: 	
};; 
}<< ñ
YC:\Users\wendr\OneDrive\Documentos\course\course.api\Models\Cursos\CursoViewModelInput.cs
	namespace 	
course
 
. 
api 
. 
Models 
{ 
public 

class 
CursoViewModelInput $
{		 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! @
)@ A
]A B
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
( 
ErrorMessage 
=  
$str! E
)E F
]F G
public 
string 
	Descricao 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ó
ZC:\Users\wendr\OneDrive\Documentos\course\course.api\Models\Cursos\CursoViewModelOutput.cs
	namespace 	
course
 
. 
api 
. 
Models 
{ 
public 

class  
CursoViewModelOutput %
{ 
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	Descricao 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Login 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ‡
TC:\Users\wendr\OneDrive\Documentos\course\course.api\Models\ErroGenericoViewModel.cs
	namespace 	
course
 
. 
api 
. 
Models 
{ 
public 

class !
ErroGenericoViewModel &
{ 
public 
string 
Mensagem 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ∫
[C:\Users\wendr\OneDrive\Documentos\course\course.api\Models\Usuarios\LoginViewModelInput.cs
	namespace 	
course
 
. 
api 
. 
Models 
. 
Usuarios $
{ 
public 

class 
LoginViewModelInput $
{		 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 8
)8 9
]9 :
public 
string 
Login 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 8
)8 9
]9 :
public 
string 
Senha 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ﬂ
^C:\Users\wendr\OneDrive\Documentos\course\course.api\Models\Usuarios\RegistroViewModelInput.cs
	namespace 	
course
 
. 
api 
. 
Models 
. 
Usuarios $
{ 
public 

class "
RegistroViewModelInput '
{		 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 8
)8 9
]9 :
public 
string 
Login 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 9
)9 :
]: ;
[ 	
StringLength	 
( 
$num 
) 
] 
[ 	
EmailAddress	 
( 
ErrorMessage "
=# $
$str% B
)B C
]C D
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 8
)8 9
]9 :
public 
string 
Senha 
{ 
get !
;! "
set# &
;& '
}( )
} 
} è
UC:\Users\wendr\OneDrive\Documentos\course\course.api\Models\UsuarioViewModelOutput.cs
	namespace 	
course
 
. 
api 
. 
Models 
{ 
public 

class "
UsuarioViewModelOutput '
{ 
public 
int 
Codigo 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Login 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
} –
ZC:\Users\wendr\OneDrive\Documentos\course\course.api\Models\ValidaCamposViewModelOutput.cs
	namespace 	
course
 
. 
api 
. 
Models 
{ 
public 

class '
ValidaCamposViewModelOutput ,
{		 
public '
ValidaCamposViewModelOutput *
(* +
IEnumerable+ 6
<6 7
string7 =
>= >
erros? D
)D E
{ 	
Erros 
= 
erros 
; 
} 	
public 
IEnumerable 
< 
string !
>! "
Erros# (
{) *
get+ .
;. /
private0 7
set8 ;
;; <
}= >
} 
} ≥

?C:\Users\wendr\OneDrive\Documentos\course\course.api\Program.cs
	namespace 	
course
 
. 
api 
{ 
public		 

class		 
Program		 
{

 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ßA
?C:\Users\wendr\OneDrive\Documentos\course\course.api\Startup.cs
	namespace 	
course
 
. 
api 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
}   	
public%% 
IConfiguration%% 
Configuration%% +
{%%, -
get%%. 1
;%%1 2
}%%3 4
public** 
void** 
ConfigureServices** %
(**% &
IServiceCollection**& 8
services**9 A
)**A B
{++ 	
services,, 
.,, 
AddControllers,, #
(,,# $
),,$ %
.-- '
ConfigureApiBehaviorOptions-- ,
(--, -
c--- .
=>--/ 1
{.. 
c// 
.// +
SuppressModelStateInvalidFilter// 1
=//2 3
true//4 8
;//8 9
}00 
)00 
;00 
services22 
.22 
AddSwaggerGen22 "
(22" #
c22# $
=>22% '
{33 
c44 
.44 !
AddSecurityDefinition44 '
(44' (
$str44( 0
,440 1
new442 5!
OpenApiSecurityScheme446 K
{55 
Description66 
=66  !
$str66" v
,66v w
Name77 
=77 
$str77 *
,77* +
In88 
=88 
ParameterLocation88 *
.88* +
Header88+ 1
,881 2
Type99 
=99 
SecuritySchemeType99 -
.99- .
ApiKey99. 4
,994 5
Scheme:: 
=:: 
$str:: %
};; 
);; 
;;; 
c== 
.== "
AddSecurityRequirement== (
(==( )
new==) ,&
OpenApiSecurityRequirement==- G
{>> 
{?? 
new@@ !
OpenApiSecurityScheme@@ 1
{AA 
	ReferenceBB %
=BB& '
newBB( +
OpenApiReferenceBB, <
{CC 
TypeDD  $
=DD% &
ReferenceTypeDD' 4
.DD4 5
SecuritySchemeDD5 C
,DDC D
IdEE  "
=EE# $
$strEE% -
}FF 
}GG 
,GG 
ArrayHH 
.HH 
EmptyHH #
<HH# $
stringHH$ *
>HH* +
(HH+ ,
)HH, -
}II 
}JJ 
)JJ 
;JJ 
varLL 
xmlFileLL 
=LL 
$"LL  
{LL  !
AssemblyLL! )
.LL) *
GetEntryAssemblyLL* :
(LL: ;
)LL; <
.LL< =
GetNameLL= D
(LLD E
)LLE F
.LLF G
NameLLG K
}LLK L
$strLLL P
"LLP Q
;LLQ R
varMM 
xmlPathMM 
=MM 
PathMM "
.MM" #
CombineMM# *
(MM* +

AppContextMM+ 5
.MM5 6
BaseDirectoryMM6 C
,MMC D
xmlFileMME L
)MML M
;MMM N
cNN 
.NN 
IncludeXmlCommentsNN $
(NN$ %
xmlPathNN% ,
)NN, -
;NN- .
}OO 
)OO 
;OO 
varQQ 
secretQQ 
=QQ 
EncodingQQ !
.QQ! "
ASCIIQQ" '
.QQ' (
GetBytesQQ( 0
(QQ0 1
ConfigurationQQ1 >
.QQ> ?

GetSectionQQ? I
(QQI J
$strQQJ d
)QQd e
.QQe f
ValueQQf k
)QQk l
;QQl m
servicesSS 
.SS 
AddAuthenticationSS &
(SS& '
authSS' +
=>SS, .
{TT 
authUU 
.UU %
DefaultAuthenticateSchemeUU .
=UU/ 0
JwtBearerDefaultsUU1 B
.UUB C 
AuthenticationSchemeUUC W
;UUW X
authVV 
.VV "
DefaultChallengeSchemeVV +
=VV, -
JwtBearerDefaultsVV. ?
.VV? @ 
AuthenticationSchemeVV@ T
;VVT U
}WW 
)WW 
.XX 
AddJwtBearerXX 
(XX 
jwtXX 
=>XX  
{YY 
jwtZZ 
.ZZ  
RequireHttpsMetadataZZ (
=ZZ) *
falseZZ+ 0
;ZZ0 1
jwt[[ 
.[[ 
	SaveToken[[ 
=[[ 
true[[  $
;[[$ %
jwt\\ 
.\\ %
TokenValidationParameters\\ -
=\\. /
new\\0 3%
TokenValidationParameters\\4 M
{]] $
ValidateIssuerSigningKey^^ ,
=^^- .
true^^/ 3
,^^3 4
IssuerSigningKey__ $
=__% &
new__' * 
SymmetricSecurityKey__+ ?
(__? @
secret__@ F
)__F G
,__G H
ValidateIssuer`` "
=``# $
false``% *
,``* +
ValidateAudienceaa $
=aa% &
falseaa' ,
}bb 
;bb 
}cc 
)cc 
;cc 
servicesee 
.ee 
AddDbContextee !
<ee! "
CursoDbContextee" 0
>ee0 1
(ee1 2
optionsee2 9
=>ee: <
{ff 
optionsgg 
.gg 
	UseSqlitegg !
(gg! "
Configurationgg" /
.gg/ 0
GetConnectionStringgg0 C
(ggC D
$strggD W
)ggW X
)ggX Y
;ggY Z
}hh 
)hh 
;hh 
servicesii 
.ii 
	AddScopedii 
<ii 
IUsuarioRepositoryii 1
,ii1 2
UsuarioRepositoryii3 D
>iiD E
(iiE F
)iiF G
;iiG H
servicesjj 
.jj 
	AddScopedjj 
<jj 
ICursoRepositoryjj /
,jj/ 0
CursoRepositoryjj1 @
>jj@ A
(jjA B
)jjB C
;jjC D
serviceskk 
.kk 
	AddScopedkk 
<kk "
IAuthenticationServicekk 5
,kk5 6

JwtServicekk7 A
>kkA B
(kkB C
)kkC D
;kkD E
} 	
public
ÑÑ 
void
ÑÑ 
	Configure
ÑÑ 
(
ÑÑ !
IApplicationBuilder
ÑÑ 1
app
ÑÑ2 5
,
ÑÑ5 6!
IWebHostEnvironment
ÑÑ7 J
env
ÑÑK N
)
ÑÑN O
{
ÖÖ 	
if
ÜÜ 
(
ÜÜ 
env
ÜÜ 
.
ÜÜ 
IsDevelopment
ÜÜ !
(
ÜÜ! "
)
ÜÜ" #
)
ÜÜ# $
{
áá 
app
àà 
.
àà '
UseDeveloperExceptionPage
àà -
(
àà- .
)
àà. /
;
àà/ 0
}
ââ 
app
ãã 
.
ãã !
UseHttpsRedirection
ãã #
(
ãã# $
)
ãã$ %
;
ãã% &
app
åå 
.
åå 

UseRouting
åå 
(
åå 
)
åå 
;
åå 
app
çç 
.
çç 
UseAuthentication
çç !
(
çç! "
)
çç" #
;
çç# $
app
éé 
.
éé 
UseAuthorization
éé  
(
éé  !
)
éé! "
;
éé" #
app
êê 
.
êê 
UseEndpoints
êê 
(
êê 
	endpoints
êê &
=>
êê' )
{
ëë 
	endpoints
íí 
.
íí 
MapControllers
íí (
(
íí( )
)
íí) *
;
íí* +
}
ìì 
)
ìì 
;
ìì 
app
ïï 
.
ïï 

UseSwagger
ïï 
(
ïï 
)
ïï 
;
ïï 
app
ññ 
.
ññ 
UseSwaggerUI
ññ 
(
ññ 
c
ññ 
=>
ññ !
{
óó 
c
òò 
.
òò 
SwaggerEndpoint
òò !
(
òò! "
$str
òò" <
,
òò< =
$str
òò> I
)
òòI J
;
òòJ K
c
ôô 
.
ôô 
RoutePrefix
ôô 
=
ôô 
String
ôô  &
.
ôô& '
Empty
ôô' ,
;
ôô, -
}
öö 
)
öö 
;
öö 
}
õõ 	
}
úú 
}ùù 