// Generated by js_of_ocaml 3.0.1
(function(d){"use strict";var
ag=" : flags Open_text and Open_binary are not compatible",T="Sys_error",af=224,ae="Invalid_argument",r=1024,ad="fs",A="jsError",S=57343,ac=512,ab="End_of_file",aa="Failure",Q="Undefined_recursive_module",R=" : flags Open_rdonly and Open_wronly are not compatible",P="([^/]*)",$="Stack_overflow",g=128,b="",z="^",L=" : file already exists",M=2048,N=56320,O=240,f=248,Z="Not_found",_="undefined",K="Assert_failure",m="/",X="Sys_blocked_io",Y="fd ",J="Out_of_memory",W="Match_failure",U="Division_by_zero",V="static/",aF=0;function
t(){return aF++}function
al(a){if(a.length<24){for(var
b=0;b<a.length;b++)if(a.charCodeAt(b)>127)return false;return true}else
return!/[^\x00-\x7f]/.test(a)}function
aR(f){for(var
h=b,c=h,a,j,d=0,i=f.length;d<i;d++){a=f.charCodeAt(d);if(a<g){for(var
e=d+1;e<i&&(a=f.charCodeAt(e))<g;e++);if(e-d>ac){c.substr(0,1);h+=c;c=b;h+=f.slice(d,e)}else
c+=f.slice(d,e);if(e==i)break;d=e}if(a<M){c+=String.fromCharCode(192|a>>6);c+=String.fromCharCode(g|a&63)}else
if(a<55296||a>=S)c+=String.fromCharCode(af|a>>12,g|a>>6&63,g|a&63);else
if(a>=56319||d+1==i||(j=f.charCodeAt(d+1))<N||j>S)c+="\xef\xbf\xbd";else{d++;a=(a<<10)+j-56613888;c+=String.fromCharCode(O|a>>18,g|a>>12&63,g|a>>6&63,g|a&63)}if(c.length>r){c.substr(0,1);h+=c;c=b}}return h+c}function
aJ(c,a){if(a.repeat)return a.repeat(c);var
d=b,e=0;if(c==0)return d;for(;;){if(c&1)d+=a;c>>=1;if(c==0)return d;a+=a;e++;if(e==9)a.slice(0,1)}}function
aV(d,e,c){var
b=new
Array(c);for(var
a=0;a<c;a++)b[a]=d[e+a];return b}function
E(c,d,a){var
e=String.fromCharCode;if(d==0&&a<=4096&&a==c.length)return e.apply(null,c);var
f=b;for(;0<a;d+=r,a-=r)f+=e.apply(null,aV(c,d,Math.min(a,r)));return f}function
aj(a){if(a.t==2)a.c+=aJ(a.l-a.c.length,"\0");else
a.c=E(a.c,0,a.c.length);a.t=0}function
aQ(f){for(var
l=b,d=b,i,h,j,a,c=0,k=f.length;c<k;c++){h=f.charCodeAt(c);if(h<g){for(var
e=c+1;e<k&&(h=f.charCodeAt(e))<g;e++);if(e-c>ac){d.substr(0,1);l+=d;d=b;l+=f.slice(c,e)}else
d+=f.slice(c,e);if(e==k)break;c=e}a=1;if(++c<k&&((j=f.charCodeAt(c))&-64)==g){i=j+(h<<6);if(h<af){a=i-12416;if(a<g)a=1}else{a=2;if(++c<k&&((j=f.charCodeAt(c))&-64)==g){i=j+(i<<6);if(h<O){a=i-925824;if(a<M||a>=55295&&a<57344)a=2}else{a=3;if(++c<k&&((j=f.charCodeAt(c))&-64)==g&&h<245){a=j-63447168+(i<<6);if(a<65536||a>1114111)a=3}}}}}if(a<4){c-=a;d+="\ufffd"}else
if(a>65535)d+=String.fromCharCode(55232+(a>>10),N+(a&1023));else
d+=String.fromCharCode(a);if(d.length>r){d.substr(0,1);l+=d;d=b}}return l+d}function
aP(a){switch(a.t){case
9:return a.c;default:aj(a);case
0:if(al(a.c)){a.t=9;return a.c}a.t=8;case
8:return aQ(a.c)}}function
n(c,a,b){this.t=c;this.c=a;this.l=b}n.prototype.toString=function(){return aP(this)};function
D(a){var
b=9;if(!al(a))b=8,a=aR(a);return new
n(b,a,a.length)}function
aH(b,a){throw[0,b,a]}function
c(a){return new
n(0,a,a.length)}function
aq(b,a){aH(b,c(a))}var
a=[0];function
j(b){aq(a.Sys_error,b)}var
o=new
Array();function
aB(e){var
c=o[e];if(!c.opened)j("Cannot flush a closed channel");if(!c.buffer||c.buffer==b)return 0;if(c.fd&&a.fds[c.fd]&&a.fds[c.fd].output){var
d=a.fds[c.fd].output;switch(d.length){case
2:d(e,c.buffer);break;default:d(c.buffer)}}c.buffer=b;return 0}if(d.process&&d.process.cwd)var
s=d.process.cwd().replace(/\\/g,m);else
var
s="/static";if(s.slice(-1)!==m)s+=m;function
aA(a){a=a
instanceof
n?a.toString():a;if(a.charCodeAt(0)!=47)a=s+a;var
e=a.split(m),c=[];for(var
d=0;d<e.length;d++)switch(e[d]){case"..":if(c.length>1)c.pop();break;case".":break;case"":if(c.length==0)c.push(b);break;default:c.push(e[d]);break}c.orig=a;return c}function
aG(a){a=a
instanceof
n?a.toString():a;j(a+": No such file or directory")}function
aL(a){return new
n(4,a,a.length)}function
ak(b){aq(a.Invalid_argument,b)}function
at(){ak("index out of bounds")}function
aN(a,b){switch(a.t&6){default:if(b>=a.c.length)return 0;case
0:return a.c.charCodeAt(b);case
4:return a.c[b]}}function
aK(b,a){if(a>>>0>=b.l)at();return aN(b,a)}function
p(a){if(a<0)ak("String.create");return new
n(a?2:9,b,a)}function
an(a){return a.l}function
C(b){if(d.Uint8Array)var
c=new(d.Uint8Array)(b.l);else
var
c=new
Array(b.l);var
f=b.c,e=f.length,a=0;for(;a<e;a++)c[a]=f.charCodeAt(a);for(e=b.l;a<e;a++)c[a]=0;b.c=c;b.t=4;return c}function
v(d,e,b,f,c){if(c==0)return 0;if(f==0&&(c>=b.l||b.t==2&&c>=b.c.length)){b.c=d.t==4?E(d.c,e,c):e==0&&d.c.length==c?d.c:d.c.substr(e,c);b.t=b.c.length==b.l?0:2}else
if(b.t==2&&f==b.c.length){b.c+=d.t==4?E(d.c,e,c):e==0&&d.c.length==c?d.c:d.c.substr(e,c);b.t=b.c.length==b.l?0:2}else{if(b.t!=4)C(b);var
g=d.c,h=b.c;if(d.t==4)if(f<=e)for(var
a=0;a<c;a++)h[f+a]=g[e+a];else
for(var
a=c-1;a>=0;a--)h[f+a]=g[e+a];else{var
i=Math.min(c,g.length-e);for(var
a=0;a<i;a++)h[f+a]=g.charCodeAt(e+a);for(;a<c;a++)h[f+a]=0}}return 0}function
ah(){}function
e(a){this.data=a}e.prototype=new
ah();e.prototype.truncate=function(a){var
b=this.data;this.data=p(a|0);v(b,0,this.data,0,a)};e.prototype.length=function(){return an(this.data)};e.prototype.write=function(b,d,g,a){var
c=this.length();if(b+a>=c){var
e=p(b+a),f=this.data;this.data=e;v(f,0,this.data,0,c)}v(d,g,this.data,b,a);return 0};e.prototype.read=function(c,a,d,b){var
e=this.length();v(this.data,c,a,d,b);return 0};e.prototype.read_one=function(a){return aK(this.data,a)};e.prototype.close=function(){};e.prototype.constructor=e;function
h(b,a){this.content={};this.root=b;this.lookupFun=a}h.prototype.nm=function(a){return this.root+a};h.prototype.lookup=function(a){if(!this.content[a]&&this.lookupFun){var
b=this.lookupFun(c(this.root),c(a));if(b!=0)this.content[a]=new
e(b[1])}};h.prototype.exists=function(a){if(a==b)return 1;var
d=a+m,e=new
RegExp(z+d);for(var
c
in
this.content)if(c.match(e))return 1;this.lookup(a);return this.content[a]?1:0};h.prototype.readdir=function(d){var
g=d==b?b:d+m,h=new
RegExp(z+g+P),e={},c=[];for(var
f
in
this.content){var
a=f.match(h);if(a&&!e[a[1]]){e[a[1]]=true;c.push(a[1])}}return c};h.prototype.is_dir=function(a){var
e=a==b?b:a+m,f=new
RegExp(z+e+P),g=[];for(var
d
in
this.content){var
c=d.match(f);if(c)return 1}return 0};h.prototype.unlink=function(a){var
b=this.content[a]?true:false;delete
this.content[a];return b};h.prototype.open=function(a,b){if(b.rdonly&&b.wronly)j(this.nm(a)+R);if(b.text&&b.binary)j(this.nm(a)+ag);this.lookup(a);if(this.content[a]){if(this.is_dir(a))j(this.nm(a)+" : is a directory");if(b.create&&b.excl)j(this.nm(a)+L);var
c=this.content[a];if(b.truncate)c.truncate();return c}else
if(b.create){this.content[a]=new
e(p(0));return this.content[a]}else
aG(this.nm(a))};h.prototype.register=function(b,a){if(this.content[b])j(this.nm(b)+L);if(a
instanceof
n)this.content[b]=new
e(a);else
if(a
instanceof
Array)this.content[b]=new
e(aL(a));else
if(a.toString){var
d=c(a.toString());this.content[b]=new
e(d)}};h.prototype.constructor=h;function
ai(a){if(a.t!=4)C(a);return a.c}function
aO(a,c,b){b&=255;if(a.t!=4){if(c==a.c.length){a.c+=String.fromCharCode(b);if(c+1==a.l)a.t=0;return 0}C(a)}a.c[c]=b;return 0}function
aM(b,a,c){if(a>>>0>=b.l)at();return aO(b,a,c)}var
B=d.Buffer;function
l(a){this.fs=require(ad);this.fd=a}l.prototype=new
ah();l.prototype.truncate=function(a){this.fs.ftruncateSync(this.fd,a|0)};l.prototype.length=function(){return this.fs.fstatSync(this.fd).size};l.prototype.write=function(g,b,c,f){var
a=ai(b);if(!a
instanceof
d.Uint8Array)a=new(d.Uint8Array)(a);var
e=new
B(a);this.fs.writeSync(this.fd,e,c,f,g);return 0};l.prototype.read=function(h,e,c,g){var
a=ai(e);if(!(a
instanceof
d.Uint8Array))a=new(d.Uint8Array)(a);var
f=new
B(a);this.fs.readSync(this.fd,f,c,g,h);for(var
b=0;b<g;b++)aM(e,c+b,f[c+b]);return 0};l.prototype.read_one=function(c){var
b=new(d.Uint8Array)(1),a=new
B(b);this.fs.readSync(this.fd,a,0,1,c);return a[0]};l.prototype.close=function(){this.fs.closeSync(this.fd)};l.prototype.constructor=l;function
k(a){this.fs=require(ad);this.root=a}k.prototype.nm=function(a){return this.root+a};k.prototype.exists=function(a){return this.fs.existsSync(this.nm(a))?1:0};k.prototype.readdir=function(a){return this.fs.readdirSync(this.nm(a))};k.prototype.is_dir=function(a){return this.fs.statSync(this.nm(a)).isDirectory()?1:0};k.prototype.unlink=function(a){var
b=this.fs.existsSync(this.nm(a))?1:0;this.fs.unlinkSync(this.nm(a));return b};k.prototype.open=function(f,c){var
a=require("constants"),b=0;for(var
e
in
c)switch(e){case"rdonly":b|=a.O_RDONLY;break;case"wronly":b|=a.O_WRONLY;break;case"append":b|=a.O_WRONLY|a.O_APPEND;break;case"create":b|=a.O_CREAT;break;case"truncate":b|=a.O_TRUNC;break;case"excl":b|=a.O_EXCL;break;case"binary":b|=a.O_BINARY;break;case"text":b|=a.O_TEXT;break;case"nonblock":b|=a.O_NONBLOCK;break}var
d=this.fs.openSync(this.nm(f),b);return new
l(d)};k.prototype.rename=function(b,a){this.fs.renameSync(this.nm(b),this.nm(a))};k.prototype.constructor=k;var
q=s.match(/[^\/]*\//)[0],u=[];if(typeof
module!==_&&module.exports&&typeof
require!==_)u.push({path:q,device:new
k(q)});else
u.push({path:q,device:new
h(q)});u.push({path:q+V,device:new
h(q+V)});function
aW(b){var
f=aA(b),b=f.join(m),e=b+m,c;for(var
d=0;d<u.length;d++){var
a=u[d];if(e.search(a.path)==0&&(!c||c.path.length<a.path.length))c={path:a.path,device:a.device,rest:b.substring(a.path.length,b.length)}}return c}function
as(e,f){var
a=o[e],d=c(f),b=an(d);a.file.write(a.offset,d,0,b);a.offset+=b;return 0}function
aT(a){var
b=d;if(b.process&&b.process.stdout&&b.process.stdout.write)b.process.stderr.write(a);else{if(a.charCodeAt(a.length-1)==10)a=a.substr(0,a.length-1);var
c=b.console;c&&c.error&&c.error(a)}}function
aU(a){var
b=d;if(b.process&&b.process.stdout&&b.process.stdout.write)b.process.stdout.write(a);else{if(a.charCodeAt(a.length-1)==10)a=a.substr(0,a.length-1);var
c=b.console;c&&c.log&&c.log(a)}}function
w(d,f,e,b){if(a.fds===undefined)a.fds=new
Array();b=b?b:{};var
c={};c.file=e;c.offset=b.append?e.length():0;c.flags=b;c.output=f;a.fds[d]=c;if(!a.fd_last_idx||d>a.fd_last_idx)a.fd_last_idx=d;return d}function
aX(d,c,h){var
b={};while(c){switch(c[1]){case
0:b.rdonly=1;break;case
1:b.wronly=1;break;case
2:b.append=1;break;case
3:b.create=1;break;case
4:b.truncate=1;break;case
5:b.excl=1;break;case
6:b.binary=1;break;case
7:b.text=1;break;case
8:b.nonblock=1;break}c=c[2]}if(b.rdonly&&b.wronly)j(d.toString()+R);if(b.text&&b.binary)j(d.toString()+ag);var
e=aW(d),f=e.device.open(e.rest,b),g=a.fd_last_idx?a.fd_last_idx:0;return w(g+1,as,f,b)}w(0,as,new
e(p(0)));w(1,aU,new
e(p(0)));w(2,aT,new
e(p(0)));function
aC(d){var
c=a.fds[d];if(c.flags.wronly)j(Y+d+" is writeonly");var
b={file:c.file,offset:c.offset,fd:d,opened:true,out:false,refill:null};o[b.fd]=b;return b.fd}function
am(e){var
d=a.fds[e];if(d.flags.rdonly)j(Y+e+" is readonly");var
c={file:d.file,offset:d.offset,fd:e,opened:true,out:true,buffer:b};o[c.fd]=c;return c.fd}function
aD(){var
b=0;for(var
a=0;a<o.length;a++)if(o[a]&&o[a].opened&&o[a].out)b=[0,o[a].fd,b];return b}function
aE(a){return a
instanceof
Array?a[0]:a
instanceof
n?252:1e3}function
i(d,c,b){a[d+1]=c;if(b)a[b]=c}var
ap={};function
az(a){if((a.t&6)!=0)aj(a);return a.c}function
aI(a,b){ap[az(a)]=b;return 0}function
ar(a){return a}function
ao(a){return ap[a]}function
aS(b){if(b
instanceof
Array)return b;if(d.RangeError&&b
instanceof
d.RangeError&&b.message&&b.message.match(/maximum call stack/i))return ar(a.Stack_overflow);if(d.InternalError&&b
instanceof
d.InternalError&&b.message&&b.message.match(/too much recursion/i))return ar(a.Stack_overflow);if(b
instanceof
d.Error&&ao(A))return[0,ao(A),b];return[0,a.Failure,D(String(b))]}var
F=[f,c(T),-2];i(11,[f,c(Q),-12],Q);i(10,[f,c(K),-11],K);i(9,[f,c(X),-10],X);i(8,[f,c($),-9],$);i(7,[f,c(W),-8],W);i(6,[f,c(Z),-7],Z);i(5,[f,c(U),-6],U);i(4,[f,c(ab),-5],ab);i(3,[f,c(ae),-4],ae);i(2,[f,c(aa),-3],aa);i(1,F,T);i(0,[f,c(J),-1],J);t(0);aC(0);am(1);am(2);t(0);t(0);var
G=[0,0],ay=c("Js.Error");function
H(a){G[1]=[0,a,G[1]];return 0}var
x=d,ax=x.Array,I=[f,ay,t(0)],y=[0,I,{}],aw=undefined,av=aE(y)===f?y:y[1];aI(c(A),av);(function(a){throw a});H(function(a){return a[1]===I?[0,D(a[2].toString())]:0});H(function(a){return a
instanceof
ax?0:[0,D(a.toString())]});t(0);x.HTMLElement===aw;x.alert("hello");function
au(b){var
a=b;for(;;){if(a){var
c=a[2],d=a[1];try{aB(d)}catch(a){a=aS(a);if(a[1]!==F)throw a}var
a=c;continue}return 0}}au(aD(0));return}(function(){return this}()));
