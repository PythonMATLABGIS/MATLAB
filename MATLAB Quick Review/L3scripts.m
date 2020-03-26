F=1;
F(2)=1;
for i = 1:5
    F(end+1)=F(end)+F(end-1);
end

F


% this is a test