function pqlegend(axisobj, labels, location)
%PQLEGEND Adds legend to publication quality plot
%
% INPUT:
%   axisobj  = axis object to which legend is added
%   labels   = cell array of labels for series
%   location = string with legend location
%
% 2016 Abraham Nunes

    leg = legend(axisobj, labels);
    set(leg, 'Location', location);

end
