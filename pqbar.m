%==============================================================================
% PQBAR
%   Publication quality bar plot
%
% INPUTS:
%   x = labels for bars
%   y = bar series values
%
% OUTPUT:
%   pqplot object
%
% 2016 Abraham Nunes
%==============================================================================

function g = pqbar(x, y)

    load viridis.mat

    s = bar(y);

    set(s                                 , ...
        'FaceColor', viridi(floor(256/4),:), ...
        'LineWidth', 1.5                  );

    set(gca                                                        , ...
        'FontSize'          , 14                                   , ...
        'Box'               , 'on'                                 , ...
        'YLim'              , [min([0, min(y(:))]), 1.1*max(y(:))] , ...
        'YGrid'             , 'on'                                 , ...
        'XGrid'             , 'on'                                 , ...
        'LineWidth'         , 1.5                                  , ...
        'XTickLabel'        , x                                    , ...
        'XTickLabelRotation', 45                                   );

    g.bars = s;
    g.axes = gca;
end
