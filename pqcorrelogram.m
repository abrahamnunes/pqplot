function g = pqcorrelogram(x, xlabels, varargin)

    load viridis.mat

    if nargin > 2
        if ~isempty(varargin{1})
            if strcmp(varargin{1}, 'corr')
                [corrs, cpvals] = corr(x);
                if min(min(corrs)) < 0
                    colormin = -1.;
                else
                    colormin = 0.;
                end

                im = imagesc(flipud(corrs), [colormin 1.]);
            elseif strcmp(varargin{1}, 'identity')
                im = imagesc(flipud(x), [0. 1.]);
            else
                error('Variable "stat" must either take values "corr" or "identity".');
            end
        else
            [corrs, cpvals] = corr(x);
            if min(min(corrs)) < 0
                colormin = -1.;
            else
                colormin = 0.;
            end

            im = imagesc(flipud(corrs), [colormin 1.]);
        end

        if ~isempty(varargin{2})
            ylabels = flip(varargin{2});
        else
            ylabels = flip(xlabels);
        end
    else
        [corrs, cpvals] = corr(x);
        if min(min(corrs)) < 0
            colormin = -1.;
        else
            colormin = 0.;
        end

        im = imagesc(flipud(corrs), [colormin 1.]);
    end

    colormap(viridi);
    cb = colorbar;
    set(cb               , ...
        'LineWidth', 1.5 , ...
        'FontSize' , 14  );

    set(gca                           , ...
        'FontSize'  , 14              , ...
        'Box'       , 'on'            , ...
        'XTickLabel', xlabels         , ...
        'YTickLabel', ylabels         , ...
        'TickLength', [0. 0.]         , ...
        'LineWidth' , 1.5             );

    g.corgram = im;
    g.axes    = gca;

end
