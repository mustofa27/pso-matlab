function [fitness, cost] = getCost(pVal, jumlahPopulasi)
    cost = zeros(jumlahPopulasi,1);
    fitness = zeros(jumlahPopulasi,1);
    for i = 1 : jumlahPopulasi
        [fitnessTemp, costTemp] = EvaluasiIndividu(pVal(i, :, 1));
        fitness(i) = fitnessTemp;
        if fitnessTemp==0
            cost(i) = 9999999999;
        else
            cost(i) = costTemp;
        end
    end
end