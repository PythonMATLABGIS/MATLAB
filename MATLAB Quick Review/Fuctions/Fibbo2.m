function v=Fibbo2(n)

F = [1 1];
helper(n)
v=F(n);

function helper(n)
if numel(F)<n
    helper(n-1)
    F(n)=F(n-1)+F(n-2);
end

if n < 3
    v=1;
else
    v=Fibbo2(n-1)+Fibbo2(n-2);
end

