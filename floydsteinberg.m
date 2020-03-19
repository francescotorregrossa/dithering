function dit = floydsteinberg(img, n)
[h, w] = size(img);
dit = zeros(h, w);

s = 256/n;
ranges = 0:s:256;

t = 255/(n-1);
values = 0:t:255;

for j = 1:h
    for i = 1:w
        
        for k = 1:n
            if img(j,i)>=ranges(k) && img(j,i)<ranges(k+1)
                dit(j,i)=values(k);
            end
        end
        
        err = img(j,i) - dit(j,i);
        if i<w
            img(j,i+1) = img(j,i+1) + 7/16 *err;
        end
        if j<h && i>1
            img(j+1,i-1) = img(j+1,i-1) + 3/16 *err;
            img(j+1,i) = img(j+1,i) + 5/16 *err;
        end
        if i<w && j<h
            img(j+1,i+1) = img(j+1,i+1) + 1/16 *err;
        end
    end
end