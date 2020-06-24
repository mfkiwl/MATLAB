clc
clear
disp('% Π.6. χωώισμεξιε λςυηοχοκ σχεςτλι')
x3 = [0 0.25 0.5 0.75 1]; % πεςχαρ ποσμεδοχατεμψξοστψ
x4 = [0 0.5 1 0.5 0]; % χτοςαρ ποσμεδοχατεμψξοστψ
y34 = ifft(fft(x3).*fft(x4));% λςυηοχαρ σχεςτλα ποσμεδοχατεμψξοστεκ
L34 = length(y34); % πεςιοδ λςυηοχοκ σχεςτλι
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ΗÒΑΖΙΛΟΧ ποσμεδοχατεμψξοστεκ Ι λςυηοχοκ ΣΧΕÒΤΛΙ (3 ΠΕÒΙΟΔΑ)ΞΑΦΝΙΤΕ <ENTER>')
pause
figure('Name','Sequences x3, x4, y34','NumberTitle', 'off')
subplot(3,1,1), stem((0:3*L34-1),...
    repmat(x3,1,3),'fill','Linewidth',2,'MarkerSize',3), grid
xlabel('n'), title('Periodic Sequence x3(n)')
subplot(3,1,2), stem((0:3*L34-1), repmat(x4,1,3),'fill','Linewidth',2,'MarkerSize',3), grid
xlabel('n'), title('Periodic Sequence x4(n)')
subplot(3,1,3), stem((0:3*L34-1), repmat(y34,1,3),'fill','Linewidth',2,'MarkerSize',3), grid, xlabel('n')
title('Periodic Sequence y34(n) ? Convolution with FFT and IFFT')
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp('% ςαβοτα ϊαχεςϋεξα')