script
clc
clear
disp('% לע No12. ףימפות כיט-זילרפעב עז םופןהןם ‏וגשûוקףכןך בננעןכףיםבדיי')
disp('%')
disp('%')
disp('% Ð.1. קקןה פעוגןקבמיך כ ב‏ט עז')
disp('%')
disp('%')
Nb = 4;
Fs = 5000 + 100*Nb;
ft1 = Fs/10 + 20*Nb; % ÇÒÁÎÉÞÎÁÑ ÞÁÓÔÏÔÁ ננ1
fk1 = Fs/10 + 250 + 20*Nb; % חÒÁÎÉÞÎÁÑ ÞÁÓÔÏÔÁ נת
fk2 = Fs/4 + 25*Nb; % ÇÒÁÎÉÞÎÁÑ ÞÁÓÔÏÔÁ נת
ft2 = Fs/4 + 250 + 30*Nb; % ÇÒÁÎÉÞÎÁÑ ÞÁÓÔÏÔÁ ננ2
d11 = 0.05; % ÍÁËÓÉÍÁÌØÎÏ ÄÏÐÕÓÔÉÍÏÅ ÏÔËÌÏÎÅÎÉÅ × ננ1
d2 = 0.01; % ÍÁËÓÉÍÁÌØÎÏ ÄÏÐÕÓÔÉÍÏÅ ÏÔËÌÏÎÅÎÉÅ × נת
d12 = 0.05; % ÍÁËÓÉÍÁÌØÎÏ ÄÏÐÕÓÔÉÍÏÅ ÏÔËÌÏÎÅÎÉÅ × ננ2
Ap1 = 0.4455; % ÍÁËÓÉÍÁÌØÎÏ ÄÏÐÕÓÔÉÍÏÅ ÚÁÔÕÈÁÎÉÅ × ננ1
Ast = 40; % ÍÁËÓÉÍÁÌØÎÏ ÄÏÐÕÓÔÉÍÏÅ ÚÁÔÕÈÁÎÉÅ × נת
Ap2 = 0.4455; % ÍÁËÓÉÍÁÌØÎÏ ÄÏÐÕÓÔÉÍÏÅ ÚÁÔÕÈÁÎÉÅ × ננ2
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.2. קש‏יףלומיו נבעבםופעןק זץמכדיי firpmord')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ נןעסהכב כיט-ÆÉÌØÔÒÁ (R) É קוףןק × ננ1, נת É ננ2 (weight) ÎÁÖÍÉÔÅ <ENTER>')
pause
m = [1 0 1]; % קוכפןע תמב‏ומיך יהובלרמןך ב‏ט
f = [ft1 fk1 fk2 ft2]; % קוכפןע חעבמי‏משט ‏בףפןפ
ripple = [d11 d2 d12]; % קוכפןע םבכףיםבלרמן הןנץףפיםשט ןפכלןמומיך
[R,f0,m0,weight] = firpmord(f,m,ripple,Fs);% קש‏יףלומיו נבעבםופעןק זץמכדיי firpmord
disp('%')
disp(['R = ' num2str(R)]) % ןדומכב נןעסהכב זילרפעב
weight = [weight(1) weight(2) weight(3)] % קוףב ק ננ É נת
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.3. ףימפות כיט-זילרפעב עז')
ORDER = 0; % נעיתמבכ ןנפיםבלרמןףפי נןעסהכב כיט-זילרפעב: 0 ? מוןנפיםבלרמשך; 1 ? ןנפיםבלרמשך
while ORDER==0;
disp('%')
disp('%')
disp('% הÌÑ ÓÉÎÔÅÚÁ כיט-ÆÉÌØÔÒÁ עז ÎÁÖÍÉÔÅ <ENTER>')
pause
[b4,error,opt] = firpm(R,f0,m0,weight); % כןüזזידיומפש כיט-זילרפעב עז b4 
disp('%')
disp('%')
disp([' ףÉÎÔÅÚÉÒÏ×ÁÎ כיט-ÆÉÌØÔÒ עז ÐÏÒÑÄËÁ R = ' num2str(R)])
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ םבכףיםבלרמןך קתקוûוממןך ןûיגכי בננעןכףיםבדיי error') 
disp('% É הןנץףפיםןחן קתקוûוממןחן ןפכלןמומיס max{d11,d2,d12} ÎÁÖÍÉÔÅ <ENTER>') 
pause
disp('%')
disp(['error = ' num2str(error)]) % זבכפי‏וףכןו םבכףיםבלרמןו ןפכלןמומיו ב‏ט ןפ יהובלרמןך
disp(['max{d11,d2,d12} = ' num2str(max([d11,d2,d12]))]) % תבהבממןו ןפכלןמומיו max{d11,d2,d12}
disp('%')
disp('%')
disp('% ףÒÁ×ÎÉÔÅ זבכפי‏וףכןו ÏÔËÌÏÎÅÎÉÅ ב‏ט Ó תבהבממשם') 
disp('%')
disp('% וÓÌÉ נןעסהןכ ÓÏÏÔ×ÅÔÓÔ×ÕÅÔ םימיםבלרמןםץ, ××ÅÄÉÔÅ 1') 
disp('% וÓÌÉ מו ÓÏÏÔ×ÅÔÓÔ×ÕÅÔ, ××ÅÄÉÔÅ 0 É ÚÁÔÅÍ נןעסהןכ R') 
ORDER = input('--> ');
  if ORDER==0
R = input('R = ');
while rem(R,2)~=0
disp('% נÏÒÑÄÏË ÆÉÌØÔÒÁ ×ÙÂÒÁÎ מונעבקילרמן')
R = input('R = ');
end
end
end
disp('%')
% נןעסהןכ כיט-זילרפעב
% נןעסהןכ כיט-זילרפעב
  disp([' ףÉÎÔÅÚÉÒÏ×ÁÎ ÏÐÔÉÍÁÌØÎÙÊ עז ÐÏÒÑÄËÁ R = ' num2str(R)])
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.4. במבלית טבעבכפועיףפיכ כיט-זילרפעב עז')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ חעבזיכןק יט, ב‏ט י ז‏ט ÎÁÖÍÉÔÅ <ENTER>')
pause
figure('Name','Bandstop FIR Filter ? Impulse Response, Magnitude, Phase','NumberTitle', 'off')
plot_fir(R,b4,Fs) % נןףפעןומיו חעבזיכןק יט, ב‏ט É ז‏ט
disp('%')
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
figure('Name','Bandstop Filter ? Magnitude','NumberTitle', 'off')
MAG_fir(b4,opt.fextr,f0,m0,Fs) % חעבזיכ ב‏ט ף ‏בףפןפבםי בלרפועמבמףב disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.6. ןניףבמיו פעוגןקבמיך כ ב‏ט כיט-ÆÉÌØÔÒÁ עז ק קיהו ןגÿוכפב fdesign') 
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב fdesign ÎÁÖÍÉÔÅ <ENTER>')
pause
MAG_bandstop = fdesign.bandstop('Fp1,Fst1,Fst2,Fp2,Ap1,Ast,Ap2',ft1,fk1,fk2, ft2,Ap1,Ast,Ap2,Fs) % ןגÿוכפ fdesign הלס עז
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
F_bandstop = equiripple(MAG_bandstop) % עז ק קיהו ןגÿוכפב dfilt
disp('%')
disp('%')
disp('% ףימפות כיט-זילרפעב עז תבקועûומ')
       