%==============================================================================
%PQLEGEND Adds legend to publication quality plot
%
% INPUT:
%   g        = pqplot object
%   labels   = cell array of labels for series
%   location = string with legend location
%
% 2016 Abraham Nunes
%==============================================================================
function pqlegend(g, labels, location)

    leg = legend(g.axes, labels);
    set(leg, 'Location', location);

end
