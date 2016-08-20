%==============================================================================
%PQTITLE Adds a title string to a pqplot after it has been created from another
% function
%
% INPUTS
%   g = pqplot object
%
% 2016 Abraham Nunes
%==============================================================================

function pqtitle(g, str)

set(get(g.axes, 'Title'), 'String', str);

end
