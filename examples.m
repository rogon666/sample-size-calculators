% Example file
clear; clc
%% Sample size
e = 0.15; % margin of error
p = 0.80; % expected proportion (80%)
nsize_proportion(e,p);
%% Sample size with known population size
N = 500;
for p = 1:1:99
    [n01(p), n05(p), n10(p)] = nsize_proportion(e,p/100);
    [n01_N(p), n05_N(p), n10_N(p)] = nsize_proportion(e,p/100,N);
end
    % Figure
    plot(n01,'b--'); hold on
    plot(n01_N,'b'); 
    plot(n05,'k--'); 
    plot(n05_N,'k'); 
    plot(n10,'r--'); 
    plot(n10_N,'r'); hold off
    hleg = legend('1%','1% (fpc)','5%','5% (fpc)','10%','10% (fpc)','Location','northeastoutside');
    htitle = get(hleg,'Title');
    set(htitle,'String','significance (\alpha)')
    legend box off
    ylabel('sample size (n)')
    xlabel('expected proportion (%)')
    grid on
    title('(fpc: finite population correction)')
    suptitle('Sample size for different proportions and significance levels')
%% Sample size for a clusterized RCT
rho = 0.01; % intra-class correlation
p1 = 0.5;   % expected proportion 1
p2 = 0.7;   % expected proportion 2
k = 3;      % number of clusters
m = 41;     % cluster size in each cluster
d = 0.2;    % expected difference
nsize_prop_cluster(rho,p1,p2,m,k,d);
