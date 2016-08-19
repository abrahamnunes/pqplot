%==============================================================================
%PQSCATTER Formats scatterplot for publication quality
%
% INPUTS:
%   stat = {K x 1} cell array of statistics to add to scatter plot
%
% 2016 Abraham Nunes
%==============================================================================

function s = pqscatter(x, y, stat)

load viridis.mat
colorvec = viridi(floor(linspace(1, 256, size(y, 2))),:);

switch nargin
    case 3
        adjustlimits = true;

        xMin = min(x(:))-0.1*(abs(min(x(:))));
        xMax = 1.1*max(x(:));
        yMin = min(y(:))-0.1*(abs(min(y(:))));
        yMax = 1.1*max(y(:));

        if ~isempty(find(strcmp(stat, 'lm')))
            lmline    = true;
        else
            lmline = false;
        end

        if ~isempty(find(strcmp(stat, 'match')))
            cornerline = true;
        else
            cornerline = false;
        end

    case 2
        stat         = 'none';
        adjustlimits = false;
        cornerline   = false;
        lmline       = false;
end

hold on;

if cornerline == true
    cX = xMin:0.001:xMax;
    p = plot(cX, cX);
    set(p                         , ...
        'LineWidth', 1.5          , ...
        'Color'    , [0. 0. 0.]   );
end

if lmline == true
    for i = 1:size(y, 2)
        lfit      = fitlm(x, y(:,i), 'linear');
        lmslope   = lfit.Coefficients{2, 1};
        lmint     = lfit.Coefficients{1, 1};

        R2        = lfit.Rsquared.Adjusted;
        modeltest = anova(lfit);
        lfitpval  = modeltest.pValue(1);

        p = plot(x, lmslope*x + lmint);
        set(p                         , ...
            'LineWidth', 1.5          , ...
            'Color'    , colorvec(i,:));
    end
end

for i = 1:size(y, 2)
    s                 = scatter(x, y(:,i));
    s.MarkerFaceColor = colorvec(i,:);
    s.MarkerEdgeColor = [0. 0. 0.];
    s.MarkerFaceAlpha = 0.6;
    s.SizeData        = 60;
    s.LineWidth       = 1;
end
hold off;

set(gca                               , ...
        'FontSize'  , 14              , ...
        'Box'       , 'on'            , ...
        'YGrid'     , 'on'            , ...
        'XGrid'     , 'on'            , ...
        'LineWidth' , 1.5             );

if adjustlimits == true
    if cornerline == true
        set(gca                 , ...
            'XLim', [xMin xMax] , ...
            'YLim', [xMin xMax] );
    else
        set(gca                 , ...
            'XLim', [xMin xMax] , ...
            'YLim', [yMin yMax] );
    end
end

s = gca;

end
