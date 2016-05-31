%x= readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\tube.csv');
y= readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\bill_of_materials.csv');
x= readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\train_set.csv');
tube = readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\tube.csv');
specs = readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\specs.csv');
comp = readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\components.csv');
comp_adap = readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\comp_adaptor.csv');
comp_b = readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\comp_boss.csv');
comp_el = readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\comp_elbow.csv');
typ_comp = readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\type_component.csv');
filter = readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\filtered.csv');
join2 = join(x,y);
join3 = join(join2,tube);
join4 = join(join3,specs);
join1 = join(join4,comp);
%join1 = join(comp_adap,join4);
%join5 = join(comp_b,comp);
%join6 = join(comp_el,comp);

testdata = readtable('C:\Users\praveen\Desktop\3rd sem\Data Mining\competition_data\test_set1.csv');
testdata2 = join(testdata,y);
testdata3 = join(testdata2,tube);
testdata4 = join(testdata3,specs);
testdata1 = join(testdata4,comp);

% tube data
tubeid = cell2mat(table2cell(join1(:,1)));
sup = cell2mat(table2cell(join1(:,2)));
quote = datenum(cell2mat(table2cell(join1(:,3))));
anual = cell2mat(table2cell(join1(:,4)));
min = cell2mat(table2cell(join1(:,5)));
bracket = cell2mat(table2cell(join1(:,6)));
quan =cell2mat(table2cell(join1(:,7)));
cost = cell2mat(table2cell(join1(:,8)));
cost = log(cost+1);
cd = cell2mat(table2cell(join1(:,9)));
q1 = cell2mat(table2cell(join1(:,10)));
ck = cell2mat(table2cell(join1(:,11)));
q2 = cell2mat(table2cell(join1(:,12)));
cm = cell2mat(table2cell(join1(:,13)));
q3 = cell2mat(table2cell(join1(:,14)));
%cl = cell2mat(table2cell(join1(:,15)));
%q4 = cell2mat(table2cell(join1(:,16)));
mid = cell2mat(table2cell(join1(:,25)));
dia = cell2mat(table2cell(join1(:,26)));
wall =cell2mat(table2cell(join1(:,27)));
length =cell2mat(table2cell(join1(:,28)));
numbend = cell2mat(table2cell(join1(:,29)));
bendrad = cell2mat(table2cell(join1(:,30)));
%end2 = cell2mat(table2cell(join1(:,34)));
enda = cell2mat(table2cell(join1(:,35)));
endx = cell2mat(table2cell(join1(:,36)));
spec1 = cell2mat(table2cell(join1(:,40)));
spec2 =cell2mat(table2cell(join1(:,41)));
spec3 =cell2mat(table2cell(join1(:,42)));
%spec4 = cell2mat(table2cell(join1(:,43)));
%spec5 = cell2mat(table2cell(join1(:,44)));
cpt = cell2mat(table2cell(join1(:,51)));
%{
for i = 1 :30213
volfull(i)= dia(i)^2*3.1415957/4*length(i);
volwall(i) = (dia(i)^2-(dia(i)-wall(i)).^2)*3.1415957/4*length(i);
end
volfull = volfull';
volwall = volwall';
2
%}
X = [tubeid sup quote anual min bracket quan cd q1 ck cm mid dia wall length numbend bendrad enda endx spec1 spec2 cpt];
%dd = TreeBagger(200,X,cost,'Method','regression');
dd = fitensemble(X,cost,'Bag',200,'Tree','type','regression');
%cvtree = crossval(dd);
%L = kfoldLoss(cvtree);
%accuracy = resubLoss(dd);


% test data
tubeid1 = cell2mat(table2cell(testdata1(:,2)));
sup1 = cell2mat(table2cell(testdata1(:,3)));
quote1 =cell2mat(table2cell(filter(:,1)));
%quote1 = datenum(cell2mat(table2cell(testdata1(:,4))));
anual1 = cell2mat(table2cell(testdata1(:,5)));
min1 = cell2mat(table2cell(testdata1(:,6)));
bracket1 = cell2mat(table2cell(testdata1(:,7)));
quan1 =cell2mat(table2cell(testdata1(:,8)));
%cost1 = cell2mat(table2cell(testdata(:,8)));
cd1 = cell2mat(table2cell(testdata1(:,9)));
q11 = cell2mat(table2cell(testdata1(:,10)));
ck1 = cell2mat(table2cell(testdata1(:,11)));
q12 = cell2mat(table2cell(testdata1(:,12)));
cm1 = cell2mat(table2cell(testdata1(:,13)));
q13 = cell2mat(table2cell(testdata1(:,14)));
%cl1 = cell2mat(table2cell(testdata1(:,15)));
%q14 = cell2mat(table2cell(testdata1(:,16)));
mid1 = cell2mat(table2cell(testdata1(:,25)));
dia1 = cell2mat(table2cell(testdata1(:,26)));
wall1 =cell2mat(table2cell(testdata1(:,27)));
length1 =cell2mat(table2cell(testdata1(:,28)));
numbend1 = cell2mat(table2cell(testdata1(:,29)));
bendrad1 = cell2mat(table2cell(testdata1(:,30)));
%end21 = cell2mat(table2cell(testdata1(:,34)));
enda1 = cell2mat(table2cell(testdata1(:,35)));
endx1= cell2mat(table2cell(testdata1(:,36)));
spec11 = cell2mat(table2cell(testdata1(:,40)));
spec21 =cell2mat(table2cell(testdata1(:,41)));
spec31 =cell2mat(table2cell(testdata1(:,42)));
spec41 = cell2mat(table2cell(testdata1(:,43)));
spec51 = cell2mat(table2cell(testdata1(:,44)));
%name1 = cell2mat(table2cell(testdata1(:,50)));
cpt1 = cell2mat(table2cell(testdata1(:,51)));
%{
for i = 1 :30235
volfull1(i)= dia1(i)^2*3.1415957/4*length1(i);
volwall1(i) = (dia1(i)^2-(dia1(i)-wall1(i)).^2)*3.1415957/4*length1(i);
end
volfull1 = volfull1';
volwall1 = volwall1';
%}
X1 = [tubeid1 sup1 quote1 anual1 min1 bracket1 quan1 cd1 q11 ck1 cm1 mid1 dia1 wall1 length1 numbend1 bendrad1 enda1 endx1 spec11 spec21 cpt1]; 
kd = exp(predict(dd,X1))-1;