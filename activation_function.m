function y = activation_function(x, c, d)
[output,input,ext] = size(c);
s = zeros(output,ext);
for i = 1:ext
    for j = 1:output
        z = 0;
        for k = 1:input
            z = z + x(k,1)*c(j,k,i);
        end
        s(j,i) = 1/(1+exp(-z));
    end
end

y = s + d;
