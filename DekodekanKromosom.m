%===============================================================================
% Mendekodekan kromosom yang berisi random dalam interval daya aktif generator 
%===============================================================================

function x = DekodekanKromosom(Kromosom)

% x(1) = (50+(200-50)     *Kromosom(1));        
% x(2) = (20+(80-20)      *Kromosom(2));      
% x(3) = (15+(50-15)      *Kromosom(3));       
% x(4) = (10+(35-10)      *Kromosom(4));        
% x(5) = (10+(30-10)      *Kromosom(5));      
% x(6) = (12+(40-12)      *Kromosom(6)); 

x(1) = round(0+(80-0)      *Kromosom(1));        
x(2) = round(0+(80-0)      *Kromosom(2));      
x(3) = round(0+(50-0)      *Kromosom(3));       
x(4) = round(0+(55-0)      *Kromosom(4));        
x(5) = round(0+(30-0)      *Kromosom(5));      
x(6) = round(0+(40-0)      *Kromosom(6));       




