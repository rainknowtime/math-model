function y=Cross(p,individual,size,n)
for i=1:size
    p0=rand();
    if p0>p
        continue;
    else
        b=rand();       %����λ��b
        %%%%%%%�˴��ɶ���һ����������ѡ������Ⱦɫ��%%%%%%%
        %[a1,a2]=randi([1,n],[1,2]);
        a1=1;    a2=2;
        individual.chrom(i,a1)=individual.chrom(i,a1)*(1-b)+individual.chrom(i,a2)*b;
        individual.chrom(i,a2)=individual.chrom(i,a2)*(1-b)+individual.chrom(i,a1)*b;
    end
end
y=individual.chrom;