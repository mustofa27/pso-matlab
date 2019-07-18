clear;
clc;
%petunjuk : evaluasiindividu input = vector, output [fitness, cost]
%random nilai daya
%baru masuk ke pso
maxCost = 9999999999;
jumlahGenerator = 6;
jumlahPopulasi = 10;
iterasi = 2000;
c1 = 1;
c2 = 1;
r1 = 0.4;
r2 = 0.5;
[populasi, fitness, cost] = randomPopulation(jumlahPopulasi, jumlahGenerator, iterasi);
velocity = zeros(jumlahPopulasi, jumlahGenerator,iterasi);
costBest = cost(:, 1);
perjalananCostBest = cost;
fitnessBest = fitness(:, 1);
pBest = populasi(:, :, 1);
w = 0;
for i = 2 : iterasi
    [valMin, indexMin] = min(costBest);
    gBest = repmat(pBest(indexMin, :), jumlahPopulasi, 1);
    velocity(:, :, i) = w * velocity(:, :, i-1) + (c1*r1*(pBest - populasi(:, :, i-1))) + (c2*r2*(gBest - populasi(:, :, i-1)));
    pIter = populasi(:, :, i-1) + velocity(:, :, i);
    populasi(:, :, i) = pIter;
    [fitnessIter, costIter] = getCost(pIter, jumlahPopulasi)
    cost(:, i) = costIter;
    for j = 1 : jumlahPopulasi
        if costBest(j) > costIter(j)
            pBest(j, :, 1) = pIter(j, :, 1);
            fitnessBest(j) = fitnessIter(j);
        end
    end
    fitness(:, i) = fitnessBest;
    costBest = min(costBest, costIter);
    perjalananCostBest(:, i) = costBest;
    selisih = std(pIter)
    selisihNilaiP = mean(selisih)
    if selisihNilaiP < 0.001
        break;
    end
end
