clc;
close all;
clear all;
%figure(1);
j=0;
m=0;
span=10;
x1=[];
x2=[];
  while(1)
      if (j>span-1)
          j=1;
          m=1;
      else j=j+1;
      end
          
[s,r]=system('ledcomm status');

for i=1:5
    if r(i)==32
        break
    end
end
if r(1)<=57
s1=str2double(r(1:i-1));
s2=str2double(r(i+1:end));

end
b1=dec2bin(s1)-48;
b2=dec2bin(s2)-48;
p1=length(b1);
p2=length(b2);
a1=[zeros(1,8-p1) b1];
a2=[zeros(1,8-p2) b2];
dt=1/5;
if m==0
t=[1:5*j]/25;
t=fliplr(t);
x1=[x1 a1'*ones(1,5)];
x2=[x2 a2'*ones(1,5)];
else t=[1:span*5]/25;
    t=fliplr(t);
    
        x1(:,1:(span-1)*5)=x1(:,6:span*5);
    
    x1(:,(span-1)*5+1:span*5)=a1'*ones(1,5);
     x2(:,1:(span-1)*5)=x2(:,6:span*5);
    
    x2(:,(span-1)*5+1:span*5)=a2'*ones(1,5);
end
  

figure(1);
subplot(8,2,1);
plot(t,x1(8,:),t,x1(7,:),'r')

axis([0 (span/5) 0 2])
xlabel('time'),title('channel 1'),ylabel('logic')
subplot(8,2,2);
plot(t,x1(7,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 2'),ylabel('logic')
subplot(8,2,3);
plot(t,x1(6,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 3'),ylabel('logic')
subplot(8,2,4);
plot(t,x1(5,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 4'),ylabel('logic')
subplot(8,2,5);
plot(t,x1(4,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 5'),ylabel('logic')
subplot(8,2,6);
plot(t,x1(3,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 6'),ylabel('logic')
subplot(8,2,7);
plot(t,x1(2,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 7'),ylabel('logic')
subplot(8,2,8);
plot(t,x1(1,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 8'),ylabel('logic')

subplot(8,2,15);
plot(t,x2(7,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 15'),ylabel('logic')
subplot(8,2,14);
plot(t,x2(6,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 14'),ylabel('logic')
subplot(8,2,13);
plot(t,x2(5,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 13'),ylabel('logic')
subplot(8,2,12);
plot(t,x2(4,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 12'),ylabel('logic')
subplot(8,2,11);
plot(t,x2(3,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 11'),ylabel('logic')
subplot(8,2,10);
plot(t,x2(2,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 10'),ylabel('logic')
subplot(8,2,9);
plot(t,x2(1,:));
axis([0 (span/5) 0 2])
xlabel('time'),title('channel 9'),ylabel('logic')
 if a2(8)==1
     subplot(8,2,16);
 plot(t,x2(8,:),'r')
 title('stop')
     break
 end
 end




