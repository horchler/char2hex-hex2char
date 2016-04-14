function h = char2hex(s,n)
%CHAR2HEX  Convert decimal integer string to hexadecimal representation.
%   CHAR2HEX(S) returns a 2-D string array where each row is the hexadecimal
%   representation of each decimal integer string in the rows of S. S must be a
%   character array containing only decimal digits or leading spaces. Unlike
%   Matlab's DEC2HEX, this function can return exact representations for
%   integers greater than 2^52. However, if Matlab's Java JVM is not available,
%   CHAR2HEX falls back to DEC2HEX and then if S represents any integers greater
%   than 2^52, exact representations of those integers may not be returned.
%   
%   CHAR2HEX(S,N) produces a 2-D string array where each row contains an N digit
%   hexadecimal number. If N is smaller than the number of digits in the largest
%   hexadecimal value, this option will have no effect.
%   
%   Example:
%       s = char(vpa('pi',1000));
%       h = char2hex(s(3:end))
%   
%   See also: HEX2CHAR, DEC2HEX, NUM2HEX, HEX2DEC, HEX2NUM.

%   Andrew D. Horchler, adh9 @ case . edu, Created 1-23-12
%   Revision: 1.1, 4-13-16


if isempty(s)
    h = '';
    return;
else
    if ~ischar(s) || ~ismatrix(s)
        error('char2hex:InvalidString','Input must be a character array.');
    end
    
    [m,len] = size(s);
    if m > 1
        s = cellstr(s);
    end
    s = strtrim(s); % Trims trailing spaces too
    
    if ~all(isstrprop([s{:}],'digit') | isspace([s{:}]))
        error('char2hex:InvalidStringValue',...
              'Input must contain only numeric digits or leading spaces.');
    end
end

if nargin > 1
    if ~isscalar(n) || ~isnumeric(n) || ~isfinite(n) || ~isreal(n)
        error('char2hex:InvalidLength','N must be a finite real integer.');
    end
    if n < 0 || n ~= floor(n)
        error('char2hex:InvalidInteger','N must be a non-negative integer.');
    end
else
    n = 1;
end

% Convert
if len > 15 && isempty(javachk('jvm'))
    for i = m:-1:1
    	c{i} = char(java.math.BigInteger(s(i,:)).toString(16));
    end
    n = max([cellfun('length',c) n]);
    h = reshape(upper(sprintf(['%0' int2str(n) 's'],c{:})),n,m).';
else
    h = dec2hex(str2double(s),n);
end