// Generated by js_of_ocaml 3.0.1
(function(d){"use strict";var
au=" : flags Open_text and Open_binary are not compatible",af="Sys_error",K=".",at=224,J="+",as="Invalid_argument",w=1024,ar="fs",M="jsError",ae=57343,aq=512,ap="End_of_file",I="e",r=" ",ao="Failure",ac="Undefined_recursive_module",ad=" : flags Open_rdonly and Open_wronly are not compatible",ab="([^/]*)",q="-",an="Stack_overflow",g=128,c="",L="^",Z=" : file already exists",_=56320,$=240,aa=2048,p="0",f=248,al="Not_found",am="undefined",Y="Assert_failure",n="/",aj="Sys_blocked_io",ak="fd ",X="Out_of_memory",ai="Match_failure",ag="Division_by_zero",ah="static/";function
bh(d,e,c){var
b=new
Array(c);for(var
a=0;a<c;a++)b[a]=d[e+a];return b}function
Q(b,d,a){var
e=String.fromCharCode;if(d==0&&a<=4096&&a==b.length)return e.apply(null,b);var
f=c;for(;0<a;d+=w,a-=w)f+=e.apply(null,bh(b,d,Math.min(a,w)));return f}function
O(b){if(d.Uint8Array)var
c=new(d.Uint8Array)(b.l);else
var
c=new
Array(b.l);var
f=b.c,e=f.length,a=0;for(;a<e;a++)c[a]=f.charCodeAt(a);for(e=b.l;a<e;a++)c[a]=0;b.c=c;b.t=4;return c}function
s(d,e,b,f,c){if(c==0)return 0;if(f==0&&(c>=b.l||b.t==2&&c>=b.c.length)){b.c=d.t==4?Q(d.c,e,c):e==0&&d.c.length==c?d.c:d.c.substr(e,c);b.t=b.c.length==b.l?0:2}else
if(b.t==2&&f==b.c.length){b.c+=d.t==4?Q(d.c,e,c):e==0&&d.c.length==c?d.c:d.c.substr(e,c);b.t=b.c.length==b.l?0:2}else{if(b.t!=4)O(b);var
g=d.c,h=b.c;if(d.t==4)if(f<=e)for(var
a=0;a<c;a++)h[f+a]=g[e+a];else
for(var
a=c-1;a>=0;a--)h[f+a]=g[e+a];else{var
i=Math.min(c,g.length-e);for(var
a=0;a<i;a++)h[f+a]=g.charCodeAt(e+a);for(;a<c;a++)h[f+a]=0}}return 0}function
a8(b,a){if(a.repeat)return a.repeat(b);var
d=c,e=0;if(b==0)return d;for(;;){if(b&1)d+=a;b>>=1;if(b==0)return d;a+=a;e++;if(e==9)a.slice(0,1)}}function
ay(a){if(a.t==2)a.c+=a8(a.l-a.c.length,"\0");else
a.c=Q(a.c,0,a.c.length);a.t=0}function
az(a){if(a.length<24){for(var
b=0;b<a.length;b++)if(a.charCodeAt(b)>127)return false;return true}else
return!/[^\x00-\x7f]/.test(a)}function
bc(f){for(var
l=c,d=c,i,h,j,a,b=0,k=f.length;b<k;b++){h=f.charCodeAt(b);if(h<g){for(var
e=b+1;e<k&&(h=f.charCodeAt(e))<g;e++);if(e-b>aq){d.substr(0,1);l+=d;d=c;l+=f.slice(b,e)}else
d+=f.slice(b,e);if(e==k)break;b=e}a=1;if(++b<k&&((j=f.charCodeAt(b))&-64)==g){i=j+(h<<6);if(h<at){a=i-12416;if(a<g)a=1}else{a=2;if(++b<k&&((j=f.charCodeAt(b))&-64)==g){i=j+(i<<6);if(h<$){a=i-925824;if(a<aa||a>=55295&&a<57344)a=2}else{a=3;if(++b<k&&((j=f.charCodeAt(b))&-64)==g&&h<245){a=j-63447168+(i<<6);if(a<65536||a>1114111)a=3}}}}}if(a<4){b-=a;d+="\ufffd"}else
if(a>65535)d+=String.fromCharCode(55232+(a>>10),_+(a&1023));else
d+=String.fromCharCode(a);if(d.length>w){d.substr(0,1);l+=d;d=c}}return l+d}function
bb(a){switch(a.t){case
9:return a.c;default:ay(a);case
0:if(az(a.c)){a.t=9;return a.c}a.t=8;case
8:return bc(a.c)}}function
m(c,a,b){this.t=c;this.c=a;this.l=b}m.prototype.toString=function(){return bb(this)};function
a6(b,a){throw[0,b,a]}function
a(a){return new
m(0,a,a.length)}function
aD(c,b){a6(c,a(b))}var
b=[0];function
D(a){aD(b.Invalid_argument,a)}function
aV(a){if(a<0)D("Bytes.create");return new
m(a?2:9,c,a)}function
ax(a){if((a.t&6)!=0)ay(a);return a.c}function
a4(d){d=ax(d);var
e=d.length;if(e>31)D("format_int: format too long");var
a={justify:J,signstyle:q,filler:r,alternate:false,base:0,signedconv:false,width:0,uppercase:false,sign:1,prec:-1,conv:"f"};for(var
c=0;c<e;c++){var
b=d.charAt(c);switch(b){case"-":a.justify=q;break;case"+":case" ":a.signstyle=b;break;case"0":a.filler=p;break;case"#":a.alternate=true;break;case"1":case"2":case"3":case"4":case"5":case"6":case"7":case"8":case"9":a.width=0;while(b=d.charCodeAt(c)-48,b>=0&&b<=9){a.width=a.width*10+b;c++}c--;break;case".":a.prec=0;c++;while(b=d.charCodeAt(c)-48,b>=0&&b<=9){a.prec=a.prec*10+b;c++}c--;case"d":case"i":a.signedconv=true;case"u":a.base=10;break;case"x":a.base=16;break;case"X":a.base=16;a.uppercase=true;break;case"o":a.base=8;break;case"e":case"f":case"g":a.signedconv=true;a.conv=b;break;case"E":case"F":case"G":a.signedconv=true;a.uppercase=true;a.conv=b.toLowerCase();break}}return a}function
aW(b,g){if(b.uppercase)g=g.toUpperCase();var
f=g.length;if(b.signedconv&&(b.sign<0||b.signstyle!=q))f++;if(b.alternate){if(b.base==8)f+=1;if(b.base==16)f+=2}var
d=c;if(b.justify==J&&b.filler==r)for(var
e=f;e<b.width;e++)d+=r;if(b.signedconv)if(b.sign<0)d+=q;else
if(b.signstyle!=q)d+=b.signstyle;if(b.alternate&&b.base==8)d+=p;if(b.alternate&&b.base==16)d+="0x";if(b.justify==J&&b.filler==p)for(var
e=f;e<b.width;e++)d+=p;d+=g;if(b.justify==q)for(var
e=f;e<b.width;e++)d+=r;return a(d)}function
aX(i,c){var
a,e=a4(i),d=e.prec<0?6:e.prec;if(c<0||c==0&&1/c==-Infinity){e.sign=-1;c=-c}if(isNaN(c)){a="nan";e.filler=r}else
if(!isFinite(c)){a="inf";e.filler=r}else
switch(e.conv){case"e":var
a=c.toExponential(d),b=a.length;if(a.charAt(b-3)==I)a=a.slice(0,b-1)+p+a.slice(b-1);break;case"f":a=c.toFixed(d);break;case"g":d=d?d:1;a=c.toExponential(d-1);var
h=a.indexOf(I),g=+a.slice(h+1);if(g<-4||c>=1e+21||c.toFixed(0).length>d){var
b=h-1;while(a.charAt(b)==p)b--;if(a.charAt(b)==K)b--;a=a.slice(0,b+1)+a.slice(h);b=a.length;if(a.charAt(b-3)==I)a=a.slice(0,b-1)+p+a.slice(b-1);break}else{var
f=d;if(g<0){f-=g+1;a=c.toFixed(f)}else
while(a=c.toFixed(f),a.length>d+1)f--;if(f){var
b=a.length-1;while(a.charAt(b)==p)b--;if(a.charAt(b)==K)b--;a=a.slice(0,b+1)}}break}return aW(e,a)}var
a3=0;function
y(){return a3++}function
bd(f){for(var
h=c,b=h,a,j,d=0,i=f.length;d<i;d++){a=f.charCodeAt(d);if(a<g){for(var
e=d+1;e<i&&(a=f.charCodeAt(e))<g;e++);if(e-d>aq){b.substr(0,1);h+=b;b=c;h+=f.slice(d,e)}else
b+=f.slice(d,e);if(e==i)break;d=e}if(a<aa){b+=String.fromCharCode(192|a>>6);b+=String.fromCharCode(g|a&63)}else
if(a<55296||a>=ae)b+=String.fromCharCode(at|a>>12,g|a>>6&63,g|a&63);else
if(a>=56319||d+1==i||(j=f.charCodeAt(d+1))<_||j>ae)b+="\xef\xbf\xbd";else{d++;a=(a<<10)+j-56613888;b+=String.fromCharCode($|a>>18,g|a>>12&63,g|a>>6&63,g|a&63)}if(b.length>w){b.substr(0,1);h+=b;b=c}}return h+b}function
P(a){var
b=9;if(!az(a))b=8,a=bd(a);return new
m(b,a,a.length)}function
j(a){aD(b.Sys_error,a)}var
o=new
Array();function
aZ(e){var
a=o[e];if(!a.opened)j("Cannot flush a closed channel");if(!a.buffer||a.buffer==c)return 0;if(a.fd&&b.fds[a.fd]&&b.fds[a.fd].output){var
d=b.fds[a.fd].output;switch(d.length){case
2:d(e,a.buffer);break;default:d(a.buffer)}}a.buffer=c;return 0}if(d.process&&d.process.cwd)var
x=d.process.cwd().replace(/\\/g,n);else
var
x="/static";if(x.slice(-1)!==n)x+=n;function
aY(a){a=a
instanceof
m?a.toString():a;if(a.charCodeAt(0)!=47)a=x+a;var
e=a.split(n),b=[];for(var
d=0;d<e.length;d++)switch(e[d]){case"..":if(b.length>1)b.pop();break;case".":break;case"":if(b.length==0)b.push(c);break;default:b.push(e[d]);break}b.orig=a;return b}function
a5(a){a=a
instanceof
m?a.toString():a;j(a+": No such file or directory")}function
a9(a){return new
m(4,a,a.length)}function
aG(){D("index out of bounds")}function
a$(a,b){switch(a.t&6){default:if(b>=a.c.length)return 0;case
0:return a.c.charCodeAt(b);case
4:return a.c[b]}}function
aH(b,a){if(a>>>0>=b.l)aG();return a$(b,a)}function
t(a){if(a<0)D("String.create");return new
m(a?2:9,c,a)}function
z(a){return a.l}function
av(){}function
e(a){this.data=a}e.prototype=new
av();e.prototype.truncate=function(a){var
b=this.data;this.data=t(a|0);s(b,0,this.data,0,a)};e.prototype.length=function(){return z(this.data)};e.prototype.write=function(b,d,g,a){var
c=this.length();if(b+a>=c){var
e=t(b+a),f=this.data;this.data=e;s(f,0,this.data,0,c)}s(d,g,this.data,b,a);return 0};e.prototype.read=function(c,a,d,b){var
e=this.length();s(this.data,c,a,d,b);return 0};e.prototype.read_one=function(a){return aH(this.data,a)};e.prototype.close=function(){};e.prototype.constructor=e;function
h(b,a){this.content={};this.root=b;this.lookupFun=a}h.prototype.nm=function(a){return this.root+a};h.prototype.lookup=function(b){if(!this.content[b]&&this.lookupFun){var
c=this.lookupFun(a(this.root),a(b));if(c!=0)this.content[b]=new
e(c[1])}};h.prototype.exists=function(a){if(a==c)return 1;var
d=a+n,e=new
RegExp(L+d);for(var
b
in
this.content)if(b.match(e))return 1;this.lookup(a);return this.content[a]?1:0};h.prototype.readdir=function(d){var
g=d==c?c:d+n,h=new
RegExp(L+g+ab),e={},b=[];for(var
f
in
this.content){var
a=f.match(h);if(a&&!e[a[1]]){e[a[1]]=true;b.push(a[1])}}return b};h.prototype.is_dir=function(a){var
e=a==c?c:a+n,f=new
RegExp(L+e+ab),g=[];for(var
d
in
this.content){var
b=d.match(f);if(b)return 1}return 0};h.prototype.unlink=function(a){var
b=this.content[a]?true:false;delete
this.content[a];return b};h.prototype.open=function(a,b){if(b.rdonly&&b.wronly)j(this.nm(a)+ad);if(b.text&&b.binary)j(this.nm(a)+au);this.lookup(a);if(this.content[a]){if(this.is_dir(a))j(this.nm(a)+" : is a directory");if(b.create&&b.excl)j(this.nm(a)+Z);var
c=this.content[a];if(b.truncate)c.truncate();return c}else
if(b.create){this.content[a]=new
e(t(0));return this.content[a]}else
a5(this.nm(a))};h.prototype.register=function(c,b){if(this.content[c])j(this.nm(c)+Z);if(b
instanceof
m)this.content[c]=new
e(b);else
if(b
instanceof
Array)this.content[c]=new
e(a9(b));else
if(b.toString){var
d=a(b.toString());this.content[c]=new
e(d)}};h.prototype.constructor=h;function
aw(a){if(a.t!=4)O(a);return a.c}function
ba(a,c,b){b&=255;if(a.t!=4){if(c==a.c.length){a.c+=String.fromCharCode(b);if(c+1==a.l)a.t=0;return 0}O(a)}a.c[c]=b;return 0}function
a_(b,a,c){if(a>>>0>=b.l)aG();return ba(b,a,c)}var
N=d.Buffer;function
l(a){this.fs=require(ar);this.fd=a}l.prototype=new
av();l.prototype.truncate=function(a){this.fs.ftruncateSync(this.fd,a|0)};l.prototype.length=function(){return this.fs.fstatSync(this.fd).size};l.prototype.write=function(g,b,c,f){var
a=aw(b);if(!a
instanceof
d.Uint8Array)a=new(d.Uint8Array)(a);var
e=new
N(a);this.fs.writeSync(this.fd,e,c,f,g);return 0};l.prototype.read=function(h,e,c,g){var
a=aw(e);if(!(a
instanceof
d.Uint8Array))a=new(d.Uint8Array)(a);var
f=new
N(a);this.fs.readSync(this.fd,f,c,g,h);for(var
b=0;b<g;b++)a_(e,c+b,f[c+b]);return 0};l.prototype.read_one=function(c){var
b=new(d.Uint8Array)(1),a=new
N(b);this.fs.readSync(this.fd,a,0,1,c);return a[0]};l.prototype.close=function(){this.fs.closeSync(this.fd)};l.prototype.constructor=l;function
k(a){this.fs=require(ar);this.root=a}k.prototype.nm=function(a){return this.root+a};k.prototype.exists=function(a){return this.fs.existsSync(this.nm(a))?1:0};k.prototype.readdir=function(a){return this.fs.readdirSync(this.nm(a))};k.prototype.is_dir=function(a){return this.fs.statSync(this.nm(a)).isDirectory()?1:0};k.prototype.unlink=function(a){var
b=this.fs.existsSync(this.nm(a))?1:0;this.fs.unlinkSync(this.nm(a));return b};k.prototype.open=function(f,c){var
a=require("constants"),b=0;for(var
e
in
c)switch(e){case"rdonly":b|=a.O_RDONLY;break;case"wronly":b|=a.O_WRONLY;break;case"append":b|=a.O_WRONLY|a.O_APPEND;break;case"create":b|=a.O_CREAT;break;case"truncate":b|=a.O_TRUNC;break;case"excl":b|=a.O_EXCL;break;case"binary":b|=a.O_BINARY;break;case"text":b|=a.O_TEXT;break;case"nonblock":b|=a.O_NONBLOCK;break}var
d=this.fs.openSync(this.nm(f),b);return new
l(d)};k.prototype.rename=function(b,a){this.fs.renameSync(this.nm(b),this.nm(a))};k.prototype.constructor=k;var
u=x.match(/[^\/]*\//)[0],A=[];if(typeof
module!==am&&module.exports&&typeof
require!==am)A.push({path:u,device:new
k(u)});else
A.push({path:u,device:new
h(u)});A.push({path:u+ah,device:new
h(u+ah)});function
bi(b){var
f=aY(b),b=f.join(n),e=b+n,c;for(var
d=0;d<A.length;d++){var
a=A[d];if(e.search(a.path)==0&&(!c||c.path.length<a.path.length))c={path:a.path,device:a.device,rest:b.substring(a.path.length,b.length)}}return c}function
aF(e,f){var
b=o[e],d=a(f),c=z(d);b.file.write(b.offset,d,0,c);b.offset+=c;return 0}function
bf(a){var
b=d;if(b.process&&b.process.stdout&&b.process.stdout.write)b.process.stderr.write(a);else{if(a.charCodeAt(a.length-1)==10)a=a.substr(0,a.length-1);var
c=b.console;c&&c.error&&c.error(a)}}function
bg(a){var
b=d;if(b.process&&b.process.stdout&&b.process.stdout.write)b.process.stdout.write(a);else{if(a.charCodeAt(a.length-1)==10)a=a.substr(0,a.length-1);var
c=b.console;c&&c.log&&c.log(a)}}function
E(d,f,e,a){if(b.fds===undefined)b.fds=new
Array();a=a?a:{};var
c={};c.file=e;c.offset=a.append?e.length():0;c.flags=a;c.output=f;b.fds[d]=c;if(!b.fd_last_idx||d>b.fd_last_idx)b.fd_last_idx=d;return d}function
bj(d,c,h){var
a={};while(c){switch(c[1]){case
0:a.rdonly=1;break;case
1:a.wronly=1;break;case
2:a.append=1;break;case
3:a.create=1;break;case
4:a.truncate=1;break;case
5:a.excl=1;break;case
6:a.binary=1;break;case
7:a.text=1;break;case
8:a.nonblock=1;break}c=c[2]}if(a.rdonly&&a.wronly)j(d.toString()+ad);if(a.text&&a.binary)j(d.toString()+au);var
e=bi(d),f=e.device.open(e.rest,a),g=b.fd_last_idx?b.fd_last_idx:0;return E(g+1,aF,f,a)}E(0,aF,new
e(t(0)));E(1,bg,new
e(t(0)));E(2,bf,new
e(t(0)));function
a0(d){var
c=b.fds[d];if(c.flags.wronly)j(ak+d+" is writeonly");var
a={file:c.file,offset:c.offset,fd:d,opened:true,out:false,refill:null};o[a.fd]=a;return a.fd}function
aA(e){var
d=b.fds[e];if(d.flags.rdonly)j(ak+e+" is readonly");var
a={file:d.file,offset:d.offset,fd:e,opened:true,out:true,buffer:c};o[a.fd]=a;return a.fd}function
a1(){var
b=0;for(var
a=0;a<o.length;a++)if(o[a]&&o[a].opened&&o[a].out)b=[0,o[a].fd,b];return b}function
a2(a){return a
instanceof
Array?a[0]:a
instanceof
m?252:1e3}function
i(d,c,a){b[d+1]=c;if(a)b[a]=c}var
aC={};function
a7(a,b){aC[ax(a)]=b;return 0}function
aE(a){return a}function
aB(a){return aC[a]}function
be(a){if(a
instanceof
Array)return a;if(d.RangeError&&a
instanceof
d.RangeError&&a.message&&a.message.match(/maximum call stack/i))return aE(b.Stack_overflow);if(d.InternalError&&a
instanceof
d.InternalError&&a.message&&a.message.match(/too much recursion/i))return aE(b.Stack_overflow);if(a
instanceof
d.Error&&aB(M))return[0,aB(M),a];return[0,b.Failure,P(String(a))]}var
S=[f,a(af),-2];i(11,[f,a(ac),-12],ac);i(10,[f,a(Y),-11],Y);i(9,[f,a(aj),-10],aj);i(8,[f,a(an),-9],an);i(7,[f,a(ai),-8],ai);i(6,[f,a(al),-7],al);i(5,[f,a(ag),-6],ag);i(4,[f,a(ap),-5],ap);i(3,[f,a(as),-4],as);i(2,[f,a(ao),-3],ao);i(1,S,af);i(0,[f,a(X),-1],X);y(0);var
aK=a("%.12g"),aJ=a(K),aQ=a("Js.Error"),aS=a(".ms"),aT=a("It took ");function
F(d,c){var
a=z(d),e=z(c),b=aV(a+e|0);s(d,0,b,0,a);s(c,0,b,a,e);return b}a0(0);aA(1);aA(2);y(0);y(0);var
T=[0,0];function
U(a){T[1]=[0,a,T[1]];return 0}var
v=d,aO=v.Array,aP=v.Date,V=[f,aQ,y(0)],H=[0,V,{}],aN=undefined,aM=a2(H)===f?H:H[1];a7(a(M),aM);(function(a){throw a});U(function(a){return a[1]===V?[0,P(a[2].toString())]:0});U(function(a){return a
instanceof
aO?0:[0,P(a.toString())]});y(0);v.HTMLElement===aN;function
W(a){return new
aP().getTime()}var
aR=W(0);v.alert("hello");var
C=aX(aK,W(0)-aR),B=0,aI=z(C);for(;;){if(aI<=B)var
R=F(C,aJ);else{var
G=aH(C,B),aU=48<=G?58<=G?0:1:45===G?1:0;if(aU){var
B=B+1|0;continue}var
R=C}v.alert(F(aT,F(R,aS)).toString());var
aL=function(b){var
a=b;for(;;){if(a){var
c=a[2],d=a[1];try{aZ(d)}catch(a){a=be(a);if(a[1]!==S)throw a}var
a=c;continue}return 0}};aL(a1(0));return}}(function(){return this}()));
