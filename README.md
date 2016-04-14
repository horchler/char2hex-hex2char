char2hex - hex2char
========
#####Convert decimal integer string to hexadecimal representation and back in Matlab.#####
######Version 1.1, 4-13-16######
#####Download Repository: [ZIP Archive](https://github.com/horchler/char2hex/archive/master.zip)#####

--------

[```char2hex(S)```](https://github.com/horchler/char2hex/blob/master/char2hex.m) returns a 2-D string array where each row is the hexadecimal representation of each decimal integer string in the rows of ```S```. ```S``` must be a character array containing only decimal digits or leading spaces. Unlike Matlab's [```dec2hex```](http://www.mathworks.com/help/matlab/ref/dec2hex.html), this function can return exact representations for integers greater than ```2^52```.  
    
[```hex2char(H)```](https://github.com/horchler/char2hex/blob/master/hex2char.m) returns a 2-D string array where each row is the decimal representation of each hexadecimal integer string in the rows of ```H```. ```H``` must be a character array containing only hexadecimal digits. Unlike Matlab's [```hex2dec```](http://www.mathworks.com/help/matlab/ref/hex2dec.html), this function can return exact representations for integers greater then ```2^52```.  
  
If Matlab's Java JVM is not available, ```char2hex``` and ```hex2char``` fall back to ```dec2hex``` and ```hex2dec```, respectively. In that case, exact representations for integers greater than ```2^52``` may not be returned.
&nbsp;  

--------

Andrew D. Horchler, *adh9 @ case . edu*, [biorobots.case.edu](http://biorobots.case.edu/)  
Created: 1-23-12, Revision: 1.1, 4-13-16  

This version tested with Matlab 9.0.0.341360 (R2016a)  
Mac OS X 10.11.4 (Build: 15E65), Java 1.7.0_75-b13  
Compatibility maintained back through Matlab 8.5 (R2015a)  
&nbsp;  

--------

Copyright &copy; 2012&ndash;2016, Andrew D. Horchler  
All rights reserved.  

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of Case Western Reserve University nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ANDREW D. HORCHLER BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.