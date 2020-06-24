function [tracks] = track(detect_vec, last_tracks)
    dDist_max = 2;
    dVel_max  = 1;
    dMax = dDist_max^2 + dVel_max^2;
    
    last_tracks_size = size(last_tracks,2);
    maxId = 0;
    if (last_tracks_size > 0)
        if (last_tracks_size > 1)
            maxId = max(last_tracks.id);
        else
            maxId = last_tracks.id;
        end
    end
    
    similarity_map = zeros(size(detect_vec,2), size(last_tracks,2));
    
    for i = 1:size(detect_vec,2)
       for j = 1:size(last_tracks,2)
           similarity_map(i,j) = (detect_vec(i).dist - last_tracks(j).dist)^2 ...
                               + (detect_vec(i).vel - last_tracks(j).vel)^2;
       end
    end
    
    tracks = struct('dist', {}, 'vel', {}, 'id', {}, 'lifeTime', {});
    while size(detect_vec,2) > 0 && size(last_tracks,2) > 0
        [val,I] = min(similarity_map(:));
        [detIdx, trackIdx] = ind2sub(size(similarity_map),I);
        if (val <= dMax)
            tr = last_tracks(trackIdx);
            tr.dist = detect_vec(detIdx).dist;
            tr.vel  = detect_vec(detIdx).vel;
            tracks = [tracks tr];
            
            last_tracks(trackIdx) = [];
            detect_vec(detIdx) = [];
            similarity_map(:,trackIdx) = [];
        else
            break;
        end
    end
    for i = 1:size(tracks,2)
        tracks(i).lifeTime = tracks(i).lifeTime + 1;
    end
    
    for i = 1:size(detect_vec,2)
       maxId = maxId + 1;
       tr = struct('dist', detect_vec(i).dist, 'vel', detect_vec(i).vel, 'id', maxId, 'lifeTime', 0);
       tracks = [tracks tr];
    end
end

