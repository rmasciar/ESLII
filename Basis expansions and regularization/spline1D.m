function [h knot]=spline1D(x,type,varargin)

  for i=2:2:numel(varargin) 
   eval(strcat(varargin{(i-1)}, '=', varargin{i},';'));
  end

  x=x(:);
  m=length(x);

  if ~exist('M', 'var') || isempty(M)
    M=4;
  end

  if ~exist('K', 'var') || isempty(K)
    knot=unique(x)(2:(end-1));
    K=length(knot);
  else
    knot=linspace(min(x),max(x),K+2)(2:(end-1))';
    K=length(knot);
  end

  switch type
    case 'general'
      h=zeros(m,M+K);
      for j=1:M
        h(:,j)=x.^(j-1);
      end
      for l=1:K
        h(:,M+l)=(x>=knot(l)).*(x-knot(l)).^(M-1);
      end

    case 'natural cubic'
     h=zeros(m,K);
     h(:,1)=1;
     h(:,2)=x;
     k=K-1;
     dK_1=(((x>=knot(k)).*(x-knot(k))).^3-((x>=knot(K)).*(x-knot(K))).^3)./(knot(K)-knot(k));
     for k=1:(K-2)
       dk=(((x>=knot(k)).*(x-knot(k))).^3-((x>=knot(K)).*(x-knot(K))).^3)./(knot(K)-knot(k));
       h(:,k+2)=dk-dK_1;
     end

    case 'b spline'
knot
      tau=[repmat(min(x),M,1);knot;repmat(max(x),M,1)]
#tau=[linspace(min(x)-0.0001,min(x),M)';knot;linspace(max(x),max(x)+0.0001,M)'];
      for m_=1:M
        b=zeros(m,K+2*M-m_);

        for i=1:(K+2*M-m_)
          if m_==1
if tau(i)==tau(i+1)
b(:,i)=0;
else
            b(:,i)=(x>=tau(i))&(x<tau(i+1));
end
          else
if tau(i)==tau(i+m_-1)==tau(i+m_)==tau(i+1)
b(:,i)=0;
else
            b(:,i)=b_prev(:,i).*(x-tau(i))/(tau(i+m_-1)-tau(i))+...
              b_prev(:,i+1).*(tau(i+m_)-x)/(tau(i+m_)-tau(i+1));
end    
      end
        end
        b_prev=b;
      end
      h=b;
 
  endswitch

  if exist('y', 'var') && ~isempty(y)

    f=h*pinv(h'*h)*h'*y;
    plot(x,y,'*')
    hold on
    plot(x,f,'-')
    hold off
  end

end
