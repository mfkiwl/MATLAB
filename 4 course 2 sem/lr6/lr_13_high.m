script
clc
clear
disp('% לע ?13. ףימפות גיט-זילרפעב זק‏ םופןהןם גילימוךמןחן Z-נעוןגעבתןקבמיס')
disp('%')
    Nb = 4; % מןםוע געיחבהש
    Fs = 5000 + 100*Nb; % ‏בףפןפב היףכעופיתבדיי (חÃ)
    fk = Fs/10 + 20*Nb; % חעבמי‏מבס ‏בףפןפב ננ (חÃ)
    ft = Fs/10 + 250 + 25*Nb; % חעבמי‏מבס ‏בףפןפב נת (חÃ)
    rp = 0.4455; % םבכףיםבלרמן הןנץףפיםןו תבפץטבמיו ק ננ
    rs = 40; % םימיםבלרמן הןנץףפיםןו תבפץטבמיו ק נת
disp('%')
disp('% Ð.2. ףימפות גיט-זילרפעןק גבפפועקןעפב, ‏וגשûוקב I י II עןהב י תןלןפבעוקב-כבץüעב')
disp('%')
disp('%')
disp('% הÌÑ ÓÉÎÔÅÚÁ גיט-ÆÉÌØÔÒÏ× זק‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
WDp = ft/(Fs/2); WDs = fk/(Fs/2); % חעבמי‏משו מןעםיעןקבממשו ‏בףפןפש ננ É נת
[R1,WDn1] = buttord(WDp,WDs,rp,rs); % נןעסהןכ י ‏בףפןפב ףעותב גיט-זילרפעב זק‏ גבפפועקןעפב
[R2,WDn2] = cheb1ord(WDp,WDs,rp,rs); % נןעסהןכ י ‏בףפןפב ףעותב גיט-זילרפעב זק‏ ‏וגשûוקב I עןהב
[R3,WDn3] = cheb2ord(WDp,WDs,rp,rs); % נןעסהןכ י ‏בףפןפב ףעותב גיט-זילרפעב זק‏ ‏וגשûוקב II עןהב
[R4,WDn4] = ellipord(WDp,WDs,rp,rs); % נןעסהןכ י ‏בףפןפב ףעותב גיט-זילרפעב זק‏ תןלןפבעוקב-כבץüעב
[b1,a1] = butter(R1,WDn1,'high'); % כןüזזידיומפש גיט-זילרפעב זק‏ גבפפועקןעפב
[b2,a2] = cheby1(R2,rp,WDn2,'high'); % כןüזזידיומפש גיט-זילרפעב זק‏ ‏וגשûוקב I עןהב
[b3,a3] = cheby2(R3,rs,WDn3,'high'); % כןüזזידיומפש גיט-זילרפעב זק‏ ‏וגשûוקב II עןהב
[b4,a4] = cheby2(R4,rs,WDn4,'high'); % כןüזזידיומפש גיט-זילרפעב זק‏ ‏וגשûוקב י תןלןפבעוקב-כבץüעב
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ÐÏÒÑÄËÏ× גיט-ÆÉÌØÔÒÏ× זק‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp([' R1 = ' num2str(R1),' R2 = ' num2str(R2),' R3 = ' num2str(R3),' R4 = ' num2str(R4)])
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.3. במבלית טבעבכפועיףפיכ גיט-זילרפעןק זק‏')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ טבעבכפועיףפיכ גיט-זילרפעןק זק‏ (‏ופשעו חעבזי‏וףכיט ןכמב) ÎÁÖÍÉÔÅ <ENTER>')
pause
figure('Name','Highpass IIR Filter Butterworth','NumberTitle', 'off')
plot_iir(b1,a1,Fs) % טבעבכפועיףפיכי גיט-זילרפעב זק‏ גבפפועקןעפב
figure('Name','Highpass IIR Filter Chebyshov I','NumberTitle', 'off')
plot_iir(b2,a2,Fs) % טבעבכפועיףפיכי גיט-זילרפעב זק‏ ‏וגשûוקב II עןהב
figure('Name','HighpassIIR Filter Chebyshov II','NumberTitle', 'off')
plot_iir(b3,a3,Fs) % טבעבכפועיףפיכי גיט-זילרפעב זק‏ ‏וגשûוקב II עןהב
figure('Name','Highpass IIR Filter Elliptic','NumberTitle', 'off')
plot_iir(b4,a4,Fs) % טבעבכפועיףפיכי גיט-זילרפעב זק‏ תןלןפבעוקב-כבץüעב
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.4. ףימפות בזנ גבפפועקןעפב, ‏וגשûוקב I י II עןהב י תןלןפבעוקב-כבץüעב')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ÇÒÁÎÉÞÎÙÈ ÞÁÓÔÏÔ בזנ זק‏ נת (Fk) É ננ (Ft) ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
Ft = (Fs/pi)*tan(pi*ft/Fs); Fk = (Fs/pi)*tan(pi*fk/Fs); % חעבמי‏משו ‏בףפןפש ננ É נת בזנ
disp([' Fk = ' num2str(Fk),' Ft = ' num2str(Ft)])
disp('%')
disp('%')
disp('% הÌÑ ÓÉÎÔÅÚÁ בזנ זק‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
Wp = 2.*pi.*Ft; Ws = 2.*pi.*Fk; % חעבמי‏משו כעץחןקשו ‏בףפןפש ננ É נת בזנ
[Ra1,Wn1] = buttord(Wp,Ws,rp,rs,'s'); % נןעסהןכ י ‏בףפןפב ףעותב בזנ זק‏ גבפפועקןעפב
[Ra2,Wn2] = cheb1ord(Wp,Ws,rp,rs,'s'); % נןעסהןכ י ‏בףפןפב ףעותב בזנ זק‏ ‏וגשûוקב I עןהב
[Ra3,Wn3] = cheb2ord(Wp,Ws,rp,rs,'s'); % נןעסהןכ י ‏בףפןפב ףעותב בזנ זק‏ ‏וגשûוקב II עןהב
[Ra4,Wn4] = ellipord(Wp,Ws,rp,rs,'s'); % נןעסהןכ י ‏בףפןפב ףעותב בזנ זק‏ תןלןפבעוקב-כבץüעב
[bs1,as1] = butter(Ra1,Wn1,'high','s'); % כןüזזידיומפש בזנ זק‏ גבפפועקןעפב
[bs2,as2] = cheby1(Ra2,rp,Wn2,'high','s'); % כןüזזידיומפש בזנ זק‏ ‏וגשûוקב I עןהב
[bs3,as3] = cheby2(Ra3,rs,Wn3,'high','s'); % כןüזזידיומפש בזנ זק‏ ‏וגשûוקב II עןהב
[bs4,as4] = ellip(Ra4,rp,rs,Wn4,'high','s'); % כןüזזידיומפש בזנ זק‏ ‏וגשûוקב י תןלןפבעוקב-כבץüעב
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ÐÏÒÑÄËÏ× בזנ זק‏ ÎÁÖÍÉÔÅ <ENTER>')
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
Ha1 = freqs(bs1,as1,W); % ‏ט בזנ גבפפועקןעפב
Ha2 = freqs(bs2,as2,W); % ‏ט בזנ ‏וגשûוקב I עןהב
Ha3 = freqs(bs3,as3,W); % ‏ט בזנ ‏וגשûוקב II עןהב
Ha4 = freqs(bs4,as4,W); % ‏ט בזנ תןלןפבעוקב-כבץüעב
figure('Name','Highpass Analog Filter ? Magnitude','NumberTitle', 'off')
subplot(2,2,1),plot(f,abs(Ha1)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Butterworth'),ylim([0 1.2])
subplot(2,2,2),plot(f,abs(Ha2)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Chebyshov I'),ylim([0 1.2])
subplot(2,2,3),plot(f,abs(Ha3)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Chebyshov II'),ylim([0 1.2])
subplot(2,2,4),plot(f,abs(Ha4)),xlabel('f(Hz)'),grid,...
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
MAG_highpass = fdesign.highpass('Fst,Fp,Ast,Ap',fk,ft,rs,rp,[Fs]) % ןגÿוכפ fdesign הלס זק‏
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.7. ףימפות גיט-זילרפעב זק‏ תןלןפבעוקב-כבץüעב ק קיהו ןגÿוכפב dfilt')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב dfilt ÎÁÖÍÉÔÅ <ENTER>')
pause
F_highpass = design(MAG_highpass,'ellip','MatchExactly', 'both','FilterStructure','df2sos') % זק‏ ק קיהו ןגÿוכפב dfilt
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.8. םבףûפבגיעןקבמיו ק כבףכבהמןך ףפעץכפץעו גיט-זילרפעב זק‏ תןלןפבעוקב-כבץüעב')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב dfilt ÐÏÓÌÅ ÍÁÓÛÔÁÂÉÒÏ×ÁÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
F_highpass_scale = scale(F_highpass,'L2') % עותץלרפבפ םבףûפבגיעןקבמיס
disp('%')
disp('% הÌÑ קשקןהב ב‏ט ף נןםן‎רא נבכופב GUI FVTool ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
fvtool(F_highpass_scale)
disp('% ףימפות גיט-זילרפעב זק‏ תבקועûומ')
