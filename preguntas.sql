/*
 *     Practica Modelado y SQL. Keepcoding. 2  Parte
 * 
 */

SELECT m.name_brand as brand, m2.name_model as model, ge.name_group as group, 
c.dt_registration as fecha_compra, c.licence_plate, c2.name_color as color, c.tot_kms as km, a.name_insurance_company as insurance_company, p.num_policy as poliza


FROM practicasqlKCReentrega.brand m 


JOIN practicasqlKCReentrega.model m2 ON m.id_brand = m2.id_brand  
join practicasqlKCReentrega.group ge on ge.id_group  = m.id_group  
join practicasqlKCReentrega.kc_cars c on m2.id_model = c.id_model
join practicasqlKCReentrega.color c2 on c.id_color = c2.id_color 
join practicasqlKCReentrega.policy p on c.id_insurance_company = p.id_insurance_company  
join practicasqlKCReentrega.insurance_company a on c.id_insurance_company = a.id_insurance_company order by dt_registration desc
