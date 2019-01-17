a = imread('clockwork-angels.jpg');
r = a(:,:,1);
%imshow(r)
ranIndex = rand(1000,1);
X = zeros(256,1000);
for i=1:1:1000
    centerX = round(ranIndex(i)* size(r,2));
    centerY = round(ranIndex(i)* size(r,1));
    startX = centerX - 8;
    startY = centerY - 8;
    if startX < 1
        startX = 1;
    end
    if startY < 1
        startY = 1;
    end
    if startX > (size(r,2) - 15)
        startX = (size(r,2) - 15);
    end
    if startY > (size(r,1) - 15)
        startY = (size(r,1) - 15);
    end
    patch = r((startY: startY + 15),startX:(startX+15));
    X(:,i) = patch(:);
end
corX = X*X';
[eigCorV, eigCorD] = eig(corX);
[eigValues,ind] = sort(diag(eigCorD),'descend');
%[descEigCorX, index] = sort(eigCorX, 'descend');
top64Index = ind(1:64);
output = zeros(16);
F = zeros(256,64);
for j = 1:1:64
   patch = reshape(eigCorV(:,top64Index(j)),[16,16]);
 %  F(:,j) = eigCorV(:,top64Index(j));
   %output = eig(patch)
   output(:,:,j) = mat2gray(reshape(patch,[16,16]));
end
montage(output)
% y = (F')*X;
% original = zeros(16);
% compressed = zeros(8);
% for j = 1:1:1000
%     original(:,:,j) = reshape(X(:,j),[16,16]);
%     compressed(:,:,j) = reshape(y(:,j),[8,8]);
% end
% montage(original)
%montage(compressed)
    


