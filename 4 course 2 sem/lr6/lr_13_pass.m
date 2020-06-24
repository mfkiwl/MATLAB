script
clc
clear
disp('% לע ?13. ףימפות גיט-זילרפעב נז םופןהןם גילימוךמןחן Z-נעוןגעבתןקבמיס')
disp('%')
    Nb = 4; % מןםוע געיחבהש
    Fs = 5000 + 100*Nb; % ‏בףפןפב היףכעופיתבדיי (חÃ)
    fk1 = Fs/20 + 20*Nb; % חעבמי‏מבס ‏בףפןפב נת1 (חÃ)
    ft1 = Fs/20 + 250 + 25*Nb; % חעבמי‏מבס ‏בףפןפב ננ1 (חÃ)
    ft2 = Fs/4 + 25*Nb; % חעבמי‏מבס ‏בףפןפב נת2 (חÃ)
    fk2 = Fs/4 + 250 + 30*Nb; % חעבמי‏מבס ‏בףפןפב נת2 (חÃ)
    rp = 0.4455; % םבכףיםבלרמן הןנץףפיםןו תבפץטבמיו ק ננ
    rs = 40; % םימיםבלרמן הןנץףפיםןו תבפץטבמיו ק נת
disp('% Ð.2. ףימפות גיט-זילרפעןק גבפפועקןעפב, ‏וגשûוקב I י II עןהב י תןלןפבעוקב-כבץüעב')
disp('%')
disp('%')
disp('% הÌÑ ÓÉÎÔÅÚÁ גיט-ÆÉÌØÔÒÏ× נז ÎÁÖÍÉÔÅ <ENTER>')
pause
ft = [ft1 ft2]; fk = [fk1 fk2]; % קוכפןעש חעבמי‏משט ‏בףפןפ ננ É נת
WDp = ft/(Fs/2); WDs = fk/(Fs/2); % קוכפןעש חעבמי‏משט מןעםיעןקבממשט ‏בףפןפ ננ É נת
[R1,WDn1] = buttord(WDp,WDs,rp,rs); % נןעסהןכ י ‏בףפןפש ףעותב גיט-זילרפעב נז גבפפועקןעפב
[R2,WDn2] = cheb1ord(WDp,WDs,rp,rs); % נןעסהןכ י ‏בףפןפש ףעותב גיט-זילרפעב נז ‏וגשûוקב I עןהב
[R3,WDn3] = cheb2ord(WDp,WDs,rp,rs); % נןעסהןכ י ‏בףפןפש ףעותב גיט-זילרפעב נז ‏וגשûוקב II עןהב
[R4,WDn4] = ellipord(WDp,WDs,rp,rs); % נןעסהןכ י ‏בףפןפש ףעותב גיט-זילרפעב נז תןלןפבעוקב-כבץüעב
[b1,a1] = butter(R1,WDn1); % כןüזזידיומפש גיט-זילרפעב נז גבפפועקןעפב
[b2,a2] = cheby1(R2,rp,WDn2); % כןüזזידיומפש גיט-זילרפעב נז ‏וגשûוקב I עןהב
[b3,a3] = cheby2(R3,rs,WDn3); % כןüזזידיומפש גיט-זילרפעב נז ‏וגשûוקב II עןהב
[b4,a4] = ellip(R4,rp,rs,WDn4); % כןüזזידיומפש גיט-זילרפעב נז תןלןפבעוקב-כבץüעב
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ÐÏÒÑÄËÏ× גיט-ÆÉÌØÔÒÏ× נז ÎÁÖÍÉÔÅ <ENTER>')
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
disp('% Ð.3. במבלית טבעבכפועיףפיכ גיט-זילרפעןק נז')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ טבעבכפועיףפיכ גיט-זילרפעןק נז (‏ופשעו חעבזי‏וףכיט ןכמב) ÎÁÖÍÉÔÅ <ENTER>')
pause
figure('Name','Bandpass IIR Filter Butterworth','NumberTitle', 'off')
plot_iir(b1,a1,Fs) % טבעבכפועיףפיכי גיט-זילרפעב נז גבפפועקןעפב
figure('Name','Bandpass IIR Filter Chebyshov I','NumberTitle', 'off')
plot_iir(b2,a2,Fs) % טבעבכפועיףפיכי גיט-זילרפעב נז ‏וגשûוקב II עןהב
figure('Name','Bandpass IIR Filter Chebyshov II','NumberTitle', 'off')
plot_iir(b3,a3,Fs) % טבעבכפועיףפיכי גיט-זילרפעב נז ‏וגשûוקב II עןהב
figure('Name','Bandpass IIR Filter Elliptic','NumberTitle', 'off')
plot_iir(b4,a4,Fs) % טבעבכפועיףפיכי גיט-זילרפעב נז תןלןפבעוקב-כבץüעב
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.4. ףימפות בזנ גבפפועקןעפב, ‏וגשûוקב I י II עןהב י תןלןפבעוקב-כבץüעב')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ÇÒÁÎÉÞÎÙÈ ÞÁÓÔÏÔ בזנ נז נת1 (Fk1), ננ1 (Ft1), ננ2 (Ft2) É נת2 (Fk2) ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
ft = [ft1 ft2]; fk = [fk1 fk2]; % קוכפןעש חעבמי‏משט ‏בףפןפ ננ É נת גיט-זילרפעב
Ft = (Fs/pi)*tan(pi*ft/Fs); Fk = (Fs/pi)*tan(pi*fk/Fs); % קוכפןעש חעבמי‏משט ‏בףפןפ ננ É נת בזנ
disp([' Fk1 = ' num2str(Fk(1)),' Ft1 = ' num2str(Ft(1)),' Ft2 = ' num2str(Ft(2)),' Fk2 = ' num2str(Fk(2))])
disp('%')
disp('%')
disp('% הÌÑ ÓÉÎÔÅÚÁ בזנ נז ÎÁÖÍÉÔÅ <ENTER>')
pause
Wp = 2.*pi.*Ft; Ws = 2.*pi.*Fk; % קוכפןעש חעבמי‏משט כעץחןקשט ‏בףפןפ ננ É נת בזנ
[Ra1,Wn1] = buttord(Wp,Ws,rp,rs,'s'); % נןעסהןכ י ‏בףפןפש ףעותב בזנ נז גבפפועקןעפב
[Ra2,Wn2] = cheb1ord(Wp,Ws,rp,rs,'s');% נןעסהןכ י ‏בףפןפש ףעותב בזנ נז ‏וגשûוקב I עןהב
[Ra3,Wn3] = cheb2ord(Wp,Ws,rp,rs,'s');% נןעסהןכ י ‏בףפןפש ףעותב בזנ נז ‏וגשûוקב II עןהב
[Ra4,Wn4] = ellipord(Wp,Ws,rp,rs,'s');% נןעסהןכ י ‏בףפןפש ףעותב בזנ נז תןלןפבעוקב-כבץüעב
[bs1,as1] = butter(Ra1,Wn1,'s'); % כןüזזידיומפש בזנ נז גבפפועקןעפב
[bs2,as2] = cheby1(Ra2,rp,Wn2,'s'); % כןüזזידיומפש בזנ נז ‏וגשûוקב I עןהב
[bs3,as3] = cheby2(Ra3,rs,Wn3,'s'); % כןüזזידיומפש בזנ נז ‏וגשûוקב II עןהב
[bs4,as4] = ellip(Ra4,rp,rs,Wn4,'s'); % כןüזזידיומפש בזנ נז תןלןפבעוקב-כבץüעב
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ÐÏÒÑÄËÏ× בזנ נז ÎÁÖÍÉÔÅ <ENTER>')
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
figure('Name','Bandpass Analog Filter ? Magnitude','NumberTitle', 'off')
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
MAG_bandpass = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',fk1,ft1,ft2,fk2,rs,rp,rs,[Fs]) % ןגÿוכפ fdesign הלס נז
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.7. ףימפות גיט-זילרפעב נז תןלןפבעוקב-כבץüעב ק קיהו ןגÿוכפב dfilt')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב dfilt ÎÁÖÍÉÔÅ <ENTER>')
pause
F_bandpass = design(MAG_bandpass,'ellip','MatchExactly','both','FilterStructure','df2sos') % נז ק קיהו ןגÿוכפב dfilt
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.8. םבףûפבגיעןקבמיו ק כבףכבהמןך ףפעץכפץעו גיט-זילרפעב נז תןלןפבעוקבכבץüעב')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ףקןךףפק ןגÿוכפב dfilt ÐÏÓÌÅ ÍÁÓÛÔÁÂÉÒÏ×ÁÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
F_bandpass_scale = scale(F_bandpass) % עותץלרפבפ םבףûפבגיעןקבמיס
disp('%')
disp('% הÌÑ קשקןהב ב‏ט ף נןםן‎רא נבכופב GUI FVTool ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
fvtool(F_bandpass_scale)
disp('% ףימפות גיט-זילרפעב נז תבקועûומ')
