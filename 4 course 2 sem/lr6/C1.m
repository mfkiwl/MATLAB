script
clc
clear
disp('% לע ?13. ףימפות גיט-זילרפעב זמ‏ תןלןפבעוקב-כבץüעב ף נעןיתקןלרמשםי פעוגןקבמיסםי כ טבע-כו תבפץטבמיס')
disp('%')
    Nb = 4; % מןםוע געיחבהש
    Fs = 7000 + 100*Nb; % ‏בףפןפב היףכעופיתבדיי (חÃ)(choose randomly, but smartly)
    ft = Fs/10 + 20*Nb; % חעבמי‏מבס ‏בףפןפב ננ (חÃ)(choose randomly, but smartly)
    fk = Fs/10 + 250 + 25*Nb; % חעבמי‏מבס ‏בףפןפב נת (חÃ)(choose randomly, but smartly)
    rp = 1.0; % םבכףיםבלרמן הןנץףפיםןו תבפץטבמיו ק ננ (choose randomly, but smartly)
    rs = 25; % םימיםבלרמן הןנץףפיםןו תבפץטבמיו ק נת (choose randomly, but smartly)
disp('%')
disp('% Ð.2. ףימפות גיט-זילרפעןק גבפפועקןעפב, ‏וגשûוקב I י II עןהב י תןלןפבעוקב-כבץüעב')
disp('%')
disp('% הÌÑ ÓÉÎÔÅÚÁ גיט-ÆÉÌØÔÒÏ× זמ‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
WDp = ft/(Fs/2); WDs = fk/(Fs/2); % חעבמי‏משו מןעםיעןקבממשו ‏בףפןפש ננ É נת
[R4,WDn4] = ellipord(WDp,WDs,rp,rs);% נןעסהןכ י ‏בףפןפב ףעותב גיט-זילרפעב זמ‏ תןלןפבעוקב-כבץüעב
[b4,a4] = ellip(R4,rp,rs,WDn4); % כןüזזידיומפש גיט-זילרפעב זמ‏ תןלןפבעוקב-כבץüעב
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ÐÏÒÑÄËÏ× גיט-ÆÉÌØÔÒÏ× זמ‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp([' R4 = ' num2str(R4)])
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('% Ð.3. במבלית טבעבכפועיףפיכ גיט-זילרפעב זמ‏')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ טבעבכפועיףפיכ גיט-זילרפעב זמ‏ תןלןפבעוקב-כבüץעב ÎÁÖÍÉÔÅ <ENTER>')
pause
figure('Name','Lowpass IIR Filter Elliptic','NumberTitle', 'off')
plot_iir(b4,a4,Fs) % טבעבכפועיףפיכי גיט-זילרפעב זמ‏ תןלןפבעוקב-כבץüעב
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('% Ð.4. ףימפות בנז תןלןפבעוקב-כבץüעב')
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
[Ra4,Wn4] = ellipord(Wp,Ws,rp,rs,'s'); % נןעסהןכ י ‏בףפןפב ףעותב בזנ זמ‏ תןלןפבעוקב-כבץüעב
[bs4,as4] = ellip(Ra4,rp,rs,Wn4,'s'); % כןüזזידיומפש בזנ זמ‏ תןלןפבעוקב-כבץüעב
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ ÐÏÒÑÄËÏ× בזנ זמ‏ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp([' Ra4 = ' num2str(Ra4)])
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% Ð.5. קשקןה חעבזיכב ב‏ט בזנ תןלןפבעוקב-כבץüעב')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ חעבזיכןק ב‏ט בזנ ÎÁÖÍÉÔÅ <ENTER>')
pause
f = 0:((Fs/2)/1000):Fs/2; % ףופכב ‏בףפןפ הלס חעבזיכב ב‏ט
W = 2.*pi.*f;
Ha4 = freqs(bs4,as4,W); MAG4 = abs(Ha4); % ‏ט É ב‏ט בזנ זמ‏ תןלןפבעוקב-כבץüעב
figure('Name','Lowpass Analog Filter ? Magnitude','NumberTitle', 'off')
plot(f, abs(Ha4)),xlabel('f(Hz)'),grid,...
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
F_lowpass_scale = scale(F_lowpass, 'L2') % עותץלרפבפ םבףûפבגיעןקבמיס
disp('%')
disp('% הÌÑ קשקןהב ב‏ט ף נןםן‎רא נבכופב GUI FVTool ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
fvtool(F_lowpass_scale)
disp('%')
disp('% ףימפות גיט-זילרפעב זמ‏ תבקועûומ')