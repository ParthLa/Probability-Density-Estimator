N = 2000;
M = dlmread('XYZ.txt',',');
X = M(1:2000,1);
Y = M(1:2000,2);
Z = M(1:2000,3);
XY = sum(X.*Y);
XZ = sum(X.*Z);
YZ = sum(Y.*Z);
X2 = sum(X.*X);
Y2 = sum(Y.*Y);
Z2 = sum(Z.*Z);
X1 = sum(X);
Y1 = sum(Y);
Z1 = sum(Z);
A = [ X2 XY X1 ; XY Y2 Y1 ; X1 Y1 N ];
B = [ XZ ; YZ ; Z1 ];
ANS = mldivide(A,B);
disp("a equals");
disp(ANS(1,1));
disp("b equals");
disp(ANS(2,1));
disp("c equals");
disp(ANS(3,1));
ZV = Z - ANS(1,1)*X - ANS(2,1)*Y - ANS(3,1);
ZV2 = sum(ZV.*ZV);
VAR = ZV2/N;
disp("Variance equals");
disp(VAR);

