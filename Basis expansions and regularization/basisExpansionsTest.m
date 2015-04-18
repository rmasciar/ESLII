clear, close all, clc

x=1:18;
y=[1:3 5 4 7:-1:3 2*(2:5) repmat(10,1, 4)]';
plot(x,y,'o');

# general form
M=4;
K=10;


x=linspace(min(x),max(x),100);

h=zeros(m,M+K);
for j=1:M
  h(:,j)=x.^(j-1);
end
for l=1:K
  h(:,M+l)=(x>knot(l)).*(x-knot(l)).^(M-1);
end

#basis=BasisExpansions(x,df,'b-splines');
#plot(x,basis)

#basis=BasisExpansions(x,df,'natural-cubic');
#plot(x,basis)


#x=1:numel(y);
#a =spline(x,y)
#[a b]=interp1(x,y)



#basis=BasisExpansions(x,df,'smoothing','y',"[1:3 5 4 7:-1:3 2*(2:5) repmat(10,1, 4)]'",'lambda','0');
#basis
#figure
#plot(1:numel(y),y,'o')
#hold on
#plot(basis)

#basis=BasisExpansions(x,df,'smoothing','y',"[1:3 5 4 7:-1:3 2*(2:5) repmat(10,1, 4)]'",'lambda','100');
#figure
#plot(1:numel(y),y,'o')
#hold on
#plot(basis)
