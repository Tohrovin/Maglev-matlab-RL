function r = reward_function(state, madeit, hit)

zo = state(1);
vo = state(2);
io = state(3);

%przybliżone wartości z LQR + reward za oderwanie się z ziemi
%r =  -210*abs(zo) -(4.7*abs(vo)) -(0.9*abs(io)) - 10*hit + 100*madeit;
%r = -2.1*abs(zo) - 100*hit + 100*madeit;

% r1 = 0;
% r2 = 0;
% if ((abs(zo)<0.001)&&(action<0.01))
%     r1 = 60;
% elseif ((abs(zo)<0.005)&&(action<0.05))
%     r2 = 30;
% elseif ((abs(zo)<0.01)&&(action<0.2))
%     r2 = 3;
% elseif (action<0.1)
%     r2 = 1;
% elseif (abs(zo)<0.001)
%     r1 = 5;
% elseif (abs(zo)<0.005)
%     r1 = 1;
% end
% 
% r = -2100*abs(zo) -(40*abs(vo)) -(9*abs(io)) + 50*madeit + r1 + r2 - 0.1*action; 


if zo == 0
    zo = 0.0001;
end
if vo == 0   
    vo = 0.0001;
end

%target = 0.4717
% if zo>0
%     r1 = 2 - ((1 - abs(zo))/(0.472 + zo));
% else
%     r1 = 2 - ((1 - abs(zo))/(0.472 - zo));
% end

%r1 = 2 - ((1 - abs(zo))/(0.472 + abs(zo)));

if zo>0
    r1 = (1 - abs(zo))/(0.472 + zo);
else
    r1 = (1 - abs(zo))/(0.529 - zo);
end
r1 = 2 - r1;
r2 = 2 - (1-abs(vo));
r3 = 2 - (abs(zo/(abs(zo)) - vo/(abs(vo))) - 1);
%- 0.05*abs(io)
r = -(3.2*r1 + r2 + 0.3*r3 -5*madeit);

% if zo == 0
%     zo = 0.0001;
% end
% if vo == 0   
%     vo = 0.0001;
% end
% 
% %target = 0.4717
% if zo>0
%     r1 = (1 - abs(zo))/(0.472 + zo);
% else
%     r1 = (1 - abs(zo))/(0.529 - zo);
% end
% 
% r2 = (1-abs(vo));
% r3 = (abs(zo/(abs(zo)) - vo/(abs(vo))) - 1);
% r = (3.2*r1 + r2 + 0.3*r3 + 5*madeit) ;

if isnan(r)
    r = -9999;
end

