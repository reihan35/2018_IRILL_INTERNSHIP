// Generated by js_of_ocaml 3.0.1
(function(d){"use strict";var
at=" : flags Open_text and Open_binary are not compatible",O=".",as=224,aC="Sys_error",N="+",aK="Invalid_argument",w=1024,aJ="fs",R="jsError",aB=57343,aI=512,aH="End_of_file",r=" ",Q="e",aG="Failure",am="Undefined_recursive_module",aA=" : flags Open_rdonly and Open_wronly are not compatible",az="([^/]*)",s="-",ar="Stack_overflow",b="",ay=1.8,g=128,P="^",al=56320,av=" : file already exists",aw=240,ax=2048,p="0",f=248,F="erreur",ap="Not_found",aq="undefined",ak="Assert_failure",n="/",aE="Sys_blocked_io",aF="fd ",au="Out_of_memory",ao="Match_failure",an="static/",aD="Division_by_zero";function
X(d,e,c){var
b=new
Array(c);for(var
a=0;a<c;a++)b[a]=d[e+a];return b}function
W(c,d,a){var
e=String.fromCharCode;if(d==0&&a<=4096&&a==c.length)return e.apply(null,c);var
f=b;for(;0<a;d+=w,a-=w)f+=e.apply(null,X(c,d,Math.min(a,w)));return f}function
U(b){if(d.Uint8Array)var
c=new(d.Uint8Array)(b.l);else
var
c=new
Array(b.l);var
f=b.c,e=f.length,a=0;for(;a<e;a++)c[a]=f.charCodeAt(a);for(e=b.l;a<e;a++)c[a]=0;b.c=c;b.t=4;return c}function
t(d,e,b,f,c){if(c==0)return 0;if(f==0&&(c>=b.l||b.t==2&&c>=b.c.length)){b.c=d.t==4?W(d.c,e,c):e==0&&d.c.length==c?d.c:d.c.substr(e,c);b.t=b.c.length==b.l?0:2}else
if(b.t==2&&f==b.c.length){b.c+=d.t==4?W(d.c,e,c):e==0&&d.c.length==c?d.c:d.c.substr(e,c);b.t=b.c.length==b.l?0:2}else{if(b.t!=4)U(b);var
g=d.c,h=b.c;if(d.t==4)if(f<=e)for(var
a=0;a<c;a++)h[f+a]=g[e+a];else
for(var
a=c-1;a>=0;a--)h[f+a]=g[e+a];else{var
i=Math.min(c,g.length-e);for(var
a=0;a<i;a++)h[f+a]=g.charCodeAt(e+a);for(;a<c;a++)h[f+a]=0}}return 0}function
bQ(c,e){var
d=c.length,b=new
Array(d+1),a=0;for(;a<d;a++)b[a]=c[a];b[a]=e;return b}function
G(b,a){if(b.fun)return G(b.fun,a);var
c=b.length,d=a.length,e=c-d;if(e==0)return b.apply(null,a);else
if(e<0)return G(b.apply(null,X(a,0,c)),X(a,c,d-c));else
return function(c){return G(b,bQ(a,c))}}function
bF(c,a){if(a.repeat)return a.repeat(c);var
d=b,e=0;if(c==0)return d;for(;;){if(c&1)d+=a;c>>=1;if(c==0)return d;a+=a;e++;if(e==9)a.slice(0,1)}}function
aN(a){if(a.t==2)a.c+=bF(a.l-a.c.length,"\0");else
a.c=W(a.c,0,a.c.length);a.t=0}function
aP(a){if(a.length<24){for(var
b=0;b<a.length;b++)if(a.charCodeAt(b)>127)return false;return true}else
return!/[^\x00-\x7f]/.test(a)}function
bL(f){for(var
l=b,d=b,i,h,j,a,c=0,k=f.length;c<k;c++){h=f.charCodeAt(c);if(h<g){for(var
e=c+1;e<k&&(h=f.charCodeAt(e))<g;e++);if(e-c>aI){d.substr(0,1);l+=d;d=b;l+=f.slice(c,e)}else
d+=f.slice(c,e);if(e==k)break;c=e}a=1;if(++c<k&&((j=f.charCodeAt(c))&-64)==g){i=j+(h<<6);if(h<as){a=i-12416;if(a<g)a=1}else{a=2;if(++c<k&&((j=f.charCodeAt(c))&-64)==g){i=j+(i<<6);if(h<aw){a=i-925824;if(a<ax||a>=55295&&a<57344)a=2}else{a=3;if(++c<k&&((j=f.charCodeAt(c))&-64)==g&&h<245){a=j-63447168+(i<<6);if(a<65536||a>1114111)a=3}}}}}if(a<4){c-=a;d+="\ufffd"}else
if(a>65535)d+=String.fromCharCode(55232+(a>>10),al+(a&1023));else
d+=String.fromCharCode(a);if(d.length>w){d.substr(0,1);l+=d;d=b}}return l+d}function
bK(a){switch(a.t){case
9:return a.c;default:aN(a);case
0:if(aP(a.c)){a.t=9;return a.c}a.t=8;case
8:return bL(a.c)}}function
m(c,a,b){this.t=c;this.c=a;this.l=b}m.prototype.toString=function(){return bK(this)};function
bD(b,a){throw[0,b,a]}function
a(a){return new
m(0,a,a.length)}function
V(c,b){bD(c,a(b))}var
c=[0];function
H(a){V(c.Invalid_argument,a)}function
br(a){if(a<0)H("Bytes.create");return new
m(a?2:9,b,a)}function
bs(a){V(c.Failure,a)}function
T(a){if((a.t&6)!=0)aN(a);return a.c}function
aO(a){var
c;a=T(a);c=+a;if(a.length>0&&c===c)return c;a=a.replace(/_/g,b);c=+a;if(a.length>0&&c===c||/^[+-]?nan$/i.test(a))return c;var
d=/^ *([+-]?)0x([0-9a-f]+)\.?([0-9a-f]*)p([+-]?[0-9]+)/i.exec(a);if(d){var
e=d[3].replace(/0+$/,b),g=parseInt(d[1]+d[2]+e,16),f=(d[4]|0)-4*e.length;c=g*Math.pow(2,f);return c}if(/^\+?inf(inity)?$/i.test(a))return Infinity;if(/^-inf(inity)?$/i.test(a))return-Infinity;bs("float_of_string")}function
bB(d){d=T(d);var
e=d.length;if(e>31)H("format_int: format too long");var
a={justify:N,signstyle:s,filler:r,alternate:false,base:0,signedconv:false,width:0,uppercase:false,sign:1,prec:-1,conv:"f"};for(var
c=0;c<e;c++){var
b=d.charAt(c);switch(b){case"-":a.justify=s;break;case"+":case" ":a.signstyle=b;break;case"0":a.filler=p;break;case"#":a.alternate=true;break;case"1":case"2":case"3":case"4":case"5":case"6":case"7":case"8":case"9":a.width=0;while(b=d.charCodeAt(c)-48,b>=0&&b<=9){a.width=a.width*10+b;c++}c--;break;case".":a.prec=0;c++;while(b=d.charCodeAt(c)-48,b>=0&&b<=9){a.prec=a.prec*10+b;c++}c--;case"d":case"i":a.signedconv=true;case"u":a.base=10;break;case"x":a.base=16;break;case"X":a.base=16;a.uppercase=true;break;case"o":a.base=8;break;case"e":case"f":case"g":a.signedconv=true;a.conv=b;break;case"E":case"F":case"G":a.signedconv=true;a.uppercase=true;a.conv=b.toLowerCase();break}}return a}function
bt(c,g){if(c.uppercase)g=g.toUpperCase();var
f=g.length;if(c.signedconv&&(c.sign<0||c.signstyle!=s))f++;if(c.alternate){if(c.base==8)f+=1;if(c.base==16)f+=2}var
d=b;if(c.justify==N&&c.filler==r)for(var
e=f;e<c.width;e++)d+=r;if(c.signedconv)if(c.sign<0)d+=s;else
if(c.signstyle!=s)d+=c.signstyle;if(c.alternate&&c.base==8)d+=p;if(c.alternate&&c.base==16)d+="0x";if(c.justify==N&&c.filler==p)for(var
e=f;e<c.width;e++)d+=p;d+=g;if(c.justify==s)for(var
e=f;e<c.width;e++)d+=r;return a(d)}function
bu(i,c){var
a,e=bB(i),d=e.prec<0?6:e.prec;if(c<0||c==0&&1/c==-Infinity){e.sign=-1;c=-c}if(isNaN(c)){a="nan";e.filler=r}else
if(!isFinite(c)){a="inf";e.filler=r}else
switch(e.conv){case"e":var
a=c.toExponential(d),b=a.length;if(a.charAt(b-3)==Q)a=a.slice(0,b-1)+p+a.slice(b-1);break;case"f":a=c.toFixed(d);break;case"g":d=d?d:1;a=c.toExponential(d-1);var
h=a.indexOf(Q),g=+a.slice(h+1);if(g<-4||c>=1e+21||c.toFixed(0).length>d){var
b=h-1;while(a.charAt(b)==p)b--;if(a.charAt(b)==O)b--;a=a.slice(0,b+1)+a.slice(h);b=a.length;if(a.charAt(b-3)==Q)a=a.slice(0,b-1)+p+a.slice(b-1);break}else{var
f=d;if(g<0){f-=g+1;a=c.toFixed(f)}else
while(a=c.toFixed(f),a.length>d+1)f--;if(f){var
b=a.length-1;while(a.charAt(b)==p)b--;if(a.charAt(b)==O)b--;a=a.slice(0,b+1)}}break}return bt(e,a)}var
bA=0;function
y(){return bA++}function
bM(f){for(var
h=b,c=h,a,j,d=0,i=f.length;d<i;d++){a=f.charCodeAt(d);if(a<g){for(var
e=d+1;e<i&&(a=f.charCodeAt(e))<g;e++);if(e-d>aI){c.substr(0,1);h+=c;c=b;h+=f.slice(d,e)}else
c+=f.slice(d,e);if(e==i)break;d=e}if(a<ax){c+=String.fromCharCode(192|a>>6);c+=String.fromCharCode(g|a&63)}else
if(a<55296||a>=aB)c+=String.fromCharCode(as|a>>12,g|a>>6&63,g|a&63);else
if(a>=56319||d+1==i||(j=f.charCodeAt(d+1))<al||j>aB)c+="\xef\xbf\xbd";else{d++;a=(a<<10)+j-56613888;c+=String.fromCharCode(aw|a>>18,g|a>>12&63,g|a>>6&63,g|a&63)}if(c.length>w){c.substr(0,1);h+=c;c=b}}return h+c}function
z(a){var
b=9;if(!aP(a))b=8,a=bM(a);return new
m(b,a,a.length)}function
j(a){V(c.Sys_error,a)}var
o=new
Array();function
bw(e){var
a=o[e];if(!a.opened)j("Cannot flush a closed channel");if(!a.buffer||a.buffer==b)return 0;if(a.fd&&c.fds[a.fd]&&c.fds[a.fd].output){var
d=c.fds[a.fd].output;switch(d.length){case
2:d(e,a.buffer);break;default:d(a.buffer)}}a.buffer=b;return 0}if(d.process&&d.process.cwd)var
x=d.process.cwd().replace(/\\/g,n);else
var
x="/static";if(x.slice(-1)!==n)x+=n;function
bv(a){a=a
instanceof
m?a.toString():a;if(a.charCodeAt(0)!=47)a=x+a;var
e=a.split(n),c=[];for(var
d=0;d<e.length;d++)switch(e[d]){case"..":if(c.length>1)c.pop();break;case".":break;case"":if(c.length==0)c.push(b);break;default:c.push(e[d]);break}c.orig=a;return c}function
bC(a){a=a
instanceof
m?a.toString():a;j(a+": No such file or directory")}function
bG(a){return new
m(4,a,a.length)}function
aV(){H("index out of bounds")}function
bI(a,b){switch(a.t&6){default:if(b>=a.c.length)return 0;case
0:return a.c.charCodeAt(b);case
4:return a.c[b]}}function
aW(b,a){if(a>>>0>=b.l)aV();return bI(b,a)}function
u(a){if(a<0)H("String.create");return new
m(a?2:9,b,a)}function
A(a){return a.l}function
aL(){}function
e(a){this.data=a}e.prototype=new
aL();e.prototype.truncate=function(a){var
b=this.data;this.data=u(a|0);t(b,0,this.data,0,a)};e.prototype.length=function(){return A(this.data)};e.prototype.write=function(b,d,g,a){var
c=this.length();if(b+a>=c){var
e=u(b+a),f=this.data;this.data=e;t(f,0,this.data,0,c)}t(d,g,this.data,b,a);return 0};e.prototype.read=function(c,a,d,b){var
e=this.length();t(this.data,c,a,d,b);return 0};e.prototype.read_one=function(a){return aW(this.data,a)};e.prototype.close=function(){};e.prototype.constructor=e;function
h(b,a){this.content={};this.root=b;this.lookupFun=a}h.prototype.nm=function(a){return this.root+a};h.prototype.lookup=function(b){if(!this.content[b]&&this.lookupFun){var
c=this.lookupFun(a(this.root),a(b));if(c!=0)this.content[b]=new
e(c[1])}};h.prototype.exists=function(a){if(a==b)return 1;var
d=a+n,e=new
RegExp(P+d);for(var
c
in
this.content)if(c.match(e))return 1;this.lookup(a);return this.content[a]?1:0};h.prototype.readdir=function(d){var
g=d==b?b:d+n,h=new
RegExp(P+g+az),e={},c=[];for(var
f
in
this.content){var
a=f.match(h);if(a&&!e[a[1]]){e[a[1]]=true;c.push(a[1])}}return c};h.prototype.is_dir=function(a){var
e=a==b?b:a+n,f=new
RegExp(P+e+az),g=[];for(var
d
in
this.content){var
c=d.match(f);if(c)return 1}return 0};h.prototype.unlink=function(a){var
b=this.content[a]?true:false;delete
this.content[a];return b};h.prototype.open=function(a,b){if(b.rdonly&&b.wronly)j(this.nm(a)+aA);if(b.text&&b.binary)j(this.nm(a)+at);this.lookup(a);if(this.content[a]){if(this.is_dir(a))j(this.nm(a)+" : is a directory");if(b.create&&b.excl)j(this.nm(a)+av);var
c=this.content[a];if(b.truncate)c.truncate();return c}else
if(b.create){this.content[a]=new
e(u(0));return this.content[a]}else
bC(this.nm(a))};h.prototype.register=function(c,b){if(this.content[c])j(this.nm(c)+av);if(b
instanceof
m)this.content[c]=new
e(b);else
if(b
instanceof
Array)this.content[c]=new
e(bG(b));else
if(b.toString){var
d=a(b.toString());this.content[c]=new
e(d)}};h.prototype.constructor=h;function
aM(a){if(a.t!=4)U(a);return a.c}function
bJ(a,c,b){b&=255;if(a.t!=4){if(c==a.c.length){a.c+=String.fromCharCode(b);if(c+1==a.l)a.t=0;return 0}U(a)}a.c[c]=b;return 0}function
bH(b,a,c){if(a>>>0>=b.l)aV();return bJ(b,a,c)}var
S=d.Buffer;function
l(a){this.fs=require(aJ);this.fd=a}l.prototype=new
aL();l.prototype.truncate=function(a){this.fs.ftruncateSync(this.fd,a|0)};l.prototype.length=function(){return this.fs.fstatSync(this.fd).size};l.prototype.write=function(g,b,c,f){var
a=aM(b);if(!a
instanceof
d.Uint8Array)a=new(d.Uint8Array)(a);var
e=new
S(a);this.fs.writeSync(this.fd,e,c,f,g);return 0};l.prototype.read=function(h,e,c,g){var
a=aM(e);if(!(a
instanceof
d.Uint8Array))a=new(d.Uint8Array)(a);var
f=new
S(a);this.fs.readSync(this.fd,f,c,g,h);for(var
b=0;b<g;b++)bH(e,c+b,f[c+b]);return 0};l.prototype.read_one=function(c){var
b=new(d.Uint8Array)(1),a=new
S(b);this.fs.readSync(this.fd,a,0,1,c);return a[0]};l.prototype.close=function(){this.fs.closeSync(this.fd)};l.prototype.constructor=l;function
k(a){this.fs=require(aJ);this.root=a}k.prototype.nm=function(a){return this.root+a};k.prototype.exists=function(a){return this.fs.existsSync(this.nm(a))?1:0};k.prototype.readdir=function(a){return this.fs.readdirSync(this.nm(a))};k.prototype.is_dir=function(a){return this.fs.statSync(this.nm(a)).isDirectory()?1:0};k.prototype.unlink=function(a){var
b=this.fs.existsSync(this.nm(a))?1:0;this.fs.unlinkSync(this.nm(a));return b};k.prototype.open=function(f,c){var
a=require("constants"),b=0;for(var
e
in
c)switch(e){case"rdonly":b|=a.O_RDONLY;break;case"wronly":b|=a.O_WRONLY;break;case"append":b|=a.O_WRONLY|a.O_APPEND;break;case"create":b|=a.O_CREAT;break;case"truncate":b|=a.O_TRUNC;break;case"excl":b|=a.O_EXCL;break;case"binary":b|=a.O_BINARY;break;case"text":b|=a.O_TEXT;break;case"nonblock":b|=a.O_NONBLOCK;break}var
d=this.fs.openSync(this.nm(f),b);return new
l(d)};k.prototype.rename=function(b,a){this.fs.renameSync(this.nm(b),this.nm(a))};k.prototype.constructor=k;var
v=x.match(/[^\/]*\//)[0],B=[];if(typeof
module!==aq&&module.exports&&typeof
require!==aq)B.push({path:v,device:new
k(v)});else
B.push({path:v,device:new
h(v)});B.push({path:v+an,device:new
h(v+an)});function
bR(b){var
f=bv(b),b=f.join(n),e=b+n,c;for(var
d=0;d<B.length;d++){var
a=B[d];if(e.search(a.path)==0&&(!c||c.path.length<a.path.length))c={path:a.path,device:a.device,rest:b.substring(a.path.length,b.length)}}return c}function
aU(e,f){var
b=o[e],d=a(f),c=A(d);b.file.write(b.offset,d,0,c);b.offset+=c;return 0}function
bO(a){var
b=d;if(b.process&&b.process.stdout&&b.process.stdout.write)b.process.stderr.write(a);else{if(a.charCodeAt(a.length-1)==10)a=a.substr(0,a.length-1);var
c=b.console;c&&c.error&&c.error(a)}}function
bP(a){var
b=d;if(b.process&&b.process.stdout&&b.process.stdout.write)b.process.stdout.write(a);else{if(a.charCodeAt(a.length-1)==10)a=a.substr(0,a.length-1);var
c=b.console;c&&c.log&&c.log(a)}}function
I(d,f,e,a){if(c.fds===undefined)c.fds=new
Array();a=a?a:{};var
b={};b.file=e;b.offset=a.append?e.length():0;b.flags=a;b.output=f;c.fds[d]=b;if(!c.fd_last_idx||d>c.fd_last_idx)c.fd_last_idx=d;return d}function
bS(d,b,h){var
a={};while(b){switch(b[1]){case
0:a.rdonly=1;break;case
1:a.wronly=1;break;case
2:a.append=1;break;case
3:a.create=1;break;case
4:a.truncate=1;break;case
5:a.excl=1;break;case
6:a.binary=1;break;case
7:a.text=1;break;case
8:a.nonblock=1;break}b=b[2]}if(a.rdonly&&a.wronly)j(d.toString()+aA);if(a.text&&a.binary)j(d.toString()+at);var
e=bR(d),f=e.device.open(e.rest,a),g=c.fd_last_idx?c.fd_last_idx:0;return I(g+1,aU,f,a)}I(0,aU,new
e(u(0)));I(1,bP,new
e(u(0)));I(2,bO,new
e(u(0)));function
bx(d){var
b=c.fds[d];if(b.flags.wronly)j(aF+d+" is writeonly");var
a={file:b.file,offset:b.offset,fd:d,opened:true,out:false,refill:null};o[a.fd]=a;return a.fd}function
aQ(e){var
d=c.fds[e];if(d.flags.rdonly)j(aF+e+" is readonly");var
a={file:d.file,offset:d.offset,fd:e,opened:true,out:true,buffer:b};o[a.fd]=a;return a.fd}function
by(){var
b=0;for(var
a=0;a<o.length;a++)if(o[a]&&o[a].opened&&o[a].out)b=[0,o[a].fd,b];return b}function
bz(a){return a
instanceof
Array?a[0]:a
instanceof
m?252:1e3}function
i(d,b,a){c[d+1]=b;if(a)c[a]=b}var
aS={};function
bE(a,b){aS[T(a)]=b;return 0}function
aT(a){return a}function
aR(a){return aS[a]}function
bN(a){if(a
instanceof
Array)return a;if(d.RangeError&&a
instanceof
d.RangeError&&a.message&&a.message.match(/maximum call stack/i))return aT(c.Stack_overflow);if(d.InternalError&&a
instanceof
d.InternalError&&a.message&&a.message.match(/too much recursion/i))return aT(c.Stack_overflow);if(a
instanceof
d.Error&&aR(R))return[0,aR(R),a];return[0,c.Failure,z(String(a))]}function
M(a,b){return a.length==1?a(b):G(a,[b])}var
_=[f,a(aC),-2],Y=[f,a(aG),-3],$=[f,a(ap),-7];i(11,[f,a(am),-12],am);i(10,[f,a(ak),-11],ak);i(9,[f,a(aE),-10],aE);i(8,[f,a(ar),-9],ar);i(7,[f,a(ao),-8],ao);i(6,$,ap);i(5,[f,a(aD),-6],aD);i(4,[f,a(aH),-5],aH);i(3,[f,a(aK),-4],aK);i(2,Y,aG);i(1,_,aC);i(0,[f,a(au),-1],au);var
aY=a("%.12g"),aX=a(O),a3=a("Js.Error"),a6=a("input"),a5=a("button"),bo=a("\xc2\xb0C"),bn=a("\xc2\xb0F"),bl=a(F),bg=a(F),bc=a(F),a9=a(F),a7=a("clickme"),a_=a("count"),ba=a("textF"),be=a("clickme2"),bh=a("count2"),bj=a("textF2");function
C(a){throw[0,Y,a]}y(0);function
J(d,c){var
a=A(d),e=A(c),b=br(a+e|0);t(d,0,b,0,a);t(c,0,b,a,e);return b}function
Z(e){var
b=bu(aY,e),a=0,d=A(b);for(;;){if(d<=a)return J(b,aX);var
c=aW(b,a),f=48<=c?58<=c?0:1:45===c?1:0;if(f){var
a=a+1|0;continue}return b}}bx(0);aQ(1);aQ(2);y(0);y(0);var
aa=[0,0];function
ab(a){aa[1]=[0,a,aa[1]];return 0}var
K=d,D=null,a1=undefined;function
E(a,b){return a==D?M(b,0):a}var
ac=true,a2=K.Array,ad=[f,a3,y(0)],L=[0,ad,{}],a0=bz(L)===f?L:L[1];bE(a(R),a0);(function(a){throw a});ab(function(a){return a[1]===ad?[0,z(a[2].toString())]:0});ab(function(a){return a
instanceof
a2?0:[0,z(a.toString())]});function
ae(c){return function(a){if(1-(a==D?1:0)){var
d=M(c,a);if(1-(d|0))a.preventDefault();return d}var
e=event,b=M(c,e);if(1-(b|0))e.returnValue=b;return b}}var
a4=K.document;function
q(b){var
a=a4.getElementById(b.toString());if(a==D)throw $;return a}y(0);K.HTMLElement===a1;function
af(b,a){var
c=b.toString();return a.tagName.toLowerCase()===c?a:D}function
ag(a){return af(a5,a)}function
ah(a){return af(a6,a)}var
ai=q(a7),a8=ag(ai);E(a8,function(a){return C(a9)});var
a$=q(a_),bb=ah(q(ba)),bd=E(bb,function(a){return C(bc)}),aj=q(be),bf=ag(aj);E(bf,function(a){return C(bg)});var
bi=q(bh),bk=ah(q(bj)),bm=E(bk,function(a){return C(bl)}),bp=ae(function(a){a$.innerHTML=J(Z(aO(z(bd.value))*ay+32),bn).toString();return ac}),bq=ae(function(a){bi.innerHTML=J(Z((aO(z(bm.value))-32)/ay),bo).toString();return ac});ai.onclick=bp;aj.onclick=bq;function
aZ(b){var
a=b;for(;;){if(a){var
c=a[2],d=a[1];try{bw(d)}catch(a){a=bN(a);if(a[1]!==_)throw a}var
a=c;continue}return 0}}aZ(by(0));return}(function(){return this}()));