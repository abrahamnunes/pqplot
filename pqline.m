function g = pqline(x, y, varargin)

    load viridis.mat;

    if nargin > 3
        if ~isempty(varargin{1})
            linespec = varargin{1};
        else
            linespec = '-o';
        end
    else
        linespec = '-o';
    end

    mfcolor = viridi(1, :);
    s = plot(x, y, linespec   , ...
                 'Color'          , mfcolor, ...
                 'LineWidth'      , 1.5    , ...
                 'MarkerEdgeColor', 'k'    , ...
                 'MarkerFaceColor', mfcolor);

     set(gca                           , ...
         'FontSize'  , 14              , ...
         'Box'       , 'on'            , ...
         'YGrid'     , 'on'            , ...
         'XGrid'     , 'on'            , ...
         'LineWidth' , 1.2             );

    g.series = s;
    g.axes   = gca;
end
