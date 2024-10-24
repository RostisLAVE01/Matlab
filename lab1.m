n = 6;

matr = [1,1,0,1,1,1;
        1,1,1,1,1,1;
        0,0,1,1,1,1;
        0,0,0,1,1,0;
        0,0,0,0,1,0;
        0,0,0,1,1,1];


weight = ones(n, 1); % итерированная сила начало

disp(weight);

iter = 3; % кол-во итераций

for it = 1:iter

    newWeights = matr * weight;
    
    weight = newWeights;
    
    fprintf('Итерация %d:\n', it);
    disp(weight);
end

znak = weight / sum(weight); 

disp('Итерированную силу критерия:');
disp(weight);

disp('Значимость принятых критериев:');
disp(znak);
bar(znak);



% номер 2 

matr2 = [0.3,0.25,0.25,0.1;
         0.4,0.3,0.3,0.4;
         0.1,0.4,0.15,0.4;
         0.2,0.15,0.30,0.1];

matrixExp = matr2;

par = 4; % кол-во параметров
T = 0;

for i = 1:par
    r = matr2(:,i);
    element = sort(r);
    %disp(element);
    col = tabulate(element); % функция получения кол-ва одинаковых элементов
    col = flip(col);
    %disp(col);

    val = col(:,1); % число 
    con = col(:,2); % его количество 
    leng = length(val); 

    num = 1;
    weight = matrixExp(:,i); 
    for j = 1:leng
        
        num  = ceil(num); % округляем вверх 

        if con(j)>1
            num = sum(num:(con(j)+num-1)) / con(j);
            weight(weight == val(j)) = num;

            T = T + (con(j)^3 - con(j)); %Расчет показателей, указывающих на равные ранги

        else
            weight(weight == val(j)) = num;
            num = num + 1; 
        end


    end
    matrixExp(:,i) = weight;
end

S(par) = sum(matrixExp(par,:)); % сумма рангов

FullS = sum(S);% общая сумма рангов
d = sum((S-(FullS/par)).^2); % расчет отклонения суммы рангов

Sogl = 12 * d / (par^2 * (par^3 - par) - par * T);

disp('Экспертная оценка значимости параметров (Ранги):');
disp(matrixExp);
disp('Степень согласованности мнений экспертов:');
disp(Sogl);