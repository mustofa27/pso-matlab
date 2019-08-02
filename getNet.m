function net = getNet(jumlahPopulasi, jumlahGenerator, individuIdeal)
    B = rand(jumlahPopulasi, jumlahGenerator);
    T = zeros(jumlahPopulasi, jumlahGenerator);
    %varPengali = [80 80 40 50 30 55];
    %individuIdeal = varPengali .* individuIdeal;
    %% target harus dibedakan, kalo sama maka NN tidak akan mau....
    %% merespon...pengali.*[0.6 0.7 0.9 0.8 0.7]
    %% T (i,:)-----mengisi kolom matrik dengan [0.6 0.7 0.9 0.8 0.7]

    % data_target=target_nn
    % T=zeros(1,8);
    for i = 1:jumlahPopulasi
        pengali = 1+rand(1)*0.1;
        T (i,:)= pengali.* individuIdeal;
    end
    T = T';
    P = B';
    %% tes jaringan sebelum di trainning
    net = newff(P,T,6);
    %% membentuk jaringan dengan training
    net.trainParam.show = 1;
    net.trainParam.epochs = 500;
    net.trainParam.goal = 0.000001;
    net.trainParam.lr = 0.01;
    net = train(net,P,T);
end