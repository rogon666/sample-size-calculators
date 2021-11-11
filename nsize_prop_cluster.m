% ////////////////////////////////////////////////////////////////////////
% This function calculates the sample size for cluster randomised
% controlled trials with a fixed number of clusters, given the intra-class 
% correlation, the expected proportions p1 and p2, the number of clusters,
% and the expected difference effect
% ------------------------------------------------------------------------
% (c) Rolando Gonzales Martinez
% November 2021
% ------------------------------------------------------------------------
% Input:
%   rho: intra-class correlation (ICC)
%   p1: proportion 1
%   p2: proportion 2
%   m: average cluster size
%   k: fixed number of clusters
%   d: pre-specified expected difference
% Output:
%   n_za10_zb70: sample size for alpha = 10% and power = 70%
%   n_za05_zb80: sample size for alpha =  5% and power = 80%
%   n_za01_zb90: sample size for alpha =  1% and power = 90%
% See: Hemming, K., Girling, A. J., Sitch, A. J., Marsh, J., 
% & Lilford, R. J. (2011). Sample size calculations for cluster randomised 
% controlled trials with a fixed number of clusters. BMC medical research 
% methodology, 11(1), 1-11.
% ////////////////////////////////////////////////////////////////////////
function [n_za10_zb70,n_za05_zb80,n_za01_zb90] = nsize_prop_cluster(rho,p1,p2,m,k,d)
%----------------------------------------------------------
z_a01 = norminv(1 - (0.01/2)); % z for alpha = 0.01 (1%)
z_a05 = norminv(1 - (0.05/2)); % z for alpha = 0.05 (5%)
z_a10 = norminv(1 - (0.10/2)); % z for alpha = 0.10 (10%)
% ---------------------------------------------------------
z_b70 = norminv(0.7);
z_b80 = norminv(0.8);
z_b90 = norminv(0.9);
% ---------------------------------------------------------
sigma2 = (1/2)* ( p1*(1-p1) + p2*(1-p2) );
% ---------------------------------------------------------
den = d^2;
% ---------------------------------------------------------
num_za10_zb70 =  2*sigma2*( ((z_a10 + z_b70)^2)*(1 + (m-1)*rho) );
num_za05_zb80 =  2*sigma2*( ((z_a05 + z_b80)^2)*(1 + (m-1)*rho) );
num_za01_zb90 =  2*sigma2*( ((z_a01 + z_b90)^2)*(1 + (m-1)*rho) );
% ---------------------------------------------------------
n_za10_zb70 = ceil(num_za10_zb70/den);
n_za05_zb80 = ceil(num_za05_zb80/den);
n_za01_zb90 = ceil(num_za01_zb90/den);
% ---------------------------------------------------------
n_c_za10_zb70 = ceil(n_za10_zb70/k);
n_c_za05_zb80 = ceil(n_za05_zb80/k);
n_c_za01_zb90 = ceil(n_za01_zb90/k);
% ---------------------------------------------------------
disp('/////////////////////////////////////////////////////////////////')
disp('*** Sample size for a fixed number of clusters ***')
disp('---------------------------------------------------')
disp('Power (beta) = 70%, significance (alpha) = 10% :')
disp(['  Total sample size (n) = ',num2str(n_za10_zb70)])
disp(['  Sample size in each cluster (n/k) = ',num2str(n_c_za10_zb70)])
disp('---------------------------------------------------')
disp('Power (beta) = 80%, significance (alpha) = 5% :')
disp(['  Total sample size (n) = ',num2str(n_za05_zb80)])
disp(['  Sample size in each cluster (n/k) = ',num2str(n_c_za05_zb80)])
disp('---------------------------------------------------')
disp('Power (beta) = 90%, significance (alpha) = 1% :')
disp(['  Total sample size (n) = ',num2str(n_za01_zb90)])
disp(['  Sample size in each cluster (n/k) = ',num2str(n_c_za01_zb90)])
disp('/////////////////////////////////////////////////////////////////')