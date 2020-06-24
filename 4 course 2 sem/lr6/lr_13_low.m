script
clc
clear
disp('% לע ?13. ףימפות גיט-זילרפעב זמ‏ םופןהןם גילימוךמןחן Z-נעוןגעבתןקבמיס')
disp('%')
Nb = 4; % מןםוע געיחבהש
Fs = 5000 + 100*Nb; % ‏בףפןפב היףכעופיתבדיי (חÃ)
ft = Fs/10 + 20*Nb; % חעבמי‏מבס ‏בףפןפב ננ (חÃ)
fk = Fs/10 + 250 + 25*Nb; % חעבמי‏מבס ‏בףפןפב נת (חÃ)
rp = 0.4455; % םבכףיםבלרמן הןנץףפיםןו תבפץטבמיו ק ננ
rs = 40; % םימיםבלרמן הןנץףפיםןו תבפץטבמיו ק נת
disp('%')
disp('% Ð.2. ףימפות גיט-זילרפעןק גבפפועקןעפב, ‏וגשûוקב I י II עןהב י תןלןפבעוקב-כבץüעב')
disp('%')
disp('% הÌÑ ÓÉÎÔÅÚÁ גיט-ÆÉÌØÔÒÏ× זמ‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
WDp = ft/(Fs/2); WDs = fk/(Fs/2); % חעבמי‏משו מןעםיעןקבממשו ‏בףפןפש ננ É נת
[R1,WDn1] = buttord(WDp,WDs,rp,rs); % נןעסהןכ י ‏בףפןפב ףעותב גיט-זילרפעב זמ‏ גבפפועקןעפב
[R2,WDn2] = cheb1ord(WDp,WDs,rp,rs);% נןעסהןכ י ‏בףפןפב ףעותב גיט-זילרפעב ‏וגשûוקב I עןהב
[R3,WDn3] = cheb2ord(WDp,WDs,rp,rs);% נןעסהןכ י ‏בףפןפב ףעותב גיט-זילרפעב זמ‏ ‏וגשûוקב II עןהב
[R4,WDn4] = ellipord(WDp,WDs,rp,rs);% נןעסהןכ י ‏בףפןפב ףעותב גיט-זילרפעב זמ‏ תןלןפבעוקב-כבץüעב
[b1,a1] = butter(R1,WDn1); % כןüזזידיומפש גיט-זילרפעב זמ‏ גבפפועקןעפב
[b2,a2] = cheby1(R2,rp,WDn2); % כןüזזידיומפש גיט-זילרפעב זמ‏ ‏וגשûוקב I עןהב
[b3,a3] = cheby2(R3,rs,WDn3); % כןüזזידיומפש גיט-זילרפעב זמ‏ ‏וגשûוקב II עןהב
[b4,a4] = ellip(R4,rp,rs,WDn4); % כןüזזידיומפש גיט-זילרפעב זמ‏ תןלןפבעוקב-כבץüעב
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ÐÏÒÑÄËÏ× גיט-ÆÉÌØÔÒÏ× זמ‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp([' R1 = ' num2str(R1),' R2 = ' num2str(R2),' R3 = ' num2str(R3),' R4 = ' num2str(R4)])
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('% Ð.3. במבלית טבעבכפועיףפיכ גיט-זילרפעןק זמ‏')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ טבעבכפועיףפיכ גיט-זילרפעןק זמ‏ (‏ופשעו חעבזי‏וףכיט ןכמב) ÎÁÖÍÉÔÅ <ENTER>')
pause
figure('Name','Lowpass IIR Filter Butterworth','NumberTitle', 'off')
plot_iir(b1,a1,Fs) % טבעבכפועיףפיכי גיט-זילרפעב זמ‏ גבפפועקןעפב
figure('Name','Lowpass IIR Filter Chebyshov I','NumberTitle', 'off')
plot_iir(b2,a2,Fs) % טבעבכפועיףפיכי גיט-זילרפעב זמ‏ ‏וגשûוקב II עןהב
figure('Name','Lowpass IIR Filter Chebyshov II','NumberTitle', 'off')
plot_iir(b3,a3,Fs) % טבעבכפועיףפיכי גיט-זילרפעב זמ‏ ‏וגשûוקב II עןהב
figure('Name','Lowpass IIR Filter Elliptic','NumberTitle', 'off')
plot_iir(b4,a4,Fs) % טבעבכפועיףפיכי גיט-זילרפעב זמ‏ תןלןפבעוקב-כבץüעב
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('% Ð.4. ףימפות בנז גבפפועקןעפב, ‏וגשûוקב I י II עןהב י תןלןפבעוקב-כבץüעב')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ÇÒÁÎÉÞÎÙÈ ÞÁÓÔÏÔ בזנ זמ‏ ננ (Ft) É נת (Fk) ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
Ft = (Fs/pi)*tan(pi*ft/Fs); Fk = (Fs/pi)*tan(pi*fk/Fs); % חעבמי‏משו ‏בףפןפש ננÉ נת בזנ
disp([' Ft = ' num2str(Ft),' Fk = ' num2str(Fk)])
disp('%')
disp('%')
disp('% הÌÑ ÓÉÎÔÅÚÁ בזנ זמ‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
Wp = 2.*pi.*Ft; Ws = 2.*pi.*Fk; % חעבמי‏משו כעץחןקשו ‏בףפןפש ננ É נת בזנ
[Ra1,Wn1] = buttord(Wp,Ws,rp,rs,'s'); % נןעסהןכ י ‏בףפןפב ףעותב בזנ זמ‏ גבפפועקןעפב
[Ra2,Wn2] = cheb1ord(Wp,Ws,rp,rs,'s'); % נןעסהןכ י ‏בףפןפב ףעותב בזנ זמ‏ ‏וגשûוקב I עןהב
[Ra3,Wn3] = cheb2ord(Wp,Ws,rp,rs,'s'); % נןעסהןכ י ‏בףפןפב ףעותב בזנ זמ‏ ‏וגשûוקב II עןהב
[Ra4,Wn4] = ellipord(Wp,Ws,rp,rs,'s'); % נןעסהןכ י ‏בףפןפב ףעותב בזנ זמ‏ תןלןפבעוקב-כבץüעב
[bs1,as1] = butter(Ra1,Wn1,'s'); % כןüזזידיומפש בזנ זמ‏ גבפפועקןעפב
[bs2,as2] = cheby1(Ra2,rp,Wn2,'s'); % כןüזזידיומפש בזנ זמ‏ ‏וגשûוקב I עןהב
[bs3,as3] = cheby2(Ra3,rs,Wn3,'s'); % כןüזזידיומפש בזנ זמ‏ ‏וגשûוקב II עןהב
[bs4,as4] = ellip(Ra4,rp,rs,Wn4,'s'); % כןüזזידיומפש בזנ זמ‏ תןלןפבעוקב-כבץüעב
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ÐÏÒÑÄËÏ× בזנ זמ‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp([' Ra1 = ' num2str(Ra1),' Ra2 = ' num2str(Ra2),' Ra3 = ' num2str(Ra3),' Ra4 = ' num2str(Ra4)])
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.5. קשקןה חעבזיכןק ב‏ט בזנ גבפפועקןעפב, ‏וגשûוקב I י II עןהב י תןלןפבעוקב-כבץüעב')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ חעבזיכןק ב‏ט בזנ ÎÁÖÍÉÔÅ <ENTER>')
pause
f = 0:((Fs/2)/1000):Fs/2; % ףופכב ‏בףפןפ הלס חעבזיכב ב‏ט
W = 2.*pi.*f;
Ha1 = freqs(bs1,as1,W); MAG1 = abs(Ha1); % ‏ט É ב‏ט בזנ זמ‏ גבפפועקןעפב
Ha2 = freqs(bs2,as2,W); MAG2 = abs(Ha2); % ‏ט É ב‏ט בזנ זמ‏ ‏וגשûוקב I עןהב
Ha3 = freqs(bs3,as3,W); MAG3 = abs(Ha3); % ‏ט É ב‏ט בזנ זמ‏ ‏וגשûוקב II עןהב
Ha4 = freqs(bs4,as4,W); MAG4 = abs(Ha4); % ‏ט É ב‏ט בזנ זמ‏ תןלןפבעוקב-כבץüעב
figure('Name','Lowpass Analog Filter ? Magnitude','NumberTitle', 'off')
subplot(2,2,1),plot(f,abs(Ha1)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Butterworth'),ylim([0 1.2])
subplot(2,2,2),plot(f,abs(Ha2)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Chebyshov I'),ylim([0 1.2])
subplot(2,2,3),plot(f,abs(Ha3)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Chebyshov II'),ylim([0 1.2])
subplot(2,2,4),plot(f, abs(Ha4)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Elliptic'),ylim([0 1.2])
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.6. ןניףבמיו פעוגןקבמיך כ ב‏ט גיט-ÆÉÌØÔÒÁ ק קיהו ןגÿוכפב fdesign')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב fdesign ÎÁÖÍÉÔÅ <ENTER>')
pause
MAG_lowpass = fdesign.lowpass('Fp,Fst,Ap,Ast',ft,fk,rp,rs,[Fs]) % ןגÿוכפ fdesign הלס זמ‏
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.7. ףימפות גיט-זילרפעב זמ‏ תןלןפבעוקב-כבץüעב ק קיהו ןגÿוכפב dfilt')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב dfilt ÎÁÖÍÉÔÅ <ENTER>')
pause
F_lowpass = design(MAG_lowpass,'ellip','MatchExactly', 'both','FilterStructure','df2sos') % זמ‏ ק קיהו ןגÿוכפב dfilt
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.8. םבףûפבגיעןקבמיו ק כבףכבהמןך ףפעץכפץעו גיט-זילרפעב זמ‏ תןלןפבעוקב-כבץüעב')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב dfilt ÐÏÓÌÅ ÍÁÓÛÔÁÂÉÒÏ×ÁÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
F_lowpass_scale = scale(F_lowpass) % עותץלרפבפ םבףûפבגיעןקבמיס
disp('%')
disp('% הÌÑ קשקןהב ב‏ט ף נןםן‎רא נבכופב GUI FVTool ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
fvtool(F_lowpass_scale)
disp('%')
disp('% ףימפות גיט-זילרפעב זמ‏ תבקועûומ')
