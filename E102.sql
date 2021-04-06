SELECT concat(date_format(makedate(YEAR(NOW()),jour_in),'%d/%m'),
' à ',
date_format(sec_to_time(heure_in*60),'%Hh%i')) AS'Entrée',

concat(date_format(makedate(YEAR(NOW()),jour_out),'%d/%m'),
' à ',
date_format(sec_to_time(heure_out*60),'%Hh%i')) AS'Sortie'

FROM ENTREE

WHERE date_format(makedate(YEAR(NOW()),jour_in),'%d/%m')='20/01'