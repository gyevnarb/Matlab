function f(n) 
for i=n+1:999 
if(sum(dec2base(i,2)-48)==sum(dec2base(n,2)-48))
display(i);break;
end
end
end
