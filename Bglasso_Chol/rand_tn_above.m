function [r] = rand_tn_above(mu,sig,a)
% Sample from truncated normal N(mu,sig^2)1_{r<a}
z=(a - mu)/sig;
p = normcdf(z);


if(p<1e-16)

   r = a;
    
else
    u = rand(1)*p;
    u = min(max(1e-30,u),1-1e-16);
    r = norminv(u);
    r = r*sig+mu;
end