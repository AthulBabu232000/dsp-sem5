x = [1,2,-1,2,3,-2,-3,-1,1,1,2];
h = [1,2,3,-1];
len_h = length(h);//length of h
l = 2*len_h-1;//required length
x_pre=[];
y=[];
s=1;
//slicing the entire x array
 for i=1:len_h:length(x)
   if(length(x)-i<len_h)
       x_pre=[x(i:$),zeros(1,l-length(x(i:$)))];
       y(s,:)=x_pre;
    else
        x_pre=[x(i:len_h+i-1),zeros(1,l-length(x(i:len_h+i-1)))];
        y(s,:)=x_pre;
     end
     s=s+1;
end   
h = [h,zeros(1,len_h - 1)];//adjusting length of h
s=1
//changing y to z
z=[];
//obtain circular convolution
for k=1:length(y(:,1))
    z(s,:)=round(ifft(fft(y(k,:)).*fft(h)));
    s=s+1;
end

//end of circular convolution
//disp(z);//matrix result of circular convolution

//obtaining the result in semifinal
semi_final=[];
for i=1:length(z(:,1))
    if(i~=1)
        cat_with_semi=[z(i-1,$-len_h+2:$)+z(i,1:$-len_h),z(i,$-len_h+1)];
    semi_final=cat(2,semi_final,cat_with_semi);
end
end
//making the final result in final
final = cat(2,z(1,1:$-len_h+1),semi_final);
if(length(final)~=length(x)+length(h)+1)
    final=cat(2,z(1,1:$-len_h+1),semi_final,z($,$-len_h+2:$));
else
final = cat(2,z(1,1:$-len_h+1),semi_final);
end
disp(final);
                                                       
