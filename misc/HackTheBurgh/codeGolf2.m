function g(n)
s=n+1;
while sum(dec2base(s,2)-48)~=sum(dec2base(n,2)-48)&&s<1000
s=s+1;
end
display(s);
end