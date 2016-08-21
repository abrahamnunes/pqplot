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
    set(s, 'LineWidth', 1.5);

    if size(y, 1) > 1 && size(y, 2) > 1
        barcolors = viridi(floor(linspace(1, 256, size(y, 2))),:);
        for i = 1:size(y, 2)
            set(s(i), 'FaceColor', barcolors(i, :));
        end
    else
        set(s, 'FaceColor', viridi(floor(256/4),:));
    end

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
