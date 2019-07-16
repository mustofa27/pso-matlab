%===============================================================================
% Men-skala-kan nilai fitness ke dalam ranking sehingga diperoleh
% nilai-nilai fitness baru yang berada dalam rentang [MaxF,MinF]
%===============================================================================

function LFR = LinearFitnessRanking(UkPop,Fitness,MaxF,MinF)

% SF berisi nilai fitness yang terurut dari kecil ke besar (ascending)
% IndF berisi index dari nilai fitness yang menyatakan nomor urut kromosom
[SF,IndF] = sort(Fitness);

% LinearFitness = nilai fitness baru hasil pen-skala-an
for rr=1:UkPop,
  LFR(IndF(UkPop-rr+1)) = MaxF-(MaxF-MinF)*((rr-1)/(UkPop-1));
end