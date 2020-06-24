script
clc
clear
disp('% לע No12. ףימפות כיט-זילרפעב נז םופןהןם ‏וגשûוקףכןך בננעןכףיםבדיי') 
disp('%')
disp('%')
disp('% Ð.1. קקןה פעוגןקבמיך כ ב‏ט נז')
disp('%')
disp('%')
Nb = 4; % מןםוע געיחבהש
Fs = 5000 + 100*Nb; % ‏בףפןפב היףכעופיתבדיי (חÃ)
fk1 = Fs/10 + 20*Nb; % חעבמי‏מבס ‏בףפןפב נת1 (חÃ)
ft1 = Fs/10 + 250 + 25*Nb; % חעבמי‏מבס ‏בףפןפב ננ (חÃ)
ft2 = Fs/4 + 25*Nb; % חעבמי‏מבס ‏בףפןפב ננ (חÃ)
fk2 = Fs/4 + 250 + 30*Nb; % חעבמי‏מבס ‏בףפןפב נת2 (חÃ)
d21 = 0.01; % םבכףיםבלרמן הןנץףפיםןו ןפכלןמומיו ק נת1
d1 = 0.05; % םבכףיםבלרמן הןנץףפיםןו ןפכלןמומיו ק ננ
d22 = 0.01; % םבכףיםבלרמן הןנץףפיםןו ןפכלןמומיו ק נת2
Ast1 = 40; % םימיםבלרמן הןנץףפיםןו תבפץטבמיו ק נת1
Ap = 0.4455; % םבכףיםבלרמן הןנץףפיםןו תבפץטבמיו ק ננ
Ast2 = 40; % םימיםבלרמן הןנץףפיםןו תבפץטבמיו ק נת2
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.2. קש‏יףלומיו נבעבםופעןק זץמכדיי firpmord')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ נןעסהכב כיט-ÆÉÌØÔÒÁ (R) É קוףןק × נת1, ננ É נת2 (weight)ÎÁÖÍÉÔÅ <ENTER>')
pause
m = [0 1 0]; % קוכפןע תמב‏ומיך יהובלרמןך ב‏ט 
f = [fk1 ft1 ft2 fk2]; % קוכפןע חעבמי‏משט ‏בףפןפ
ripple = [d21 d1 d22]; % קוכפןע םבכףיםבלרמן הןנץףפיםשט ןפכלןמומיך
[R,f0,m0,weight] = firpmord(f,m,ripple,Fs);% קש‏יףלומיו נבעבםופעןק זץמכדיי firpmord
disp('%')
disp(['R = ' num2str(R)])
weight = [weight(1) weight(2) weight(3)]
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.3. ףימפות כיט-זילרפעב נז')
ORDER = 0; % נעיתמבכ ןנפיםבלרמןףפי נןעסהכב כיט-זילרפעב: 0 ? מוןנפיםבלרמשך; 1 ? ןנפיםבלרמשך
ftype = ' '; % 1-ך ילי 2-ך פינ פינ כיט-זילרפעב זק‏ נן ץםןל‏במיא
while ORDER==0;
disp('%')
disp('%')
disp('% הÌÑ ÓÉÎÔÅÚÁ כיט-ÆÉÌØÔÒÁ נז ÎÁÖÍÉÔÅ <ENTER>')
pause
[b3,error,opt] = firpm(R,f0,m0,weight,ftype); % כןüזזידיומפש כיט-זילרפעב נז b3
disp('%')
disp('%')
disp([' ףÉÎÔÅÚÉÒÏ×ÁÎ כיט-ÆÉÌØÔÒ נז ÐÏÒÑÄËÁ R = ' num2str(R)])
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ םבכףיםבלרמןך קתקוûוממןך ןûיגכי בננעןכףיםבדיי error')
disp('% É הןנץףפיםןחן קתקוûוממןחן ןפכלןמומיס max{d21,d2,d22} ÎÁÖÍÉÔÅ <ENTER>') 
pause
disp('%')
disp(['error = ' num2str(error)]) % זבכפי‏וףכןו םבכףיםבלרמןו ןפכלןמומיו ב‏ט ןפ יהובלרמןך
disp(['max{d21,d1,d22} = ' num2str(max([d21,d1,d22]))]) % תבהבממןו ןפכלןמומיו max{d21,d1,d22}
disp('%')
disp('%')
disp('% ףÒÁ×ÎÉÔÅ זבכפי‏וףכןו ÏÔËÌÏÎÅÎÉÅ ב‏ט Ó תבהבממשם')
disp('%')
disp('%')
disp('% וÓÌÉ נןעסהןכ ÓÏÏÔ×ÅÔÓÔ×ÕÅÔ םימיםבלרמןםץ, ××ÅÄÉÔÅ 1')
disp('% וÓÌÉ מו ÓÏÏÔ×ÅÔÓÔ×ÕÅÔ, ××ÅÄÉÔÅ 0 É ÚÁÔÅÍ נןעסהןכ R')
disp('% É פינ כיט=ÆÉÌØÔÒÁ ftype ? ÐÒÏÂÅÌ ÉÌÉ hilbert ק בנןףפעןזבט')
disp('% ןנפיםבלרמשך נז ×ÙÂÉÒÁÅÔÓÑ ÓÒÅÄÉ קףוט ‏ופשעוט פינןק כיט-ÆÉÌØÔÒÏ×!') 
ORDER = input('--> ');
if ORDER==0
R = input('R = '); % נןעסהןכ כיט-זילרפעב
ftype = input('ftype = '); end
end
disp('%')
disp([' ףÉÎÔÅÚÉÒÏ×ÁÎ ÏÐÔÉÍÁÌØÎÙÊ נז ÐÏÒÑÄËÁ R = ' num2str(R)]) 
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.4. במבלית טבעבכפועיףפיכ כיט-זילרפעב נז') 
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ חעבזיכןק יט, ב‏ט י ז‏ט ÎÁÖÍÉÔÅ <ENTER>')
pause
figure('Name','Bandpass FIR Filter ? Impulse Response, Magnitude, Phase','NumberTitle', 'off')
plot_fir(R,b3,Fs) % נןףפעןומיו חעבזיכןק יט, ב‏ט É ז‏ט disp('%')
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
figure('Name','Bandpass Filter ? Magnitude','NumberTitle', 'off') 
MAG_fir(b3,opt.fextr,f0,m0,Fs) % חעבזיכ ב‏ט ף ‏בףפןפבםי בלרפועמבמףב
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.6. ןניףבמיו פעוגןקבמיך כ ב‏ט כיט-ÆÉÌØÔÒÁ נז ק קיהו ןגÿוכפב fdesign') 
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב fdesign ÎÁÖÍÉÔÅ <ENTER>')
pause
MAG_bandpass = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',fk1,ft1,ft2, fk2,Ast1,Ap,Ast2,Fs) % ןגÿוכפ fdesign הלס נז
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
F_bandpass = equiripple(MAG_bandpass) % נז ק קיהו ןגÿוכפב dfilt 
disp('%')
disp('%')
disp('% ףימפות כיט-זילרפעב נז תבקועûומ')
fvtool(F_bandpass)