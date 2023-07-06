
clear all

test = randi([0,1],5); % skapar begynnelse för spins.


% beräkna pi
hits = 0;
trials = 100;
x = 0;
y = x;
counter = 0;
xsave = 0;
ysave = 0;

while counter < trials
    dx = -1 + (2)*rand(1);
    dy = -1 + (2)*rand(1);
    
    if (abs(x + dx) < 1) && (abs(y + dy) < 1)

        x = x + dx;
        y = y + dy;


    end

%     x = rand(1);
%     y = rand(1);
    
    if (x^2 + y^2) < 1

        hits = hits + 1;

    end

    counter = counter + 1;
    xsave(counter) = x;
    ysave(counter) = y;


end

pies = 4*hits/trials
t = (2*pi)*linspace(0,1);
xunit = cos(t);
yunit = sin(t);

plot(xsave,ysave,'o');
hold on
plot(xunit,yunit);