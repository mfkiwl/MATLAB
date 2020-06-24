script
clc
clear
disp('% לע No12. ףימפות כיט-זילרפעב זק‏ םופןהןם ‏וגשûוקףכןך בננעןכףיםבדיי') 
disp('%')
disp('%')
disp('% Ð.1. קקןה פעוגןקבמיך כ ב‏ט זק‏')
disp('%')
disp('%')
disp('% ק×ÅÄÉÔÅ מןםוע געיחבהש É פעוגןקבמיס Ë ב‏ט')
Nb = 4; % מןםוע געיחבהש
Fs = 5000 + 100*Nb; % ‏בףפןפב היףכעופיתבדיי (חÃ)
ft = Fs/10 + 250 + 25*Nb; % חעבמי‏מבס ‏בףפןפב ננ (חÃ)
fk = Fs/10 + 20*Nb; % חעבמי‏מבס ‏בףפןפב נת (חÃ)
d1 = 0.05; % םבכףיםבלרמן הןנץףפיםןו ןפכלןמומיו ק ננ
d2 = 0.01; % םבכףיםבלרמן הןנץףפיםןו ןפכלןמומיו ק נת
Ap = 0.4455; % םבכףיםבלרמן הןנץףפיםןו תבפץטבמיו ק ננ
Ast = 40; % םימיםבלרמן הןנץףפיםןו תבפץטבמיו ק נת
8908disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.2. קש‏יףלומיו נבעבםופעןק זץמכדיי firpmord')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ נןעסהכב כיט-ÆÉÌØÔÒÁ (R) É קוףןק × ננ É נת (weight) ÎÁÖÍÉÔÅ <ENTER>')
pause
m = [0 1]; % ×ÅËÔÏÒ ÚÎÁÞÅÎÉÊ ÉÄÅÁÌØÎÏÊ ב‏ט
f = [fk ft]; % ×ÅËÔÏÒ ÇÒÁÎÉÞÎÙÈ ÞÁÓÔÏÔ
ripple = [d2 d1]; % קÅËÔÏÒ ÍÁËÓÉÍÁÌØÎÏ ÄÏÐÕÓÔÉÍÙÈ ÏÔËÌÏÎÅÎÉÊ
[R,f0,m0,weight] = firpmord(f,m,ripple,Fs);% קש‏יףלומיו נבעבםופעןק זץמכדיי firpmord
disp('%')
disp(['R = ' num2str(R)]) % ןÃÅÎËÁ ÐÏÒÑÄËÁ כיט-ÆÉÌØÔÒÁ
weight = [weight(1) weight(2)] % קÅÓÁ × ננ É נת
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.3. ףימפות כיט-זילרפעב זק‏')
ORDER = 0; % נעיתמבכ ןנפיםבלרמןףפי נןעסהכב כיט-זילרפעב: 0 ? מוןנפיםבלרמשך; 1 ? ןנפיםבלרמשך
ftype = ' '; % 1-ך פינ כיט-זילרפעב זק‏ נן ץםןל‏במיא
while ORDER==0;
disp('%')
disp('%')
disp('% הÌÑ ÓÉÎÔÅÚÁ כיט-ÆÉÌØÔÒÁ זק‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
[b2,error,opt] = firpm(R,f0,m0,weight,ftype); % כןüזזידיומפש כיט-זילרפעב זק‏ b2
disp('%')
disp('%')
disp([' ףÉÎÔÅÚÉÒÏ×ÁÎ כיט-ÆÉÌØÔÒ זק‏ ÐÏÒÑÄËÁ R = ' num2str(R)])
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ םבכףיםבלרמןך קתקוûוממןך ןûיגכי בננעןכףיםבדיי error') 
disp('% É הןנץףפיםןחן קתקוûוממןחן ןפכלןמומיס max{d1,d2} ÎÁÖÍÉÔÅ <ENTER>') 
pause
disp('%')
disp(['error = ' num2str(error)]) % זבכפי‏וףכןו םבכףיםבלרמןו ןפכלןמומיו ב‏ט ןפ יהובלרמןך
disp(['max{d1,d2} = ' num2str(max(d1,d2))]) % תבהבממןו ןפכלןמומיו max{d1,d2} disp('%')
disp('%')
disp('% ףÒÁ×ÎÉÔÅ זבכפי‏וףכןו ÏÔËÌÏÎÅÎÉÅ ב‏ט Ó תבהבממשם')
disp('%')
disp('% וÓÌÉ נןעסהןכ ÓÏÏÔ×ÅÔÓÔ×ÕÅÔ םימיםבלרמןםץ, ××ÅÄÉÔÅ 1')
disp('% וÓÌÉ מו ÓÏÏÔ×ÅÔÓÔ×ÕÅÔ, ××ÅÄÉÔÅ 0 É ÚÁÔÅÍ נןעסהןכ R')
disp('% É פינ כיט-ÆÉÌØÔÒÁ ftype ? ÐÒÏÂÅÌ ÉÌÉ hilbert ק בנןףפעןזבט')
ORDER = input('--> ');
if ORDER==0
R = input('R = '); % נןעסהןכ כיט-זילרפעב
ftype = input('ftype = ');
while (ftype==' ')&(rem(R,2)~=0)|(ftype=='hilbert')&(rem(R,2)~=1)
% נעןקועכב ףןןפקופףפקיס נןעסהכב י פינב כיט-זילרפעב
disp('% פינ כיט-ÆÉÌØÔÒÁ מו ףןןפקופףפקץופ נןעסהכץ')
ftype = input('ftype = ');
end
end
end
disp('%')
disp([' ףÉÎÔÅÚÉÒÏ×ÁÎ ÏÐÔÉÍÁÌØÎÙÊ זק‏ ÐÏÒÑÄËÁ R = ' num2str(R)]) 
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.4. במבלית טבעבכפועיףפיכ כיט-זילרפעב זק‏')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ חעבזיכןק יט, ב‏ט י ז‏ט ÎÁÖÍÉÔÅ <ENTER>') 
pause
figure('Name','Highpass FIR Filter ? Impulse Response, Magnitude, Phase','NumberTitle', 'off')
plot_fir(R,b2,Fs) % נןףפעןומיו חעבזיכןק יט, ב‏ט É ז‏ט disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.5. קשקןה חעבזיכב ב‏ט ןנפיםבלרמןחן כיט-זילרפעב ף ןפםו‏וממשםי ‏בףפןפבםי בלרפועמבמףב')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ חעבזיכב ב‏ט ף ‏בףפןפבםי בלרפועמבמףב ÎÁÖÍÉÔÅ <ENTER>')
pause
fextr = opt.fextr; % קוכפןע מןעםיעןקבממשט ‏בףפןפ בלרפועמבמףב
figure('Name','Highpass Filter ? Magnitude','NumberTitle', 'off')
MAG_fir(b2,opt.fextr,f0,m0,Fs) % חעבזיכ ב‏ט ף ‏בףפןפבםי בלרפועמבמףב
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.6. ןניףבמיו פעוגןקבמיך כ ב‏ט כיט-ÆÉÌØÔÒÁ זק‏ ק קיהו ןגÿוכפב fdesign')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב fdesign ÎÁÖÍÉÔÅ <ENTER>')
pause
MAG_highpass = fdesign.highpass('Fst,Fp,Ast,Ap',fk,ft,Ast,Ap,Fs) % ןגÿוכפ fdesign הלס זק‏
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.7. ףימפות כיט-זילרפעב ק קיהו ןגÿוכפב dfilt מב ןףמןקו ןגÿוכפב fdesign')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב dfilt ÎÁÖÍÉÔÅ <ENTER>')
pause
F_highpass = equiripple(MAG_highpass) % זק‏ ק קיהו ןגÿוכפב dfilt 
disp('%')
disp('%')
disp('% ףימפות כיט-זילרפעב זק‏ תבקועûומ')
fvtool(F_highpass)