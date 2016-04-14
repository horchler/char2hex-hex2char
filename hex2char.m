function s = hex2char(h)
%HEX2CHAR  Convert hexadecimal integer to decimal string representation.
%   HEX2CHAR(H) returns a 2-D string array where each row is the decimal
%   representation of each hexadecimal integer string in the rows of H. H must
%   be a character array containing only hexadecimal digits. Unlike Matlab's
%   HEX2DEC, this function can return exact representations for integers greater
%   then 2^52. However, if Matlab's Java JVM is not available, HEX2CHAR falls
%   back to HEX2DEC and then if H represents any integers greater than 2^52,
%   exact representations of those integers may not be returned.
%   
%   Example:
%       p = '0123456789ABCDEF';
%       h = p(randi(16,1,1e3));
%       s = hex2char(h)
%   
%   See also: CHAR2HEX, HEX2DEC, HEX2NUM, DEC2HEX, NUM2HEX.

%   Andrew D. Horchler, adh9 @ case . edu, Created 4-13-16
%   Revision: 1.1, 4-13-16


if isempty(h)
    s = '';
    return;
else
    if ~ischar(h) || ~ismatrix(h)
        error('hex2char:InvalidString','Input must be a character array.');
    end
    if ~all(isstrprop(h(:),'xdigit'))
        error('hex2char:InvalidStringValue',...
              'Input must contain only hexadecimal digits.');
    end
end

% Convert
[m,len] = size(h);
if len > 13 && isempty(javachk('jvm'))
    for i = m:-1:1
    	c{i} = char(java.math.BigInteger(h(i,:),16).toString());
    end
    n = max(cellfun('length',c));
    s = reshape(sprintf(['% ' int2str(n) 's'],c{:}),n,m).';
else
    s = int2str(hex2dec(h));
end