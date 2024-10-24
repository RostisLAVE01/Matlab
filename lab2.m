% Задание 1

n = 6;
m = 3;

% матрица мощности
matr1 = [1,2,2,5,3,1;
      1/2,1,1,1/5,1/2,1/3;
      1/2,1,1,1/5,1/2,1/3;
      1/5,5,5,1,3,3;
      1/3,2,2,1/3,1,1/3;
      1,3,3,1/3,3,1];


% матрица момента
matr2 = [1,5,3,1,3,2;
        1/5,1,3,5,3,5;
        1/3,1/3,1,2,1,3;
        1,1/5,1/2,1,1/2,2;
        1/3,1/3,1,2,1,3;
        1/2,1/5,1/3,1/2,1/3,1];


% матрица массы
matr3 = [1,1/3,1/2,3,1/2,5;
         3,1,2,5,2,9;
         2,1/2,1,3,1,5;
         1/3,1/5,1/3,1,1/3,3;
         2,1/2,1,3,1,9;
         1/5,1/9,1/5,1/3,1/9,1];

% матрица сравнения
matr4 = [1,5,2;
       1/5,1,1/3;
       1/2,3,1];

vec_srav = zeros(1,m);
nor_srav = zeros(m);
cred_srav = zeros(1,m);

vec_sum1 = zeros(1,n);
vec_sum2 = zeros(1,n);
vec_sum3 = zeros(1,n);
nor_matr1 = zeros(n);
nor_matr2 = zeros(n);
nor_matr3 = zeros(n);

cred_matr1 = zeros(n,1);
cred_matr2 = zeros(n,1);
cred_matr3 = zeros(n,1);

disp(vec_sum3);

for i = 1:m
    
    vec_srav(i) = round(sum(matr4(:,i)),1);
    nor_srav(:,i) = matr4(:,i)/vec_srav(i);

end


for j = 1:m

    cred_srav(j) = sum(nor_srav(j,:))/m;

end

for i = 1:n
    
    %Суммы элементов столбцов
    vec_sum1(i) = round(sum(matr1(:,i)),1);
    vec_sum2(i) = round(sum(matr2(:,i)),1);
    vec_sum3(i) = round(sum(matr3(:,i)),1);

    %нормализованные матрицы
    nor_matr1(:,i) = matr1(:,i)/vec_sum1(i);
    nor_matr2(:,i) = matr2(:,i)/vec_sum2(i);
    nor_matr3(:,i) = matr3(:,i)/vec_sum3(i);

end
disp('Нормализованные матрицы:');
disp(nor_matr1);
disp(nor_matr2);
disp(nor_matr3);

for j = 1:n

    %Средние значения элементов строк
    cred_matr1(j) = sum(nor_matr1(j,:))/n;
    cred_matr2(j) = sum(nor_matr2(j,:))/n;
    cred_matr3(j) = sum(nor_matr3(j,:))/n;
end
disp('Средние значения элементов строк:');
disp(cred_matr1);
disp(cred_matr2);
disp(cred_matr3);


A1 = sum(matr1*cred_matr1);
A2 = sum(matr2*cred_matr2);
A3 = sum(matr3*cred_matr3);

disp('Для согласованности:');
disp(A1);

CI1 = (A1 - n) / (n - 1);
CI2 = (A2 - n) / (n - 1);
CI3 = (A3 - n) / (n - 1);
RI = (1.98 * (n - 2)) / n;
CR1 = CI1 / RI;
CR2 = CI2 / RI;
CR3 = CI3 / RI;

disp('Уровень несогласованности матрицы:');
disp(CR1);
disp(CR2);
disp(CR3);

OTV = cred_matr1 * cred_srav(1) + cred_matr2 * cred_srav(2) + cred_matr3 * cred_srav(3);

disp('Ответ:');
disp(OTV);

% Задание 2 Выбор бытовой техники: микроволновая печь.


%1 Цена
%2 Мощность
%3 Объем
%4 Бренд
%5 Функции
%6 Дизайн и размеры

n = 6;
m = 6;

%1 Цена
matr2_1 = [1, 2, 3, 5, 4, 1; 
         1/2, 1, 2, 3, 2, 1/3; 
         1/3, 1/2, 1, 2, 1, 1/4; 
         1/5, 1/3, 1/2, 1, 2, 1/6; 
         1/4, 1/2, 1, 1/2, 1, 1/5; 
         1, 3, 4, 6, 5, 1];


%2 Мощность
matr2_2 = [1, 3, 2, 4, 5, 1; 
         1/3, 1, 1/2, 2, 3, 1/5; 
         1/2, 2, 1, 3, 4, 1/3; 
         1/4, 1/2, 1/3, 1, 2, 1/5; 
         1/5, 1/3, 1/4, 1/2, 1, 1/6; 
         1, 5, 3, 5, 6, 1];


%3 Объем
matr2_3 = [1, 2, 3, 4, 5, 1; 
         1/2, 1, 1.5, 2, 3, 1/3; 
         1/3, 2/3, 1, 1.5, 2, 1/4; 
         1/4, 1/2, 2/3, 1, 2, 1/5; 
         1/5, 1/3, 1/2, 1/2, 1, 1/6; 
         1, 3, 4, 5, 6, 1];

%4 Бренд
matr2_4 = [1, 3, 2, 4, 1, 1; 
         1/3, 1, 1/2, 2, 1/4, 1/3; 
         1/2, 2, 1, 3, 1/2, 1/4; 
         1/4, 1/2, 1/3, 1, 1/3, 1/5; 
         1, 4, 2, 3, 1, 1/3; 
         1, 3, 4, 5, 3, 1];


%5 Функции
matr2_5 = [1, 2, 3, 3, 5, 1; 
         1/2, 1, 2, 1, 3, 1/3; 
         1/3, 1/2, 1, 1, 2, 1/4; 
         1/3, 1, 1, 1, 3, 1/5; 
         1/5, 1/3, 1/2, 1/3, 1, 1/6; 
         1, 3, 4, 5, 6, 1];


%6 Дизайн и размеры
matr2_6 = [1, 2, 3, 4, 5, 1; 
         1/2, 1, 1.5, 1.5, 3, 1/3; 
         1/3, 2/3, 1, 1.5, 2, 1/4; 
         1/4, 2/3, 2/3, 1, 1.5, 1/5; 
         1/5, 1/3, 1/2, 2/3, 1, 1/6; 
         1, 3, 4, 6, 5, 1];

% матрица сравнения
matr2_7 = [
    1,     3,   5,   4,   6,   2;  % Цена
    1/3,   1,   3,   2,   4,   1/2;  % Мощность
    1/5,   1/3, 1,   2,   3,   1/4;  % Объем
    1/4,   1/2, 1/2, 1,   3,   1/3;  % Бренд
    1/6,   1/4, 1/3, 1/3, 1,   1/5;  % Функции
    1/2,   2,   4,   3,   5,   1     % Дизайн и размеры
];

vec_srav = zeros(1,m);
nor_srav = zeros(m);
cred_srav = zeros(1,m);

vec_sum1 = zeros(1,n);
vec_sum2 = zeros(1,n);
vec_sum3 = zeros(1,n);
vec_sum4 = zeros(1,n);
vec_sum5 = zeros(1,n);
vec_sum6 = zeros(1,n);
nor_matr1 = zeros(n);
nor_matr2 = zeros(n);
nor_matr3 = zeros(n);
nor_matr4 = zeros(n);
nor_matr5 = zeros(n);
nor_matr6 = zeros(n);

cred_matr1 = zeros(n,1);
cred_matr2 = zeros(n,1);
cred_matr3 = zeros(n,1);
cred_matr4 = zeros(n,1);
cred_matr5 = zeros(n,1);
cred_matr6 = zeros(n,1);

disp(vec_sum3);

for i = 1:m
    
    vec_srav(i) = round(sum(matr2_7(:,i)),1);
    nor_srav(:,i) = matr2_7(:,i)/vec_srav(i);

end


for j = 1:m

    cred_srav(j) = sum(nor_srav(j,:))/m;

end

for i = 1:n
    
    %Суммы элементов столбцов
    vec_sum1(i) = round(sum(matr2_1(:,i)),1);
    vec_sum2(i) = round(sum(matr2_2(:,i)),1);
    vec_sum3(i) = round(sum(matr2_3(:,i)),1);
    vec_sum4(i) = round(sum(matr2_4(:,i)),1);
    vec_sum5(i) = round(sum(matr2_5(:,i)),1);
    vec_sum6(i) = round(sum(matr2_6(:,i)),1);

    %нормализованные матрицы
    nor_matr1(:,i) = matr2_1(:,i)/vec_sum1(i);
    nor_matr2(:,i) = matr2_2(:,i)/vec_sum2(i);
    nor_matr3(:,i) = matr2_3(:,i)/vec_sum3(i);
    nor_matr4(:,i) = matr2_4(:,i)/vec_sum4(i);
    nor_matr5(:,i) = matr2_5(:,i)/vec_sum5(i);
    nor_matr6(:,i) = matr2_6(:,i)/vec_sum6(i);

end
disp('Нормализованные матрицы:');
disp(nor_matr1);
disp(nor_matr2);
disp(nor_matr3);
disp(nor_matr4);
disp(nor_matr5);
disp(nor_matr6);

for j = 1:n

    %Средние значения элементов строк
    cred_matr1(j) = sum(nor_matr1(j,:))/n;
    cred_matr2(j) = sum(nor_matr2(j,:))/n;
    cred_matr3(j) = sum(nor_matr3(j,:))/n;
    cred_matr4(j) = sum(nor_matr4(j,:))/n;
    cred_matr5(j) = sum(nor_matr5(j,:))/n;
    cred_matr6(j) = sum(nor_matr6(j,:))/n;
end
disp('Средние значения элементов строк:');
disp(cred_matr1);
disp(cred_matr2);
disp(cred_matr3);
disp(cred_matr4);
disp(cred_matr5);
disp(cred_matr6);

A1 = sum(matr2_1*cred_matr1);
A2 = sum(matr2_2*cred_matr2);
A3 = sum(matr2_3*cred_matr3);
A4 = sum(matr2_4*cred_matr4);
A5 = sum(matr2_5*cred_matr5);
A6 = sum(matr2_6*cred_matr6);
disp('Для согласованности:');
disp(A1);

CI1 = (A1 - n) / (n - 1);
CI2 = (A2 - n) / (n - 1);
CI3 = (A3 - n) / (n - 1);
CI4 = (A4 - n) / (n - 1);
CI5 = (A5 - n) / (n - 1);
CI6 = (A6 - n) / (n - 1);

RI = (1.98 * (n - 2)) / n;
disp(RI);
CR1 = CI1 / RI;
CR2 = CI2 / RI;
CR3 = CI3 / RI;
CR4 = CI4 / RI;
CR5 = CI5 / RI;
CR6 = CI6 / RI;

disp('Уровень несогласованности матрицы:');
disp(CR1);
disp(CR2);
disp(CR3);
disp(CR4);
disp(CR5);
disp(CR6);

OTV = cred_matr1 * cred_srav(1) + cred_matr2 * cred_srav(2) + cred_matr3 * cred_srav(3) + cred_matr4 * cred_srav(4) + cred_matr5 * cred_srav(5) + cred_matr6 * cred_srav(6);

disp('Ответ:');
disp(OTV);


