function [ pot_inst ] = pot( vect,parm1,parm2 )
%calcula como enconrr la potencia instantanea apartir del promedio (offset)

pot_inst=(trapz(vect.^2)/(parm2-parm1));

end