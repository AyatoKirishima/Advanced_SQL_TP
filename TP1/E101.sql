SELECT date_format(sec_to_time(trfh_duree*60),'%Hh%i') AS 'Durée Max',
concat(trfh_tarif,' €') AS 'tarif'
FROM TARIF_HORAIRE