maxCost = 9999999999;
jumlahGenerator = 6;
jumlahPopulasi = 10;
iterasi = 200;
c1 = 1;
c2 = 1;
r1 = 0.4;
r2 = 0.5;
fitness1 = fitness(:,:,1);
cost1 = cost(:,:,1);
velocity1 = zeros(jumlahPopulasi, jumlahGenerator,1);
costBest1 = cost1(:, 1);
perjalananCostBest1 = cost1;
fitnessBest1 = fitness1(:, 1);
pBest1 = populasi(:, :, 1);
w = 0.8;
individuIdeal = gBest(1,:);
net = getNet(jumlahPopulasi, jumlahGenerator, individuIdeal);
out = sim(net,populasi(:,:,1)')
populasi1 = out';
for i = 2 : iterasi
    [valMin, indexMin] = min(costBest1);
    gBest1 = repmat(pBest1(indexMin, :), jumlahPopulasi, 1);
    r1 = rand(1);
    r2 = rand(1);
    velocity1(:, :, i) = w * velocity1(:, :, i-1) + (c1*r1*(pBest1 - populasi1(:, :, i-1))) + (c2*r2*(gBest1 - populasi1(:, :, i-1)));
    pIter1 = populasi1(:, :, i-1) + velocity1(:, :, i);
    [fitnessIter1, costIter1] = getCost(pIter1, jumlahPopulasi)
    %while any(costIter1(:) == 9999999999) == 1
    %    out = sim(net,pIter1')
    %    pIter1 = out';
    %    [fitnessIter1, costIter1] = getCost(pIter1, jumlahPopulasi);
    %end
    populasi1 = cat(3,populasi1,pIter1);
    cost1(:, i) = costIter1;
    for j = 1 : jumlahPopulasi
        if costBest1(j) > costIter1(j)
            pBest1(j, :, 1) = pIter1(j, :, 1);
            fitnessBest1(j) = fitnessIter1(j);
        end
    end
    fitness1(:, i) = fitnessBest1;
    costBest1 = min(costBest1, costIter1);
    perjalananCostBest1(:, i) = costBest1;
    selisih = std(pIter1)
    selisihNilaiP = mean(selisih)
    if selisihNilaiP < 0.001
        break;
    end
end
