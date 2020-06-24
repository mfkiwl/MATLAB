function mark_tracks(tracks)
    for i = 1:size(tracks,2)
        tr = tracks(i);
        if (tr.lifeTime > 2)
            text(tr.vel, tr.dist+4, 1, num2str(tr.id,'Track ¹%d'), 'FontSize', 12, 'Color', 'red');
        end
    end
end

