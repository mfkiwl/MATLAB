dDist = 1;
dVel  = 0;

det1 = struct('dist', 10, 'vel', 10);
det2 = struct('dist', 40, 'vel', 30);

doppler_fft_size = 64;
range_fft_size = 128;

figure (1)
xlabel('Дальность [м]');
ylabel('Скорость [м/с]');
colormap jet
[dist, vel] = meshgrid(1:doppler_fft_size, 1:range_fft_size);

tracks = struct('dist', {}, 'vel', {}, 'id', {}, 'lifeTime', {});
while det1.dist <= range_fft_size && det1.vel <= doppler_fft_size
    det_mat = zeros(range_fft_size, doppler_fft_size);
    det_mat(det1.dist, det1.vel) = 1;
    det_mat(det2.dist, det2.vel) = 1;
    
    % Tracking
    %track1 = struct('dist', det1.dist, 'vel', det1.vel, 'id', 1, 'lifeTime', 0);
    tracks = track([det1 det2], tracks);
    
    surf(dist, vel, det_mat);
    mark_tracks(tracks);
    colorbar
    axis tight
    view(2)
    
    det1.dist = det1.dist + dDist;
    det1.vel  = det1.vel  + dVel;
    
    pause(1/10);
end