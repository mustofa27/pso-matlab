      %% program NN untuk mentrain populasi baru

     
      B = rand(10,6);
      [bb b] = size(B);
      %% target harus dibedakan, kalo sama maka NN tidak akan mau....
      %% merespon...pengali.*[0.6 0.7 0.9 0.8 0.7]
      %% T (i,:)-----mengisi kolom matrik dengan [0.6 0.7 0.9 0.8 0.7]
      
     % data_target=target_nn
     % T=zeros(1,8);
      for i = 1:bb
        pengali = 1+rand(1)*0.1;
        %T2 (i,:)= pengali.*[data_target];
        %T (i,:)= pengali.*[data_target];
       T (i,:)= pengali.* [0.7881    0.7366    0.4499    0.6233    0.5961    0.4286];
      end
      
      T = T';
      P = B';
      %% tes jaringan sebelum di trainning
      net = newff(P,T,6);    
      Y0 = sim(net,rand(6,1));
      %% membentuk jaringan dengan training
      net.trainParam.show = 1;
      net.trainParam.epochs = 500;
      net.trainParam.goal = 0.000001;
      net.trainParam.lr = 0.01;
      net = train(net,P,T);
      
      Y = sim(net,P(:,1));
      %% data yang akan di uji dengan jaringan yang sudah terbentuk
      
      X = rand(6,100);
      yy = sim(net,X);
      A = yy';
      X = X';
      %A (1:25,:) = X (1:25,:);
     
      
%       plot(T,'o')
%       hold on
%       plot(yy,'*')
%       hold on
%       plot(Y0,'-')
%       axis([1 5 0 1])
%       T
%       Y
%       B = net.LW;
%       C=B{2}
      