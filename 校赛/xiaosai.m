clc
clear

%��ȡ����
data1=xlsread('����1.xlsx');
x1=data1(:,1);
y1=data1(:,2);
data2=xlsread('����2.xlsx');
x2=data2(:,1);
y2=data2(:,2);
x1max=max(x1);
y1max=max(y1);
x1min=min(x1);
y1min=min(y1);

%��������
x=[floor(10*x1min)/10:0.1:ceil(10*x1max)/10];
y=[floor(10*y1min)/10:0.1:ceil(10*y1max)/10];
[X,Y]=meshgrid(x,y);
X=X';     %��֪��Ϊɶ�Զ�ת����
Y=Y';
xlim=size(X,1);
ylim=size(X,2);
z=-ones(xlim,ylim);
for i=1:size(x1)
    z(round(10*(x1(i)-x1min))+1,round(10*(y1(i)-y1min))+1)=0;   %��ԭ���߸߶���0��������߶���Ϊ-1
end
for i=1:size(x2)
    z(round(10*(x2(i)-x1min))+1,round(10*(y2(i)-y1min))+1)=0;
end
for i=1:xlim
    for j=1:ylim
        in1=inpolygon(X(i,j),Y(i,j),x1,y1);    
        in2=inpolygon(X(i,j),Y(i,j),x2,y2);
        if in1==0||in2==1             %����������1֮���������2֮�ڣ�������
            continue
        end
        d1=sqrt((X(i,j)-x1).^2+(Y(i,j)-y1).^2);
        d2=sqrt((X(i,j)-x2).^2+(Y(i,j)-y2).^2);
        z(i,j)=min(min(d1),min(d2));         %���㵽�������ߵ���С���룬������������óɸ�
    end
end
zlim=max(max(z));
contour(X,Y,z,[0:0.1:floor(10*zlim)/10])        %���Ƶȸ���