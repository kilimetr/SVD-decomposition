function main

IMG = imread('monalisa.jpg');

A = im2double(IMG);
figure(1);
subplot(1,2,1);
imshow(A);



[n,m] = size(A);
V=zeros(m,m);
U=zeros(n,n);
Sigma = zeros(n,m);
SigmaI = zeros(m,n);

[h,lambda]=eig(A'*A); %vlastní èísla a vlastní vektory
lambda = diag(lambda);
[lambda,index] = sort(lambda,'descend');
sigma = lambda.^0.5;
W = sum(lambda);
kMax = sum(sigma>0); %kolik je nenul. singul. hodnot => kolik je sigma>0
for i = 1:kMax
    w(i) = sum(lambda(1:i)/W);
end
k = 80 %s tím se dá hrát (napø. kMax,100,...)

for i = 1:k
    V(:,i) = h(:,index(i))/norm(h(:,index(i)));
    Sigma(i,i) = sigma(i);
    SigmaI(i,i) = 1/sigma(i);
end

U=A*V*SigmaI;
Ar=U*Sigma*V';
figure(1);
subplot(1,2,2);
imshow(Ar);


ratio = k*(1+m+n)/(m*n)

    
  


end

