CREATE DEFINER=`muller851u_appli`@`%` PROCEDURE `sp_abonne_annuel`(in num int, out abo_annuel boolean)
BEGIN

declare v_moisdeb, v_duree,v_moisfin int default 0;
declare fincurs1 boolean default 0;

declare curs1 cursor for
	select abo_debut, trfa_periode
	from ABONNEMENT ab, TARIF_ABONNE ta
	where ta.trfa_id=ab.trfa_id
	and abo_id=num
	order by abo_debut, trfa_periode;
declare continue handler for not found set fincurs1=1;
open curs1;
fetch curs1 into v_moisdeb, v_duree;
if not fincurs1 then
	if v_moisdeb=1 then
		set v_moisfin:=v_moisdeb+v_duree;
		fetch curs1 into v_moisdeb,v_duree;
	else
		set fincurs1:=1;
	end if;
end if;

while (not fincurs1 and v_moisfin<13) do
	if v_moisdeb>v_moisfin 
		then set fincurs1:=1;
	else if (v_moisdeb+v_duree)>v_moisfin
		then set v_moisfin:= v_moisdeb+v_duree;
	end if;
	end if;
	fetch curs1 into v_moisdeb, v_duree;
end while;
close curs1;
set abo_annuel :=(v_moisfin=13);
END