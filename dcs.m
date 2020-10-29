clc
clear all
close all
%Data_Set
x=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30]
y=[70 78 83 81 91 86 79 96 97 99 98 98 92 87 85 84 81 88 87 89 86 84 83 81 82 80 79 78 79 76] % Data is scaled by 10^3
%Plotting the Data
figure(1)
plot(x,y); 					%plots the graph using the dataset
set(gca,'fontsize',10,'fontweight','bold'); %set the graph as bold with weight 10
title("Covid19 cases in the month of september ",'fontsize',10,'fontweight','bold')
xlabel(" Date ",'fontsize',10,'fontweight','bold')
ylabel("Cases were scaled to (10^3)",'fontsize',10,'fontweight','bold')
figure(2)
stem(x,y) 				%this function will sample the signal
set(gca,'fontsize',10,'fontweight','bold'); %set the graph as bold with weight 10
title("Covid19 cases in the month of September",'fontsize',10,'fontweight','bold')
xlabel("Date ",'fontsize',10,'fontweight','bold')
ylabel("Cases were scaled to (10^3)",'fontsize',10,'fontweight','bold')

n=4; %number of bits = 4
L=2^n; %number of levels = 2^4 = 16
vmax=99; %maximum value = 99
vmin=70;  %maximum value = 70
del=(vmax-vmin)/L; %finds the delta value = (99-70)/2 = 14.5 
partition=vmin:del:vmax; %70 to 99 with interval 14.5 
code=vmin-(del)/2:del:vmax+(del)/2; 
% Codebook length must be equal to the number of partition intervals
%70-8.75 to 9+8.75 with interval 14.5=> 61.25 to 90.25with interval 14.5
[index,q]=quantiz(y,partition,code); 
%quantization index and the corresponding quantized output value of the input data will      perform quantization
l1=length(index);
l2=length(q);
for i=1:l1
if(index(i)~=0)         % decimal from 0 to N to make index as binary
       index(i)=index(i)-1;
end
    i=i+1;
end
for i=1:l2
if(q(i)==vmin-(del/2))     % quantize value in between the levels
         q(i)=vmin+(del/2);
end
end

figure(3);
stem(q);          % Display the Quantize value 
set(gca,'fontsize',10,'fontweight','bold'); %set the graph as bold with weight 10
title("Quntized Signal",'fontsize',10,'fontweight','bold')
xlabel(" Date  ",'fontsize',10,'fontweight','bold')
ylabel(" Cases were scaled to (10^3)",'fontsize',10,'fontweight','bold')

