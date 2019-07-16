%===============================================================================
% Mengevaluasi individu sehingga didapatkan nilai fitness-nya 
%===============================================================================

function [fitness, cost] = EvaluasiIndividu(x)
cost = 0;
basemva = 100;  accuracy = 0.001; maxiter = 100; accel = 1.6;

%        Bus Bus  Voltage Angle   ---Load----  -------Generator-----              Static Mvar
%        No  code Mag.    Degree  MW    Mvar       MW        Mvar     Qmin  Qmax    +Qc/-Ql
busdata=[1	 1	  1       0       0     0          23.54     0        -20   150         0
         2	 2    1       0       21.7	12.7       60.97     0        -20   60          0
         3	 0    1       0       2.4	1.2		   0         0         0    0           0
         4	 0    1       0       7.6	1.6	       0         0         0    0           0
         5	 0    1       0       0     0          0         0         0    0           0
         6	 0    1       0       0     0          0         0         0    0           0
         7	 0    1       0       22.8	10.9       0         0         0    0           0
         8 	 0    1       0       30	30         0         0         0    0           0
         9	 0    1       0       0     0          0         0         0    0           0
         10	 0    1       0       5.8	2	       0         0         0    0           0
         11	 0    1       0       0     0          0         0         0    0           0
         12	 0    1       0       11.2	7.5        0         0         0    0           0
         13	 2    1       0       0     0          37        0        -15   44.7        0
         14	 0    1       0       6.2	1.6        0         0          0   0           0
         15	 0    1       0       8.2	2.5	       0         0          0   0           0
         16	 0    1       0       3.5	1.8        0         0          0   0           0
         17	 0    1       0       9     5.8        0         0          0   0           0
         18	 0    1       0       3.2	0.9        0         0          0   0           0
         19	 0    1       0       9.5	3.4        0         0          0   0           0
         20	 0    1       0       2.2	0.7        0         0          0   0           0
         21	 0    1       0       17.5	11.2       0         0          0   0           0
         22	 2    1       0       0     0          21.59     0         -15  62.5        0
         23	 2    1       0       3.2	1.6        19.2      0         -10  40          0
         24	 0    1       0       8.7	6.7        0         0          0   0           0
         25	 0    1       0       0     0          0         0          0   0           0
         26	 0    1       0       3.5	2.3        0         0          0   0           0
         27	 2    1       0       0     0          26.91     0         -15  48.7        0
         28	 0    1       0       0     0          0         0          0   0           0
         29	 0    1       0       2.4	0.9        0         0          0   0           0
         30	 0    1       0       10.6	1.9        0         0          0   0           0];

    
%                                           Line code
%         Bus bus         R            X           1/2 B     = 1 for lines
%         nl  nr         p.u.         p.u.          p.u.     > 1 or < 1 tr. tap at bus nl
linedata=[1	  2         0.02        0.06            0.015       1
          1	  3         0.05        0.19            0.01        1
          2	  4     	0.06        0.17            0.01        1
          3	  4         0.01        0.04            0           1
          2	  5     	0.05        0.2             0.01        1
          2	  6         0.06        0.18            0.01        1
          4	  6         0.01        0.04            0           1
          5	  7         0.05        0.12            0.005       1
          6   7         0.03        0.08            0.005       1
          6	  8         0.01        0.04            0           1
          6   9         0           0.21            0           1
          6	  10        0           0.56            0           1
          9	  11        0           0.21            0           1
          9	  10        0           0.11            0           1
          4	  12        0           0.26            0           1
          12  13        0           0.14            0           1
          12  14        0.12        0.26            0           1
          12  15        0.07        0.13            0           1
          12  16        0.09        0.2             0           1
          14  15        0.22        0.2             0           1
          16  17        0.08        0.19            0           1
          15  18        0.11        0.22            0           1
          18  19        0.06        0.13            0           1
          19  20        0.03        0.07            0           1
          10  20        0.09        0.21            0           1
          10  17        0.03        0.08            0           1
          10  21        0.03        0.07            0           1
          10  22        0.07        0.15            0           1
          21  22        0.01        0.02            0           1
          15  23        0.1         0.2             0           1
          22  24        0.12    	0.18            0           1
          23  24        0.13        0.27            0           1
          24  25        0.19        0.33            0           1
          25  26        0.25        0.38            0           1
          25  27        0.11        0.21            0           1
          28  27        0           0.4             0           1
          27  29        0.22        0.42            0           1
          27  30        0.32        0.6             0           1
          29  30        0.24        0.45            0           1
          8	  28        0.06        0.2             0.01        1
          6	  28        0.02        0.06        	0.005       1];

       

% Input Kromosom ke Bus Data Untuk LF
busdata(1,7)   = x(1);        
busdata(2,7)   = x(2);        
busdata(13,7)  = x(3);               
busdata(22,7)  = x(4);        
busdata(23,7)  = x(5);        
busdata(27,7)  = x(6);  

% Batasan Konstrain Daya Aktif 
% Batasan Maksimum Slack Bus
if (sum(busdata(:,5)) > busdata(2,7)+busdata(13,7)+busdata(22,7)+busdata(23,7)+busdata(27,7)+ 80),
   fitness = 0;
end;

% Batasan Equality
if (sum(busdata(:,5)) ~= busdata(1,7)+busdata(2,7)+busdata(13,7)+busdata(22,7)+busdata(23,7)+busdata(27,7)),
    fitness = 0;
end;

% Batasan Inequality
if (sum(busdata(:,5)) > busdata(1,7)+busdata(2,7)+busdata(13,7)+busdata(22,7)+busdata(23,7)+busdata(27,7)),
   fitness = 0;
else
   [test, cost] = alirandaya (busdata,linedata);
   fitness = test;
end;