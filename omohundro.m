function dit = omohundro(img, n)
[h, w] = size(img);
dit = zeros(h, w);
s = 256/n;
for j = 1:h
    for i = 1:w
        
        for k = 0:s:256
            if img(j,i)>=k && img(j,i)<k+s
                dit(j,i)=(2*k+s)/2;
            end
        end
        
        err = img(j,i) - dit(j,i);
        if i<w
            img(j,i+1) = img(j,i+1) + 3/8 *err;
        end
        if j<h && i>1
            img(j+1,i-1) = img(j+1,i-1) + 1/8 *err;
            img(j+1,i) = img(j+1,i) + 3/8 *err;
        end
        if i<w && j<h
            img(j+1,i+1) = img(j+1,i+1) + 1/8 *err;
        end
    end
end