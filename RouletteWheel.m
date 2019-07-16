%===============================================================================
% Memilih orang tua menggunakan LinearFitness, yaitu nilai fitness hasil
% pen-skala-an. Pemilihan dilakukan secara proporsional sesuai dengan 
% nilai fitness-nya.
%===============================================================================

function Pindex = RouletteWheel(UkPop,LinearFitness)

JumFitness = sum(LinearFitness);
KumulatifFitness  = 0;
RN = rand;
ii = 1;
while ii <= UkPop,
  KumulatifFitness = KumulatifFitness + LinearFitness(ii);
  if (KumulatifFitness/JumFitness) > RN,
    Pindex = ii;
    break;
  end
  ii = ii + 1;
end