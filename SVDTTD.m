function [G] = SVDTTD(T)
    d=ndims(T)
    s=size(T)
    r=1
    for j=1:d-1
        T=reshape(T,s(j)*r,numel(T)/(r*s(j)))
        [U,S,V]=svd(T)
        ranc=rank(T)
        %for k=s(j)*a:-1:b+1
            U=U([1:s(j)*r],[1:ranc])
            %A(:,k)=[]
            S=S([1:ranc],[1:ranc])
            %B(:,k)=[]
            %B(k,:)=[]
            %C(:,k)=[]
            V=V([1:numel(T)/(r*s(j))],[1:ranc])
        %end
        G{j}=reshape(U,r,s(j),ranc)
        r=ranc
        T=S*V'
    end
    G{d}=T
end