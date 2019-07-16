%petunjuk : evaluasiindividu input = vector, output [fitness, cost]
%random nilai daya
%baru masuk ke pso
maxCost = 9999999999;
jumlahGenerator = 6;
jumlahPopulasi = 10;
iterasi = 100;
c1 = 1;
c2 = 1;
r1 = 0.4;
r2 = 0.5;
[populasi, fitness, cost] = randomPopulation(jumlahPopulasi, jumlahGenerator, iterasi);
velocity = zeros(jumlahPopulasi, jumlahGenerator,iterasi);
pBest = populasi(:, :, 1);
costBest = cost(:, 1);
perjalananCostBest = cost;
fitnessBest = fitness(:, 1);
for i = 2 : iterasi
    costBefore = perjalananCostBest(:, i-1);
    costBefore(costBefore==0) = maxCost;
    [valMin, indexMin] = min(costBefore);
    gBest = repmat(pBest(indexMin, :), jumlahPopulasi, 1);
    velocity(:, :, i) = velocity(:, :, i-1) + (c1*r1*(pBest - populasi(:, :, i-1))) + (c2*r2*(gBest - populasi(:, :, i-1)));
    pIter = populasi(:, :, i-1) + velocity(:, :, i);
    populasi(:, :, i) = pIter;
    [fitnessIter, costIter] = getCost(pIter, jumlahPopulasi);
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
end
