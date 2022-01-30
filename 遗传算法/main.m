size=50;        %��Ⱥ��С
maxgen=5000;      %������
pcro=0.6;       %������
pvar=0.01;      %������
n=2;            %Ⱦɫ�����
range=[-5,5];   %Ⱦɫ��ȡֵ��Χ
individual=struct('fitness',zeros(size,1),'chrom',zeros(size,n));
individual.chrom=(range(2)-range(1)).*rand(size,n)+range(1);
individual.fitness=1./f((individual.chrom(:,1)).^2,(individual.chrom(:,2)).^2);    %����Ӧ�Ⱥ����ı䣨ע��ʵ�ʱ�����۷�ĸΪ0��
[bestf bestnum]=max(individual.fitness);
bestchrom=individual.chrom(bestnum,:);
for i=1:maxgen
    individual=Select(individual,size);
    individual.chrom=Cross(pcro,individual,size,n);
    individual.chrom=Variation(pvar,individual,size,range,n);
    individual.fitness=1./((individual.chrom(:,1)).^2+(individual.chrom(:,2)).^2);
    [newbestf newbestnum]=max(individual.fitness);
    if newbestf>bestf
        bestf=newbestf;
        bestchrom=individual.chrom(newbestnum,:);
    end
end
1/bestf
