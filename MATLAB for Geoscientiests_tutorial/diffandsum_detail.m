function [e,f] = diffandsum_detail(c,d)
%diffandsum_detail - Find difference and total sum
%
% Syntax: difference and sum
%
% Inputs:
% c is a random number
% d is a random number
%
% Outputs:
% e is the difference
% f is the total sum
%
% Other m-files required: none
%
% Subfunctions: none
%
% MAT-files required: none
%
% Author: GIS MATLAB & GIS
% Youtube channel address: https://www.youtube.com/channel/UCiFX77MqmMJm1gFvycyI3-Q/featured?view_as=subscriber
% Last revision: 2020/02/29
%------------- BEGIN CODE --------------
    e = abs(c-d) ; %find the difference
    f = c+d ; %find the sum
end
%------------- END CODE --------------