x_note = zeros(64,6);
y_note = zeros(64,6);
x = zeros(64,6);
y = zeros(64,6);
str = zeros(64,6);
count = 0;
row = 0;
for k = 0:1:6
    count = row+count; 
    row = nchoosek(6,k); 
    %temp = zeros(row,k);
    temp = combntns([1 2 3 4 5 6],k);
    for i = 1:1:row
        for j = 1:1:k
            x_note(i+count,temp(i,j)) = 1;
        end
    end
end

for i = 1:1:64
    for j = 1:1:6
        if x_note(i,j) ==0
            y_note(i,j) = 1;
        end
    end
end

for i = 1:1:64
    for j = 1:1:6
        sum_y = 0;
        sum_x = 0;
        if(x_note(i,j) ==1)
            str(i,j) = 'E';
        else
            str(i,j) = 'N';
        end
            
        for m = 1:1:j
           sum_y = y_note(i,m)+sum_y;
           sum_x = x_note(i,m)+sum_x;
        end
        y(i,j) = sum_y;
        x(i,j) = sum_x;
    end
end
N = zeros(64,1);
x1 = [N,x];
y1 = [N,y];
x0 = 0:0.01:6;
y0 = x0;
for i = 1:1:64
    plot(x1(i,:),y1(i,:),'-ro',x0,y0);grid on
    set(gca,'xtick',[0:1:6],'ytick',[0:1:6])
    axis([0 6 0 6])
    saveas(gcf,['/Users/jiangyuci/Documents/MATLAB/pic/',str(i,:),'.jpg']);
end
