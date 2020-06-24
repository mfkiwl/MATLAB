script
clc
clear
disp('% לע No12. ףימפות כיט-זילרפעב זמ‏ םופןהןם ‏וגשûוקףכןך בננעןכףיםבדיי') 
disp('%')
disp('%')
disp('% Ð.1. קקןה פעוגןקבמיך כ ב‏ט זמ‏')
disp('%')
disp('%')
Nb = 4; % מןםוע געיחבהש
Fs = 5000 + 100*Nb; % ‏בףפןפב היףכעופיתבדיי (חÃ)
ft = Fs/10 + 20*Nb;% חעבמי‏מבס ‏בףפןפב ננ (חÃ)
fk = Fs/10 + 250 + 25*Nb; % חעבמי‏מבס ‏בףפןפב נת (חÃ)
d1 = 0.05; % םבכףיםבלרמן הןנץףפיםןו ןפכלןמומיו ק ננ
d2 = 0.01; % םבכףיםבלרמן הןנץףפיםןו ןפכלןמומיו ק נת
Ap = 0.4455; % םבכףיםבלרמן הןנץףפיםןו תבפץטבמיו ק ננ
Ast = 40; % םימיםבלרמן הןנץףפיםןו תבפץטבמיו ק נת
disp('%')
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
m = [1 0]; % ×ÅËÔÏÒ ÚÎÁÞÅÎÉÊ ÉÄÅÁÌØÎÏÊ ב‏ט
f = [ft fk]; % ×ÅËÔÏÒ ÇÒÁÎÉÞÎÙÈ ÞÁÓÔÏÔ
ripple = [d1 d2]; % קÅËÔÏÒ ÍÁËÓÉÍÁÌØÎÏ ÄÏÐÕÓÔÉÍÙÈ ÏÔËÌÏÎÅÎÉÊ
[R,f0,m0,weight] = firpmord(f,m,ripple,Fs);% קש‏יףלומיו נבעבםופעןק זץמכדיי firpmord
disp('%')
disp(['R = ' num2str(R)]) % ÏÃÅÎËÁ ÐÏÒÑÄËÁ כיט-ÆÉÌØÔÒÁ
weight = [weight(1) weight(2)] % ×ÅÓÁ ננ É נת
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.3. ףימפות כיט-זילרפעב זמ‏')
ORDER = 0; % נעיתמבכ ןנפיםבלרמןףפי נןעסהכב כיט-זילרפעב: 0 ? מוןנפיםבלרמשך; 1 ? ןנפיםבלרמשך
while ORDER==0;
disp('%')
disp('%')
disp('% הÌÑ ÓÉÎÔÅÚÁ כיט-ÆÉÌØÔÒÁ זמ‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
[b1,error,opt] = firpm(R,f0,m0,weight); % כןüזזידיומפש כיט-זילרפעב זמ‏ b1 
disp('%')
disp('%')
disp([' ףÉÎÔÅÚÉÒÏ×ÁÎ כיט-ÆÉÌØÔÒ זמ‏ ÐÏÒÑÄËÁ R = ' num2str(R)])
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ םבכףיםבלרמןך קתקוûוממןך ןûיגכי בננעןכףיםבדיי error') 
disp('% É הןנץףפיםןחן קתקוûוממןחן ןפכלןמומיס max{d1,d2} ÎÁÖÍÉÔÅ <ENTER>')        
pause 
disp('%')
disp(['error = ' num2str(error)]) % זבכפי‏וףכןו םבכףיםבלרמןו ןפכלןמומיו ב‏ט ןפ יהובלרמןך
disp(['max{d1,d2} = ' num2str(max(d1,d2))]) % תבהבממןו ןפכלןמומיו max{d1,d2}
disp('%')
disp('%')
disp('% ףÒÁ×ÎÉÔÅ זבכפי‏וףכןו ÏÔËÌÏÎÅÎÉÅ ב‏ט Ó תבהבממשם')
disp('%')
disp('% וÓÌÉ נןעסהןכ ÓÏÏÔ×ÅÔÓÔ×ÕÅÔ םימיםבלרמןםץ, ××ÅÄÉÔÅ 1')
disp('% וÓÌÉ מו ÓÏÏÔ×ÅÔÓÔ×ÕÅÔ, ××ÅÄÉÔÅ 0 É ÚÁÔÅÍ נןעסהןכ R')
   ORDER = input('--> ');
if ORDER==0
R = input('R = '); % נןעסהןכ כיט-זילרפעב
end
end
disp('%')
disp([' ףÉÎÔÅÚÉÒÏ×ÁÎ ÏÐÔÉÍÁÌØÎÙÊ זמ‏ ÐÏÒÑÄËÁ R = ' num2str(R)])
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.4. במבלית טבעבכפועיףפיכ כיט-זילרפעב זמ‏')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ חעבזיכןק יט, ב‏ט י ז‏ט ÎÁÖÍÉÔÅ <ENTER>')
pause
figure('Name','Lowpass FIR Filter ? Impulse Response, Magnitude, Phase','NumberTitle', 'off')
plot_fir(R,b1,Fs) % נןףפעןומיו חעבזיכןק יט, ב‏ט É ז‏ט
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.5 קשקןה חעבזיכב ב‏ט ןנפיםבלרמןחן כיט-זילרפעב ף ןפםו‏וממשםי ‏בףפןפבםי בלרפועמבמףב')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ חעבזיכב ב‏ט ף ‏בףפןפבםי בלרפועמבמףב ÎÁÖÍÉÔÅ <ENTER>') 
pause
fextr = opt.fextr; % קוכפןע מןעםיעןקבממשט ‏בףפןפ בלרפועמבמףב 
figure('Name','Lowpass Filter ? Magnitude','NumberTitle', 'off') 
MAG_fir(b1,opt.fextr,f0,m0,Fs) % חעבזיכ ב‏ט ף ‏בףפןפבםי בלרפועמבמףב 
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.6. ןניףבמיו פעוגןקבמיך כ ב‏ט כיט-ÆÉÌØÔÒÁ זמ‏ ק קיהו ןגÿוכפב fdesign')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב fdesign ÎÁÖÍÉÔÅ <ENTER>')
pause
MAG_lowpass = fdesign.lowpass('Fp,Fst,Ap,Ast',ft,fk,Ap,Ast,Fs) % ןגÿוכפ fdesign הלס זמ‏
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
F_lowpass = equiripple(MAG_lowpass) % זמ‏ ק קיהו ןגÿוכפב dfilt 
disp('%')
disp('%')
disp('% ףימפות כיט-זילרפעב זמ‏ תבקועûומ')
fvtool(F_lowpass)