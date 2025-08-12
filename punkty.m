function [punt_row,Jacobs, B] = punkty(z)
%UNTITLED4 Summary of this function goes here
%   na razie dla pojedyńczego z

% syms z positive
% syms z real
% assumeAlso(z >= 0)
syms x2 x3
g = 9.81;
R = 4.4;
m = 0.057;%kg masa kulki

a = 0.03005;
b = -242.5;
c = -1.422;
d = 0.1096;

Lz = @(z) a*exp(b*z) + d*exp(c*z);
%dLdz = diff(Lz,z,1)
%d2Ld2z = diff(Lz,z,2)
OneLz = @(z) 1/(a*exp(b*z) + d*exp(c*z));
%dOneLz = diff(OneLz, z, 1);
dOneLz =  @(z) ((58297*exp(-(485*z)/2))/8000 + (97407*exp(-(711*z)/500))/625000)/((601*exp(-(485*z)/2))/20000 + (137*exp(-(711*z)/500))/1250)^2;
 
x3 = @(z) (50000^(1/2)*55917^(1/2))/(50000*((58297*exp(-(485*z)/2))/8000 + (97407*exp(-(711*z)/500))/625000)^(1/2));
dLdz = @(z) - (58297*exp(-(485*z)/2))/8000 - (97407*exp(-(711*z)/500))/625000;
d2Ld2z = @(z) (5654809*exp(-(485*z)/2))/3200 + (69256377*exp(-(711*z)/500))/312500000;


x2 = 0;
J1 = [0, 1, 0];
J2 = [x3(z)^2/(2*m)*d2Ld2z(z), 0, dLdz(z)*x3(z)/m];
J3 = [-dOneLz(z)*R*x3(z) - x3(z)*x2*(dOneLz(z)*dLdz(z) + d2Ld2z(z)/Lz(z)) + x3(z)*R*dOneLz(z) , -x3(z)/Lz(z)*dLdz(z), (-R + x2*dLdz(z))/Lz(z)];

Jacobs = [J1; J2; J3];
punt_row = [z, 0, x3(z)];
B = [0;0;R* punt_row(3)/Lz(z)];

end