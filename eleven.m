n = 5;

S = createDSTMatrix(n);

I_check = S * S;

disp('Result of S * S for n=5:');
disp(I_check);

I_5 = eye(n);
disp('Difference from identity matrix (S*S - I):');
disp(I_check - I_5);