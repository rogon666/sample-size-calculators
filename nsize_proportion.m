% ////////////////////////////////////////////////////////////////////////
% This function calculates the sample size of a proportion
% for conventional significance levels, given the margin
% of error, the expected proportion and the population size
% ------------------------------------------------------------------------
% (c) Rolando Gonzales Martinez
% November 2021
% ------------------------------------------------------------------------
% Input:
%   e:  margin of error, this is, the maximum likely (with
%       probability 1 -alpha) difference between the observed sample
%       proportion and the true value of the population p. 
%   p:  expected proportion (optinal, if not provided p = 0.5 is used)
%   N:  population size (optional argument for the finite population correction)
% Output:
%   n_01: sample size for alpha =  1%
%   n_05: sample size for alpha =  5%
%   n_10: sample size for alpha = 10%
% ////////////////////////////////////////////////////////////////////////
function  [n_01,n_05,n_10] = nsize_proportion(e,p,N)
% --------------------------------------------
z_01 = norminv(1 - (0.01/2)); % z for alpha = 0.01 (1%)
z_05 = norminv(1 - (0.05/2)); % z for alpha = 0.05 (5%)
z_10 = norminv(1 - (0.10/2)); % z for alpha = 0.10 (10%)
% ---------------------------------------------------------
if (~exist('N','var') && ~exist('p','var'))
    % Conservative sample size (proportion equal to 50%)
     n_01 = ceil( (e^-2)*(z_01^2)*.5*(1-.5) );
     n_05 = ceil( (e^-2)*(z_05^2)*.5*(1-.5) );
     n_10 = ceil( (e^-2)*(z_10^2)*.5*(1-.5) );
     disp('----------------------------------------------------')
     disp('*** Conservative sample size for p = 50% ***')
     disp(['Conservative sample size (n) = ',num2str(n_01),' for alpha 1%'])
     disp(['Conservative sample size (n) = ',num2str(n_05),' for alpha 5%'])
     disp(['Conservative sample size (n) = ',num2str(n_10),' for alpha 10%'])
     disp('----------------------------------------------------')
     disp('Note: no information of p and N was provided')
elseif (exist('N','var') && exist('p','var'))
     % Finite population correction
     n_01_fpc = ceil((e^-2)*(z_01^2)*p*(1-p));
     n_05_fpc = ceil((e^-2)*(z_05^2)*p*(1-p));
     n_10_fpc = ceil((e^-2)*(z_10^2)*p*(1-p));
     n_01 = ceil((n_01_fpc*N)/(n_01_fpc + (N - 1))); % Finite population correction
     n_05 = ceil((n_05_fpc*N)/(n_05_fpc + (N - 1))); % Finite population correction
     n_10 = ceil((n_10_fpc*N)/(n_10_fpc + (N - 1))); % Finite population correction    
     % Conservative sample size (proportion equal to 50%)
     nc_01 = ceil( (e^-2)*(z_01^2)*.5*(1-.5) );
     nc_05 = ceil( (e^-2)*(z_05^2)*.5*(1-.5) );
     nc_10 = ceil( (e^-2)*(z_10^2)*.5*(1-.5) );
     nc_fpc_01 = ceil((nc_01*N)/(nc_01 + (N - 1))); % Finite population correction
     nc_fpc_05 = ceil((nc_05*N)/(nc_05 + (N - 1))); % Finite population correction
     nc_fpc_10 = ceil((nc_10*N)/(nc_10 + (N - 1))); % Finite population correction     
     disp('------------------ Finite population ------------------')
     disp(['Sample size (n) = ',num2str(n_01),' for alpha 1%'])
     disp(['Sample size (n) = ',num2str(n_05),' for alpha 5%'])
     disp(['Sample size (n) = ',num2str(n_10),' for alpha 10%'])
     disp('----------------------------------------------------')
     disp('*** Conservative sample size for p = 50% ***')
     disp(['Conservative sample size (n) = ',num2str(nc_fpc_01),' for alpha 1%'])
     disp(['Conservative sample size (n) = ',num2str(nc_fpc_05),' for alpha 5%'])
     disp(['Conservative sample size (n) = ',num2str(nc_fpc_10),' for alpha 10%'])
     disp('----------------------------------------------------')     
     disp(['Proportion (p) = ',num2str(p),', population size (N) = ',num2str(N)])
else
    if p > 1
       N = p; % For those cases where there is N but no p is provided
    % Conservative sample size (proportion equal to 50%)
     nc_01 = ceil( (e^-2)*(z_01^2)*.5*(1-.5) );
     nc_05 = ceil( (e^-2)*(z_05^2)*.5*(1-.5) );
     nc_10 = ceil( (e^-2)*(z_10^2)*.5*(1-.5) );
     n_01 = ceil((nc_01*N)/(nc_01 + (N - 1))); % Finite population correction
     n_05 = ceil((nc_05*N)/(nc_05 + (N - 1))); % Finite population correction
     n_10 = ceil((nc_10*N)/(nc_10 + (N - 1))); % Finite population correction
     disp('----------------------------------------------------')
     disp('*** Conservative sample size for p = 50% ***')
     disp(['Conservative sample size (n) = ',num2str(n_01),' for alpha 1%'])
     disp(['Conservative sample size (n) = ',num2str(n_05),' for alpha 5%'])
     disp(['Conservative sample size (n) = ',num2str(n_10),' for alpha 10%'])
     disp('----------------------------------------------------')      
     disp(['Population size (N) = ',num2str(N)])
    elseif p < 1
    % No information of population size
     n_01 = ceil((e^-2)*(z_01^2)*p*(1-p));
     n_05 = ceil((e^-2)*(z_05^2)*p*(1-p));
     n_10 = ceil((e^-2)*(z_10^2)*p*(1-p));
    % Conservative sample size (proportion equal to 50%)
     nc_01 = ceil( (e^-2)*(z_01^2)*.5*(1-.5) );
     nc_05 = ceil( (e^-2)*(z_05^2)*.5*(1-.5) );
     nc_10 = ceil( (e^-2)*(z_10^2)*.5*(1-.5) );
    disp('----------------- Infinite population -----------------')
     disp(['Sample size (n) = ',num2str(n_01),' for alpha = 1%'])
     disp(['Sample size (n) = ',num2str(n_05),' for alpha = 5%'])
     disp(['Sample size (n) = ',num2str(n_10),' for alpha = 10%'])
    disp('----------------------------------------------------')
    disp('*** Conservative sample size for p = 50% ***')
    disp(['Conservative sample size (n) = ',num2str(nc_01),' for alpha 1%'])
    disp(['Conservative sample size (n) = ',num2str(nc_05),' for alpha 5%'])
    disp(['Conservative sample size (n) = ',num2str(nc_10),' for alpha 10%'])
    disp('----------------------------------------------------')
    disp(['Proportion (p) = ',num2str(p)])
    end
end