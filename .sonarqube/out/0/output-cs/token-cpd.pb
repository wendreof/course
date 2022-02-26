Å
VC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Controllers\CursoController.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Controllers #
{		 
[

 
	Microsoft

 
.

 

AspNetCore

 
.

 
Authorization

 '
.

' (
	Authorize

( 1
]

1 2
public 

class 
CursoController  
:! "

Controller# -
{ 
private 
readonly 
ICursoService &
_service' /
;/ 0
public 
CursoController 
( 
ICursoService ,
service- 4
)4 5
{ 	
_service 
= 
service 
; 
} 	
public 
IActionResult 
	Cadastrar &
(& '
)' (
{ 	
return 
View 
( 
) 
; 
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
CadastrarAsync) 7
(7 8(
RegistrarCursoViewModelInput8 T
inputU Z
)Z [
{ 	
try 
{ 
var 
retorno 
= 
await #
_service$ ,
., -
	Registrar- 6
(6 7
input7 <
)< =
;= >

ModelState 
. 
AddModelError (
(( )
$str) +
,+ ,
$"- /
$str/ V
{V W
retornoW ^
.^ _
Nome_ c
}c d
"d e
)e f
;f g
} 
catch   
(   
ApiException   
ex    "
)  " #
{!! 

ModelState"" 
."" 
AddModelError"" (
(""( )
$str"") +
,""+ ,
ex""- /
.""/ 0
Message""0 7
)""7 8
;""8 9
}## 
catch$$ 
($$ 
	Exception$$ 
ex$$ 
)$$  
{%% 

ModelState&& 
.&& 
AddModelError&& (
(&&( )
$str&&) +
,&&+ ,
ex&&- /
.&&/ 0
Message&&0 7
)&&7 8
;&&8 9
}'' 
return(( 
View(( 
((( 
)(( 
;(( 
})) 	
[++ 	
HttpGet++	 
]++ 
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
Listar,,) /
(,,/ 0
),,0 1
{-- 	
try.. 
{// 
var00 
retorno00 
=00 
await00 #
_service00$ ,
.00, -
Listar00- 3
(003 4
)004 5
;005 6
return11 
View11 
(11 
retorno11 #
)11# $
;11$ %
}22 
catch33 
(33 
ApiException33 
ex33  "
)33" #
{44 

ModelState55 
.55 
AddModelError55 (
(55( )
$str55) +
,55+ ,
ex55- /
.55/ 0
Message550 7
)557 8
;558 9
}66 
catch77 
(77 
	Exception77 
ex77 
)77  
{88 

ModelState99 
.99 
AddModelError99 (
(99( )
$str99) +
,99+ ,
ex99- /
.99/ 0
Message990 7
)997 8
;998 9
}:: 
return;; 
View;; 
(;; 
new;; &
ListarCursoViewModelOutput;; 6
(;;6 7
);;7 8
);;8 9
;;;9 :
}<< 	
}>> 
}?? «
UC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Controllers\HomeController.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Controllers #
{ 
public 

class 
HomeController 
:  !

Controller" ,
{		 
private

 
readonly

 
ILogger

  
<

  !
HomeController

! /
>

/ 0
_logger

1 8
;

8 9
public 
HomeController 
( 
ILogger %
<% &
HomeController& 4
>4 5
logger6 <
)< =
{ 	
_logger 
= 
logger 
; 
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
public 
IActionResult 
Privacy $
($ %
)% &
{ 	
return 
View 
( 
) 
; 
} 	
[ 	
ResponseCache	 
( 
Duration 
=  !
$num" #
,# $
Location% -
=. /!
ResponseCacheLocation0 E
.E F
NoneF J
,J K
NoStoreL S
=T U
trueV Z
)Z [
][ \
public 
IActionResult 
Error "
(" #
)# $
{ 	
return 
View 
( 
new 
ErrorViewModel *
{+ ,
	RequestId- 6
=7 8
Activity9 A
.A B
CurrentB I
?I J
.J K
IdK M
??N P
HttpContextQ \
.\ ]
TraceIdentifier] l
}m n
)n o
;o p
} 	
}   
}!! Ý9
XC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Controllers\UsuarioController.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Controllers #
{ 
public 

class 
UsuarioController "
:# $

Controller% /
{ 
private 
readonly 
IUsuarioService (
_service) 1
;1 2
public 
UsuarioController  
(  !
IUsuarioService! 0
service1 8
)8 9
{ 	
_service 
= 
service 
; 
} 	
public 
IActionResult 
	Cadastrar &
(& '
)' (
{ 	
return 
View 
( 
) 
; 
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
	Cadastrar) 2
(2 3*
RegistrarUsuarioViewModelInput3 Q
inputR W
)W X
{ 	
try 
{ 
var   
retorno   
=   
await   #
_service  $ ,
.  , -
	Registrar  - 6
(  6 7
input  7 <
)  < =
;  = >

ModelState"" 
."" 
AddModelError"" (
(""( )
$str"") +
,""+ ,
$"""- /
$str""/ T
{""T U
retorno""U \
.""\ ]
Login""] b
}""b c
"""c d
)""d e
;""e f
}## 
catch$$ 
($$ 
ApiException$$ 
ex$$  "
)$$" #
{%% 

ModelState&& 
.&& 
AddModelError&& (
(&&( )
$str&&) +
,&&+ ,
ex&&- /
.&&/ 0
Message&&0 7
)&&7 8
;&&8 9
}'' 
catch(( 
((( 
	Exception(( 
ex(( 
)((  
{)) 

ModelState** 
.** 
AddModelError** (
(**( )
$str**) +
,**+ ,
ex**- /
.**/ 0
Message**0 7
)**7 8
;**8 9
}++ 
return,, 
View,, 
(,, 
),, 
;,, 
}-- 	
public// 
IActionResult// 
Logar// "
(//" #
)//# $
{00 	
return11 
View11 
(11 
)11 
;11 
}22 	
[44 	
HttpPost44	 
]44 
public55 
async55 
Task55 
<55 
IActionResult55 '
>55' (

LogarAsync55) 3
(553 4
LoginViewModelInput554 G
input55H M
)55M N
{66 	
try77 
{88 
var99 
retorno99 
=99 
await99 #
_service99$ ,
.99, -
Logar99- 2
(992 3
input993 8
)998 9
;999 :
var;; 
claims;; 
=;; 
new;;  
List;;! %
<;;% &
Claim;;& +
>;;+ ,
{<< 
new== 
Claim== 
(== 

ClaimTypes== (
.==( )
NameIdentifier==) 7
,==7 8
retorno==9 @
.==@ A
Usuario==A H
.==H I
Codigo==I O
.==O P
ToString==P X
(==X Y
)==Y Z
)==Z [
,==[ \
new>> 
Claim>> 
(>> 

ClaimTypes>> (
.>>( )
Name>>) -
,>>- .
retorno>>/ 6
.>>6 7
Usuario>>7 >
.>>> ?
Login>>? D
)>>D E
,>>E F
new?? 
Claim?? 
(?? 

ClaimTypes?? (
.??( )
Email??) .
,??. /
retorno??0 7
.??7 8
Usuario??8 ?
.??? @
Email??@ E
)??E F
,??F G
new@@ 
Claim@@ 
(@@ 
$str@@ %
,@@% &
retorno@@' .
.@@. /
Token@@/ 4
)@@4 5
,@@5 6
}BB 
;BB 
varDD 
claimsIdentityDD "
=DD# $
newDD% (
ClaimsIdentityDD) 7
(DD7 8
claimsDD8 >
,DD> ?(
CookieAuthenticationDefaultsDD@ \
.DD\ ] 
AuthenticationSchemeDD] q
)DDq r
;DDr s
varFF 
authPropertiesFF "
=FF# $
newFF% ($
AuthenticationPropertiesFF) A
{GG 

ExpiresUtcHH 
=HH  
newHH! $
DateTimeOffsetHH% 3
(HH3 4
DateTimeHH4 <
.HH< =
NowHH= @
.HH@ A
AddDaysHHA H
(HHH I
$numHHI J
)HHJ K
)HHK L
}II 
;II 
awaitKK 
HttpContextKK !
.KK! "
SignInAsyncKK" -
(KK- .(
CookieAuthenticationDefaultsKK. J
.KKJ K 
AuthenticationSchemeKKK _
,KK_ `
newKKa d
ClaimsPrincipalKKe t
(KKt u
claimsIdentity	KKu ƒ
)
KKƒ „
,
KK„ …
authProperties
KK† ”
)
KK” •
;
KK• –

ModelStateMM 
.MM 
AddModelErrorMM (
(MM( )
$strMM) +
,MM+ ,
$"MM- /
$strMM/ W
{MMW X
retornoMMX _
.MM_ `
TokenMM` e
}MMe f
"MMf g
)MMg h
;MMh i
}NN 
catchOO 
(OO 
ApiExceptionOO 
exOO  "
)OO" #
{PP 

ModelStateQQ 
.QQ 
AddModelErrorQQ (
(QQ( )
$strQQ) +
,QQ+ ,
exQQ- /
.QQ/ 0
MessageQQ0 7
)QQ7 8
;QQ8 9
}RR 
catchSS 
(SS 
	ExceptionSS 
exSS 
)SS  
{TT 

ModelStateUU 
.UU 
AddModelErrorUU (
(UU( )
$strUU) +
,UU+ ,
exUU- /
.UU/ 0
MessageUU0 7
)UU7 8
;UU8 9
}VV 
returnWW 
ViewWW 
(WW 
)WW 
;WW 
}XX 	
publicZZ 
IActionResultZZ 
LogoutZZ #
(ZZ# $
)ZZ$ %
{[[ 	
return\\ 
View\\ 
(\\ 
)\\ 
;\\ 
}]] 	
[`` 	
HttpPost``	 
]`` 
publicaa 
asyncaa 
Taskaa 
<aa 
IActionResultaa '
>aa' (
Logout2aa) 0
(aa0 1
)aa1 2
{bb 	
awaitcc 
HttpContextcc 
.cc 
SignOutAsynccc *
(cc* +(
CookieAuthenticationDefaultscc+ G
.ccG H 
AuthenticationSchemeccH \
)cc\ ]
;cc] ^
returndd 
RedirectToActiondd #
(dd# $
$"dd$ &
{dd& '
nameofdd' -
(dd- .
Logardd. 3
)dd3 4
}dd4 5
"dd5 6
)dd6 7
;dd7 8
}ee 	
}ff 
}gg „
]C:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Handlers\BearerTokenMessageHandler.cs
	namespace		 	
curso		
 
.		 
mvc		 
.		 
web		 
.		 
Handlers		  
{

 
public 

class %
BearerTokenMessageHandler *
:+ ,
DelegatingHandler- >
{ 
private 
readonly  
IHttpContextAccessor - 
_httpContextAccessor. B
;B C
public %
BearerTokenMessageHandler (
(( ) 
IHttpContextAccessor) =
httpContextAccessor> Q
)Q R
{ 	 
_httpContextAccessor  
=! "
httpContextAccessor# 6
;6 7
} 	
	protected 
async 
override  
Task! %
<% &
HttpResponseMessage& 9
>9 :
	SendAsync; D
(D E
HttpRequestMessageE W
requestX _
,_ `
CancellationTokena r
cancellationToken	s „
)
„ …
{ 	
if 
( 
request 
? 
. 
Headers  
?  !
.! "
Authorization" /
!=0 2
null3 7
)7 8
{ 
var 
token 
=  
_httpContextAccessor 0
.0 1
HttpContext1 <
.< =
User= A
.A B
	FindFirstB K
(K L
$strL S
)S T
.T U
ValueU Z
;Z [
request 
. 
Headers 
.  
Authorization  -
=. /
new0 3%
AuthenticationHeaderValue4 M
(M N
requestN U
.U V
HeadersV ]
.] ^
Authorization^ k
.k l
Schemel r
,r s
tokent y
)y z
;z {
} 
return 
await 
base 
. 
	SendAsync '
(' (
request( /
,/ 0
cancellationToken1 B
)B C
;C D
} 	
} 
} Ä
bC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Models\Curso\ListarCursoViewModelOutput.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Models 
{ 
public 

class &
ListarCursoViewModelOutput +
{ 
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	Descricao 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Login 
{ 
get !
;! "
set# &
;& '
}( )
} 
}		 É
dC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Models\Curso\RegistrarCursoViewModelInput.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Models 
{ 
public 

class (
RegistrarCursoViewModelInput -
{ 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 7
)7 8
]8 9
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
public 
string 
	Descricao 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ±
eC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Models\Curso\RegistrarCursoViewModelOutput.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Models 
{ 
public 

class )
RegistrarCursoViewModelOutput .
{ 
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	Descricao 
{  !
get" %
;% &
set' *
;* +
}, -
} 
}		 ×
PC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Models\ErrorViewModel.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Models 
{ 
public 

class 
ErrorViewModel 
{ 
public 
string 
	RequestId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 
ShowRequestId !
=>" $
!% &
string& ,
., -
IsNullOrEmpty- :
(: ;
	RequestId; D
)D E
;E F
} 
}		 œ
]C:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Models\Usuario\LoginViewModelInput.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Models 
{ 
public 

class 
LoginViewModelInput $
{ 
public 
string 
Login 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Senha 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ’

^C:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Models\Usuario\LoginViewModelOutput.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Models 
. 
Usuario &
{ 
public 

class  
LoginViewModelOutput %
{ 
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
public (
LoginViewModelDetalhesOutput +
Usuario, 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
} 
public 

class (
LoginViewModelDetalhesOutput -
{		 
public

 
int

 
Codigo

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
string 
Login 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ƒ
hC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Models\Usuario\RegistrarUsuarioViewModelInput.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Models 
{ 
public 

class *
RegistrarUsuarioViewModelInput /
{ 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 8
)8 9
]9 :
public 
string 
Login 
{ 
get !
;! "
set# &
;& '
}( )
[

 	
Required

	 
(

 
ErrorMessage

 
=

  
$str

! 8
)

8 9
]

9 :
[ 	
EmailAddress	 
( 
ErrorMessage "
=# $
$str% 9
)9 :
]: ;
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 8
)8 9
]9 :
public 
string 
Senha 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Õ

BC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Program.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ‰	
QC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Services\ICursoService.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Services  
{ 
public 

	interface 
ICursoService "
{		 
[

 	
Post

	 
(

 
$str

 
)

 
]

  
[ 	
Headers	 
( 
$str (
)( )
]) *
Task 
< )
RegistrarCursoViewModelOutput *
>* +
	Registrar, 5
(5 6(
RegistrarCursoViewModelInput6 R
inputS X
)X Y
;Y Z
[ 	
Get	 
( 
$str 
) 
] 
[ 	
Headers	 
( 
$str (
)( )
]) *
Task 
< 
IList 
< &
ListarCursoViewModelOutput -
>- .
>. /
Listar0 6
(6 7
)7 8
;8 9
} 
} Ç
SC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Services\IUsuarioService.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
. 
Services  
{ 
public 

	interface 
IUsuarioService $
{		 
[

 	
Post

	 
(

 
$str

 )
)

) *
]

* +
Task 
< *
RegistrarUsuarioViewModelInput +
>+ ,
	Registrar- 6
(6 7*
RegistrarUsuarioViewModelInput7 U
inputV [
)[ \
;\ ]
[ 	
Post	 
( 
$str %
)% &
]& '
Task 
<  
LoginViewModelOutput !
>! "
Logar# (
(( )
LoginViewModelInput) <
input= B
)B C
;C D
} 
} Ø,
BC:\Users\wendr\OneDrive\Documentos\course\curso.mvc.web\Startup.cs
	namespace 	
curso
 
. 
mvc 
. 
web 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. #
AddControllersWithViews ,
(, -
)- .
;. /
services 
. "
AddHttpContextAccessor +
(+ ,
), -
;- .
var 
clientHandler 
= 
new  #
HttpClientHandler$ 5
{ 5
)ServerCertificateCustomValidationCallback   9
=  : ;
(  < =
sender  = C
,  C D
cert  E I
,  I J
chain  K P
,  P Q
sslPolicyErrors  R a
)  a b
=>  c e
{  f g
return  h n
true  o s
;  s t
}  u v
}!! 
;!! 
services## 
.## 
AddRefitClient## #
<### $
IUsuarioService##$ 3
>##3 4
(##4 5
)##5 6
.$$ 
ConfigureHttpClient$$ $
($$$ %
c$$% &
=>$$' )
{%% 
c&& 
.&& 
BaseAddress&& !
=&&" #
new&&$ '
Uri&&( +
(&&+ ,
Configuration&&, 9
.&&9 :
GetValue&&: B
<&&B C
string&&C I
>&&I J
(&&J K
$str&&K Y
)&&Y Z
)&&Z [
;&&[ \
}'' 
)'' 
.'' .
"ConfigurePrimaryHttpMessageHandler'' 5
(''5 6
c''6 7
=>''8 :
clientHandler''; H
)''H I
;''I J
services)) 
.)) 
AddTransient)) !
<))! "%
BearerTokenMessageHandler))" ;
>)); <
())< =
)))= >
;))> ?
services++ 
.++ 
AddRefitClient++ #
<++# $
ICursoService++$ 1
>++1 2
(++2 3
)++3 4
.,, !
AddHttpMessageHandler,, &
<,,& '%
BearerTokenMessageHandler,,' @
>,,@ A
(,,A B
),,B C
.-- 
ConfigureHttpClient-- $
(--$ %
c--% &
=>--' )
{.. 
c// 
.// 
BaseAddress// !
=//" #
new//$ '
Uri//( +
(//+ ,
Configuration//, 9
.//9 :
GetValue//: B
<//B C
string//C I
>//I J
(//J K
$str//K Y
)//Y Z
)//Z [
;//[ \
}00 
)00 
.00 .
"ConfigurePrimaryHttpMessageHandler00 5
(005 6
c006 7
=>008 :
clientHandler00; H
)00H I
;00I J
services22 
.22 
AddAuthentication22 &
(22& '(
CookieAuthenticationDefaults22' C
.22C D 
AuthenticationScheme22D X
)22X Y
.33 
	AddCookie33 
(33 
options33 
=>33 !
{44 
options55 
.55 
	LoginPath55 !
=55" #
$str55$ 4
;554 5
options66 
.66 
AccessDeniedPath66 (
=66) *
$str66+ ;
;66; <
}77 
)77 
;77 
}88 	
public;; 
void;; 
	Configure;; 
(;; 
IApplicationBuilder;; 1
app;;2 5
,;;5 6
IWebHostEnvironment;;7 J
env;;K N
);;N O
{<< 	
if== 
(== 
env== 
.== 
IsDevelopment== !
(==! "
)==" #
)==# $
{>> 
app?? 
.?? %
UseDeveloperExceptionPage?? -
(??- .
)??. /
;??/ 0
}@@ 
elseAA 
{BB 
appCC 
.CC 
UseExceptionHandlerCC '
(CC' (
$strCC( 5
)CC5 6
;CC6 7
appEE 
.EE 
UseHstsEE 
(EE 
)EE 
;EE 
}FF 
appGG 
.GG 
UseHttpsRedirectionGG #
(GG# $
)GG$ %
;GG% &
appHH 
.HH 
UseStaticFilesHH 
(HH 
)HH  
;HH  !
appJJ 
.JJ 

UseRoutingJJ 
(JJ 
)JJ 
;JJ 
appKK 
.KK 
UseAuthenticationKK !
(KK! "
)KK" #
;KK# $
appLL 
.LL 
UseAuthorizationLL  
(LL  !
)LL! "
;LL" #
appNN 
.NN 
UseEndpointsNN 
(NN 
	endpointsNN &
=>NN' )
{OO 
	endpointsPP 
.PP 
MapControllerRoutePP ,
(PP, -
nameQQ 
:QQ 
$strQQ #
,QQ# $
patternRR 
:RR 
$strRR E
)RRE F
;RRF G
}SS 
)SS 
;SS 
}TT 	
}UU 
}VV 