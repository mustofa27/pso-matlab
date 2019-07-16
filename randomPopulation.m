function [populasi, fitness, cost] = randomPopulation(jumlahPopulasi, jumlahGenerator, jumlahIterasi)
    populasi = zeros(jumlahPopulasi, jumlahGenerator, jumlahIterasi);
    cost = zeros(jumlahPopulasi, jumlahIterasi);
    fitness = zeros(jumlahPopulasi, jumlahIterasi);
    iter = 0;
    varPengali = [80 80 40 50 30 55];
    while iter ~= jumlahPopulasi
        temp = rand(1,jumlahGenerator);
        temp = temp .* varPengali;
        [fitnessTemp, costTemp ] = EvaluasiIndividu(temp);
        if fitnessTemp == 0
            continue;
        else
            iter = iter + 1;
            populasi(iter, :, 1) = temp;
            cost(iter) = costTemp;
            fitness(iter) = fitnessTemp;
        end
    end
end