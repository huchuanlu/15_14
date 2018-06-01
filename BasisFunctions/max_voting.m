function results = max_voting(index)
[n,xout]=hist(index,sort(index));
results = xout(find(n==max(n)));
results = results(1);