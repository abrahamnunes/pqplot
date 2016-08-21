%==============================================================================
% PQTS
%   Publication quality time series
%
% INPUTS:
%   y = column vector or [N X K] matrix of time series (columns = indiv series)
%   t = [starttime, endtime]
%   alpha = line transparency
%   stat  = cell array of statistics to plot in the chart
%
% OUTPUT:
%   g = pqplot object
%
%
% 2016 Abraham Nunes
%==============================================================================

function g = pqts(y, t, alpha, stat)

    load viridis.mat

    nsteps  = size(y, 1);
    nseries = size(y, 2);

    x = linspace(t(1), t(2), nsteps+1);
    y = vertcat(y, nan(1, nseries));

    for j = 1:nseries
        ts = patch(x, y(:, j), 'black'          , ...
                   'FaceVertexAlphaData', alpha , ...
                   'EdgeAlpha'          , alpha );
        set(ts             , ...
            'LineWidth', 1.5 );
    end

    if ~isempty(find(strcmp(stat, 'seriesmean')))
        hold on;
        sm = plot(x, mean(y, 2));
        set(sm , ...
            'LineWidth', 1.5 , ...
            'Color'    , viridi(floor(256*(5/6)),:));
        hold off;
    end

    set(gca                           , ...
        'FontSize'  , 14              , ...
        'Box'       , 'on'            , ...
        'YGrid'     , 'on'            , ...
        'XGrid'     , 'on'            , ...
        'LineWidth' , 1.2             );

    g.axes = gca;

end
