clear, net = newp([-3 3;-3 3],1); %диапазон значений и количество выходных нейронов 1
net.trainParam.passes = 1; %число проходов 1
p = {[-2;-1] [1;-1] [0;1] [2;0]}
t = {1 0 1 0};
[net,a,e] = adapt(net,p,t);
a, e;
twts = net.IW{1,1}, tbiase = net.b{1}; %Скорректированные вектор весов и смещение
[net,a,e] = adapt(net,p,t); a, e; %обучим сеть
twts = net.IW{1,1}, tbiase = net.b{1};
a1 = sim(net,p); %Моделируя полученную сеть по каждому входу