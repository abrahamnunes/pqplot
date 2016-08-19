%==============================================================================
%PQTITLE Adds a title string to a pqplot after it has been created from another
% function
%
% 2016 Abraham Nunes
%==============================================================================

function pqtitle(axisobj, str)

set(get(axisobj, 'Title'), 'String', str);

end
