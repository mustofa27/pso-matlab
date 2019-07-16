%===============================================================================
% Mutasi gen dengan probabilitas sebesar Pmutasi
% Gen-gen yang terpilih diubah nilainya
%===============================================================================

function MutKrom = Mutasi(Kromosom,JumGen,Pmutasi)

MutKrom = Kromosom;
for ii=1:JumGen,
  if (rand < Pmutasi),
    Kromosom(ii) = rand;
  end
end
