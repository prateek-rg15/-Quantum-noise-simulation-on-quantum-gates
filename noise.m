e=3*pi/180 %error rotation angle
p=0.01 %bit flip probability
d=100
x=zeros(d,1)
for i=1:d
    x(i)=i
    
end

ax1 = nexttile;
plot(ax1,x,ideal(d),'g-o','MarkerSize',2)
title(ax1,'ideal X gate')
xlabel('circuit depth(no.of X gate in series)')
ylabel('measurement value <Z>')

ax2 = nexttile;
plot(ax2,x,coh(d,e),'g-o','MarkerSize',2)
title(ax2,'coherent error in X gate')
xlabel('circuit depth(no.of X gate in series)')
ylabel('measurement value <Z>') % expectation value of measurement operator

ax3 = nexttile;
plot(ax3,x,incoh(d,p).*coh(d,e),'g-o','MarkerSize',2)
title(ax3,'coherent and incoherent error in X gate')
xlabel('circuit depth ')
ylabel('measurement value <Z>') % expectation value of measurement operator

function c=ideal(d)
 q=[1;0] %qubit set to 0
 I=[1 0;0 1] %identity gate
 a=[0;1] % 1 state
 X=[0 1; 1 0]
 Z=[1 0;0 -1]
 for i=1:d
  psi= (cos(i*pi/2)*q-sin(i*pi/2)*a)
  c(i)=psi.'*Z*psi
 end
end

function c=coh(d,e) %coherent error
 c=zeros(d,1)
 q=[1;0] %qubit set to 0
 I=[1 0;0 1] %identity gate
 a=[0;1] % 1 state
 X=[0 1; 1 0]
 Z=[1 0;0 -1]
 for i=1:d
  psi= (cos(i*e/2)*I-sin(i*e/2)*X)*(cos(i*pi/2)*q-sin(i*pi/2)*a) 
  c(i)=psi.'*Z*psi
 end
end

function in=incoh(d,p) %incoherent error caused by bit flip
 in=zeros(d,1)
 I=[1 0;0 1]
 Z=[1 0;0 -1]
 X=[0 1; 1 0]
 in=zeros(d,1)
 qu=[1;0]
 a=[0;1]
 dens=(1-p)*qu*qu.'+p*a*a.' %initial density matrix
 
 for q=1:d

     dens=p*(X*dens*X)+(1-p)*dens
     in(q)=trace(Z*dens)
 end
end
      
 

