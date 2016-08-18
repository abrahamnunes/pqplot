function pqtitle(axisobj, str)
%PQTITLE Adds a title string to a pqplot after it has been created from another
% function
%
% 2016 Abraham Nunes

set(get(axisobj, 'Title'), 'String', str);

end
