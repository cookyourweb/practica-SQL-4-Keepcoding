

-- Second Part- Questions queries --


select 
	alveronicaflota_dll.group."name_group" as "Business Group",
	alveronicaflota_dll.brand."id_brand" as "Brand",
	alveronicaflota_dll.model."id_model" as "Model",
	alveronicaflota_dll.color."id_color" as "Color",
	alveronicaflota_dll.cars.dt_registration,
	alveronicaflota_dll.cars.total_km,
	alveronicaflota_dll.cars.licence_plate
	
from alveronicaflota_dll.cars
inner join  alveronicaflota_dll.model  
			on alveronicaflota_dll.model.id_model = alveronicaflota_dll.cars.id_model
		
inner join alveronicaflota_dll.brand
			on alveronicaflota_dll.model.id_brand = alveronicaflota_dll.brand.id_brand 
		
inner join alveronicaflota_dll.group 
			on alveronicaflota_dll.group.id_group = alveronicaflota_dll.brand.id_group
		
inner join alveronicaflota_dll.color 
			on alveronicaflota_dll.color.id_color = alveronicaflota_dll.cars.id_color
		


