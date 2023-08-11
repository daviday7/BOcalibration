--[[
Model - Mode/destination choice for other tour
Type - logit
Authors - Siyu Li, Harish Loganathan
]]

-- all require statements do not work with C++. They need to be commented. The order in which lua files are loaded must be explicitly controlled in C++. 
--require "Logit"

--Estimated values for all betas
--Note: the betas that not estimated are fixed to zero.

--!! see the documentation on the definition of AM,PM and OP table!!

local beta_cost_bus_mrt_1 =  0.000000e+00
local beta_cost_private_bus_1 = -9.990000e+02
local beta_cost_drive1_1 = -9.611876e+00
local beta_cost_share2_1 = -9.143159e+00
local beta_cost_share3_1 = -1.152476e+01
local beta_cost_motor_1 =  1.048357e+00
local beta_cost_taxi_1 =  0.000000e+00
local beta_cost_SMS_1 =  0.000000e+00
local beta_cost_Rail_SMS_1 =  0.000000e+00
local beta_cost_SMS_Pool_1 =  0.000000e+00
local beta_cost_Rail_SMS_Pool_1 =  0.000000e+00

local beta_cost_bus_mrt_2 =  0.000000e+00
local beta_cost_private_bus_2 = -9.990000e+02
local beta_cost_drive1_2 = -7.755425e+00
local beta_cost_share2_2 =  1.244443e+00
local beta_cost_share3_2 =  1.271499e-01
local beta_cost_motor_2 = -7.443164e-01
local beta_cost_taxi_2 =  0.000000e+00
local beta_cost_SMS_2 =  0.000000e+00
local beta_cost_Rail_SMS_2 = -3.460000e-01
local beta_cost_SMS_Pool_2 =  0.000000e+00
local beta_cost_Rail_SMS_Pool_2 = -3.460000e-01

local beta_tt_bus_mrt = -9.956742e-01
local beta_tt_private_bus = -9.990000e+02
local beta_tt_drive1 = -1.000000e+01
local beta_tt_share2 = -9.126220e+00
local beta_tt_share3 = -9.892463e+00
local beta_tt_motor =  4.832673e-01
local beta_tt_walk = -4.165327e+00
local beta_tt_taxi = -1.610000e+00
local beta_tt_SMS = -1.610000e+00
local beta_tt_Rail_SMS = -2.440000e+00
local beta_tt_SMS_Pool = -1.610000e+00
local beta_tt_Rail_SMS_Pool = -2.440000e+00

local beta_log = -1.064429e+00
local beta_area =  1.357519e+00
local beta_population = -8.139799e+00

local beta_central_bus_mrt =  4.064901e+00
local beta_central_private_bus = -9.990000e+02
local beta_central_drive1 =  1.798734e+00
local beta_central_share2 =  5.006843e-01
local beta_central_share3 = -9.377434e-01
local beta_central_motor = -9.133980e-01
local beta_central_walk =  6.851932e-01
local beta_central_taxi =  1.410000e+00
local beta_central_SMS =  1.410000e+00
local beta_central_Rail_SMS =  7.650000e-01
local beta_central_SMS_Pool =  1.410000e+00
local beta_central_Rail_SMS_Pool =  7.650000e-01

local beta_distance_bus_mrt =  6.778478e-01
local beta_distance_private_bus = -9.990000e+02
local beta_distance_drive1 = -1.834874e+00
local beta_distance_share2 = -1.959623e+00
local beta_distance_share3 = -3.042942e+00
local beta_distance_motor = -1.331780e+00
local beta_distance_walk = -4.371796e+00
local beta_distance_taxi = -2.600000e-02
local beta_distance_SMS = -2.600000e-02
local beta_distance_Rail_SMS =  5.040000e-02
local beta_distance_SMS_Pool = -2.600000e-02
local beta_distance_Rail_SMS_Pool =  5.040000e-02


local beta_cons_bus =  1.119741e+01
local beta_cons_mrt =  4.099354e+00
local beta_cons_private_bus = -9.990000e+02
local beta_cons_drive1 = -2.576358e+00
local beta_cons_share2 = -3.694662e+00
local beta_cons_share3 = -9.893439e-01
local beta_cons_motor =  8.787417e+00
local beta_cons_walk = -1.775331e+00
local beta_cons_taxi =  1.925000e+00
local beta_cons_SMS =  1.000000e+00
local beta_cons_Rail_SMS =  3.000000e+00
local beta_cons_SMS_Pool =  4.000000e-01
local beta_cons_Rail_SMS_Pool =  3.000000e-01

local beta_zero_bus =  1.343319e+00
local beta_oneplus_bus = -1.140494e+00
local beta_twoplus_bus =  1.185601e+00
local beta_threeplus_bus =  7.408122e-01

local beta_zero_mrt =  1.502231e+00
local beta_oneplus_mrt = -1.452639e-01
local beta_twoplus_mrt = -1.865959e+00
local beta_threeplus_mrt =  3.904582e-01

local beta_zero_privatebus =  0.000000e+00
local beta_oneplus_privatebus = -2.020000e+00
local beta_twoplus_privatebus =  0.000000e+00
local beta_threeplus_privatebus =  0.000000e+00

local beta_zero_drive1 = -4.205220e-01
local beta_oneplus_drive1 = -1.762855e+00
local beta_twoplus_drive1 =  2.477645e+00
local beta_threeplus_drive1 = -1.566996e+00

local beta_zero_share2 = -1.257748e+00
local beta_oneplus_share2 =  3.629633e+00
local beta_twoplus_share2 =  1.789667e+00
local beta_threeplus_share2 = -1.000523e-01

local beta_zero_share3 = -5.066531e-01
local beta_oneplus_share3 =  2.533899e-01
local beta_twoplus_share3 = -4.609022e-01
local beta_threeplus_share3 = -9.880174e-01

local beta_zero_car_motor =  1.901952e+00
local beta_oneplus_car_motor = -4.225187e-01
local beta_twoplus_car_motor =  3.153384e-01
local beta_threeplus_car_motor =  1.086546e-01

local beta_zero_walk =  1.716325e+00
local beta_oneplus_walk =  1.522074e+00
local beta_twoplus_walk =  2.000000e+00
local beta_threeplus_walk = -5.203268e-01

local beta_zero_taxi =  0.000000e+00
local beta_oneplus_taxi = -1.470000e+00
local beta_twoplus_taxi =  0.000000e+00
local beta_threeplus_taxi =  0.000000e+00

local beta_zero_SMS =  0.000000e+00
local beta_oneplus_SMS = -1.470000e+00
local beta_twoplus_SMS =  0.000000e+00

local beta_zero_Rail_SMS =  0.000000e+00
local beta_oneplus_Rail_SMS = -1.010000e+00
local beta_twoplus_Rail_SMS = -9.840000e-01

local beta_zero_SMS_Pool =  0.000000e+00
local beta_oneplus_SMS_Pool = -1.470000e+00
local beta_twoplus_SMS_Pool =  0.000000e+00

local beta_zero_Rail_SMS_Pool =  0.000000e+00
local beta_oneplus_Rail_SMS_Pool = -1.010000e+00
local beta_twoplus_Rail_SMS_Pool = -9.840000e-01

local beta_zero_motor = -1.391704e+00
local beta_oneplus_motor = -4.646429e-01
local beta_twoplus_motor =  1.721106e+00
local beta_threeplus_motor =  3.466263e-01

local beta_female_bus =  2.919000e+00
local beta_female_mrt =  1.072691e+00
local beta_female_private_bus =  1.380000e+00
local beta_female_drive1 =  1.955123e-01
local beta_female_share2 = -6.496617e-01
local beta_female_share3 =  1.683474e-01
local beta_female_motor = -2.574989e-01
local beta_female_taxi =  1.240000e+00
local beta_female_SMS =  1.240000e+00
local beta_female_Rail_SMS =  9.960000e-01
local beta_female_walk =  1.091953e+00
local beta_female_SMS_Pool =  1.240000e+00
local beta_female_Rail_SMS_Pool =  9.960000e-01



--choice set
local choice = {}

for i = 1, 616*8 do 

	choice[i] = i
end

--utility
-- 1 for public bus; 2 for MRT/LRT; 3 for private bus; 4 for drive1;
-- 5 for shared2; 6 for shared3+; 7 for motor; 8 for walk; 9 for taxi
-- 10 for SMS, 11 for Rail_SMS; 11 for SMS_Pool, 12 for Rail_SMS_Pool
local utility = {}
local function computeUtilities(params,dbparams)
	local cost_increase = dbparams.cost_increase
	local female_dummy = params.female_dummy
	local income_id = params.income_id
	local income_cat = {500.5,1250,1749.5,2249.5,2749.5,3499.5,4499.5,5499.5,6499.5,7499.5,8500,0,99999,99999}
	local income_mid = income_cat[income_id]

	local missing_income = (params.income_id >= 13) and 1 or 0


	local zero_car,one_plus_car,two_plus_car,three_plus_car, zero_motor,one_plus_motor,two_plus_motor,three_plus_motor = 0,0,0,0,0,0,0,0
	local veh_own_cat = params.vehicle_ownership_category
	if veh_own_cat == 0 or veh_own_cat == 1 or veh_own_cat ==2 then  
		zero_car = 1 
	
	end
	if veh_own_cat == 3 or veh_own_cat == 4 or veh_own_cat == 5  then 
		one_plus_car = 1 
	end
	if veh_own_cat == 5  then 
		two_plus_car = 1 
	end
	
	if veh_own_cat == 5  then 
		three_plus_car = 1 
	end
	if veh_own_cat == 0 or veh_own_cat == 3  then 
		zero_motor = 1 
	end
	if veh_own_cat == 1 or veh_own_cat == 2 or veh_own_cat == 4 or veh_own_cat == 5  then 
		one_plus_motor = 1 
	end
	
	if veh_own_cat == 1 or veh_own_cat == 2 or veh_own_cat == 4 or veh_own_cat == 5  then 
		two_plus_motor = 1 
	end
	
	if veh_own_cat == 1 or veh_own_cat == 2 or veh_own_cat == 4 or veh_own_cat == 5  then 
		three_plus_motor = 1 
	end


	local cost_public_first = {}
	local cost_public_second = {}
	local cost_bus = {}
	local cost_mrt = {}
	local cost_Rail_SMS = {}
	local cost_Rail_SMS_AE_1 = {}
	local cost_Rail_SMS_AE_2 = {}
	local cost_Rail_SMS_AE_avg = {}
	local cost_Rail_SMS_Pool = {}
	local cost_Rail_SMS_AE_Pool_1 = {}
	local cost_Rail_SMS_AE_Pool_2 = {}
	local cost_Rail_SMS_AE_Pool_avg = {}
	local cost_private_bus = {}

	local cost_car_OP_first = {}
	local cost_car_OP_second = {}
	local cost_car_ERP_first = {}
	local cost_car_ERP_second = {}
	local cost_car_parking = {}
	local cost_drive1 = {}
	local cost_share2 = {}
	local cost_share3 = {}
	local cost_motor = {}
	
	local cost_taxi_1 = {}
	local cost_taxi_2 = {}
	local cost_taxi={}

	local cost_SMS_1 = {}
	local cost_SMS_2 = {}
	local cost_SMS={}
	local cost_SMS_Pool_1 = {}
	local cost_SMS_Pool_2 = {}
	local cost_SMS_Pool={}
	
	local d1={}
	local d2={}
	local central_dummy={}

	local cost_over_income_bus = {}
	local cost_over_income_mrt = {}
	local cost_over_income_private_bus = {}
	local cost_over_income_drive1 = {}
	local cost_over_income_share2 = {}
	local cost_over_income_share3 = {}
	local cost_over_income_motor = {}
	local cost_over_income_taxi = {}
	local cost_over_income_SMS = {}
	local cost_over_income_Rail_SMS = {}
	local cost_over_income_SMS_Pool = {}
	local cost_over_income_Rail_SMS_Pool = {}

	local tt_public_ivt_first = {}
	local tt_public_ivt_second = {}
	local tt_public_out_first = {}
	local tt_public_out_second = {}
	local tt_car_ivt_first = {}
	local tt_car_ivt_second = {}

	local tt_bus = {}
	local tt_mrt = {}
	local tt_private_bus = {}
	local tt_drive1 = {}
	local tt_share2 = {}
	local tt_share3 = {}
	local tt_motor = {}
	local tt_walk = {}
	local tt_taxi = {}
	local tt_SMS = {}
	local tt_Rail_SMS = {}
	local tt_SMS_Pool = {}
	local tt_Rail_SMS_Pool = {}

	local average_transfer_number = {}

	local employment = {}
	local population = {}
	local area = {}
	local shop = {}
	


	--local variables for global functions for performance improvement
	local log = math.log
	local exp = math.exp

	for i =1,616 do
		d1[i] = dbparams:walk_distance1(i)
		d2[i] = dbparams:walk_distance2(i)


		--dbparams:cost_public_first(i) = AM[(origin,destination[i])]['pub_cost']
		--dbparams:cost_public_second(i) = PM[(destination[i],origin)]['pub_cost']
		--origin is home, destination(i) is zone from 1 to 24
		--0 if origin == destination
		
				
		cost_public_first[i] = dbparams:cost_public_first(i)
		cost_public_second[i] = dbparams:cost_public_second(i)
		cost_bus[i] = cost_public_first[i] + cost_public_second[i] + cost_increase
		cost_mrt[i] = cost_public_first[i] + cost_public_second[i] + cost_increase
		
		cost_private_bus[i] = cost_public_first[i] + cost_public_second[i] + cost_increase

		--dbparams:cost_car_ERP_first(i) = AM[(origin,destination[i])]['car_cost_erp']
		--dbparams:cost_car_ERP_second(i) = PM[(destination[i],origin)]['car_cost_erp']
		--dbparams:cost_car_OP_first(i) = AM[(origin,destination[i])]['distance']*0.147
		--dbparams:cost_car_OP_second(i) = PM[(destination[i],origin)]['distance']*0.147
		--dbparams:cost_car_parking(i) = 8 * ZONE[destination[i]]['parking_rate']
		--for the above 5 variables, origin is home, destination[i] is tour destination from 1 to 24
		--0 if origin == destination
		cost_drive1[i] = dbparams:cost_car_ERP_first(i)+dbparams:cost_car_ERP_second(i)+dbparams:cost_car_OP_first(i)+dbparams:cost_car_OP_second(i)+dbparams:cost_car_parking(i)+cost_increase
		cost_share2[i] = (dbparams:cost_car_ERP_first(i)+dbparams:cost_car_ERP_second(i)+dbparams:cost_car_OP_first(i)+dbparams:cost_car_OP_second(i)+dbparams:cost_car_parking(i)+cost_increase)/2
		cost_share3[i] = (dbparams:cost_car_ERP_first(i)+dbparams:cost_car_ERP_second(i)+dbparams:cost_car_OP_first(i)+dbparams:cost_car_OP_second(i)+dbparams:cost_car_parking(i)+cost_increase)/3
		cost_motor[i] = 0.5*(dbparams:cost_car_ERP_first(i)+dbparams:cost_car_ERP_second(i)+dbparams:cost_car_OP_first(i)+dbparams:cost_car_OP_second(i))+0.65*dbparams:cost_car_parking(i)+cost_increase
		
		--dbparams:walk_distance1(i)= AM[(origin,destination[i])]['AM2dis']
		--dbparams:walk_distance2(i)= PM[(destination[i],origin)]['PM2dis']
		--dbparams:central_dummy(i)=ZONE[destination[i]]['central_dummy']
		--origin is home mtz, destination[i] is zone from 1 to 24
		--0 if origin == destination
		
		central_dummy[i] = dbparams:central_dummy(i)
		cost_taxi_1[i] = 3.4+((d1[i]*(d1[i]>10 and 1 or 0)-10*(d1[i]>10 and 1 or 0))/0.35+(d1[i]*(d1[i]<=10 and 1 or 0)+10*(d1[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_first(i)+central_dummy[i]*3
		cost_taxi_2[i] = 3.4+((d2[i]*(d2[i]>10 and 1 or 0)-10*(d2[i]>10 and 1 or 0))/0.35+(d2[i]*(d2[i]<=10 and 1 or 0)+10*(d2[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_second(i)+central_dummy[i]*3
		cost_taxi[i] = cost_taxi_1[i] + cost_taxi_2[i] + cost_increase
		
		cost_SMS_1[i] = 3.4+((d1[i]*(d1[i]>10 and 1 or 0)-10*(d1[i]>10 and 1 or 0))/0.35+(d1[i]*(d1[i]<=10 and 1 or 0)+10*(d1[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_first(i)+central_dummy[i]*3
		cost_SMS_2[i] = 3.4+((d2[i]*(d2[i]>10 and 1 or 0)-10*(d2[i]>10 and 1 or 0))/0.35+(d2[i]*(d2[i]<=10 and 1 or 0)+10*(d2[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_second(i)+central_dummy[i]*3
		cost_SMS[i] = (cost_SMS_1[i] + cost_SMS_2[i])*0.6 + cost_increase
		
		cost_SMS_Pool_1[i] = 3.4+((d1[i]*(d1[i]>10 and 1 or 0)-10*(d1[i]>10 and 1 or 0))/0.35+(d1[i]*(d1[i]<=10 and 1 or 0)+10*(d1[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_first(i)+central_dummy[i]*3
		cost_SMS_Pool_2[i] = 3.4+((d2[i]*(d2[i]>10 and 1 or 0)-10*(d2[i]>10 and 1 or 0))/0.35+(d2[i]*(d2[i]<=10 and 1 or 0)+10*(d2[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_second(i)+central_dummy[i]*3
		cost_SMS_Pool[i] = (cost_SMS_Pool_1[i] + cost_SMS_Pool_2[i])*0.6*0.7 + cost_increase
		
		
		local aed = 2.0 -- Access egress distance
		cost_Rail_SMS_AE_1[i] = 3.4+((aed*(aed>10 and 1 or 0)-10*(aed>10 and 1 or 0))/0.35+(aed*(aed<=10 and 1 or 0)+10*(aed>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_first(i) + central_dummy[i]*3
		cost_Rail_SMS_AE_2[i] = 3.4+((aed*(aed>10 and 1 or 0)-10*(aed>10 and 1 or 0))/0.35+(aed*(aed<=10 and 1 or 0)+10*(aed>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_second(i)+central_dummy[i]*3
		cost_Rail_SMS_AE_avg[i] = (cost_Rail_SMS_AE_1[i] + cost_Rail_SMS_AE_2[i])/2
		cost_Rail_SMS[i] = cost_public_first[i] + cost_public_second[i] + cost_increase + cost_Rail_SMS_AE_avg[i] * 2 * 0.6
		
		cost_Rail_SMS_AE_Pool_1[i] = 3.4+((aed*(aed>10 and 1 or 0)-10*(aed>10 and 1 or 0))/0.35+(aed*(aed<=10 and 1 or 0)+10*(aed>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_first(i) + central_dummy[i]*3
		cost_Rail_SMS_AE_Pool_2[i] = 3.4+((aed*(aed>10 and 1 or 0)-10*(aed>10 and 1 or 0))/0.35+(aed*(aed<=10 and 1 or 0)+10*(aed>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_second(i)+central_dummy[i]*3
		cost_Rail_SMS_AE_Pool_avg[i] = (cost_Rail_SMS_AE_Pool_1[i] + cost_Rail_SMS_AE_Pool_2[i])/2
		cost_Rail_SMS_Pool[i] = cost_public_first[i] + cost_public_second[i] + cost_increase + cost_Rail_SMS_AE_Pool_avg[i] * 2 * 0.6*0.7

		
		cost_over_income_bus[i]=30*cost_bus[i]/(0.5+income_mid)
		cost_over_income_mrt[i]=30*cost_mrt[i]/(0.5+income_mid)
		cost_over_income_private_bus[i]=30*cost_private_bus[i]/(0.5+income_mid)
		cost_over_income_drive1[i] = 30 * cost_drive1[i]/(0.5+income_mid)
		cost_over_income_share2[i] = 30 * cost_share2[i]/(0.5+income_mid)
		cost_over_income_share3[i] = 30 * cost_share3[i]/(0.5+income_mid)
		cost_over_income_motor[i]=30*cost_motor[i]/(0.5+income_mid)
		cost_over_income_taxi[i]=30*cost_taxi[i]/(0.5+income_mid)
		cost_over_income_SMS[i]=30*cost_SMS[i]/(0.5+income_mid)
		cost_over_income_Rail_SMS[i]=30*cost_Rail_SMS[i]/(0.5+income_mid)
		cost_over_income_SMS_Pool[i]=30*cost_SMS_Pool[i]/(0.5+income_mid)
		cost_over_income_Rail_SMS_Pool[i]=30*cost_Rail_SMS_Pool[i]/(0.5+income_mid)		
		
		--dbparams:tt_public_ivt_first(i) = AM[(origin,destination[i])]['pub_ivt']
		--dbparams:tt_public_ivt_second(i) = PM[(destination[i],origin)]['pub_ivt']
		--dbparams:tt_public_out_first(i) = AM[(origin,destination[i])]['pub_out']
		--dbparams:tt_public_out_second(i) = PM[(destination[i],origin)]['pub_out']
		--for the above 4 variables, origin is home, destination[i] is zone from 1 to 24
		--0 if origin == destination
		tt_public_ivt_first[i] = dbparams:tt_public_ivt_first(i)
		tt_public_ivt_second[i] = dbparams:tt_public_ivt_second(i)
		tt_public_out_first[i] = dbparams:tt_public_out_first(i)
		tt_public_out_second[i] = dbparams:tt_public_out_second(i)
		--dbparams:tt_car_ivt_first(i) = AM[(origin,destination[i])]['car_ivt']
		--dbparams:tt_car_ivt_second(i) = PM[(destination[i],origin)]['car_ivt']
		tt_car_ivt_first[i] = dbparams:tt_car_ivt_first(i)
		tt_car_ivt_second[i] = dbparams:tt_car_ivt_second(i)
		tt_bus[i] = tt_public_ivt_first[i]+ tt_public_ivt_second[i]+tt_public_out_first[i]+tt_public_out_second[i]
		tt_mrt[i] = tt_public_ivt_first[i]+ tt_public_ivt_second[i]+tt_public_out_first[i]+tt_public_out_second[i]
		tt_private_bus[i] = tt_car_ivt_first[i] + tt_car_ivt_second[i]
		tt_drive1[i] = tt_car_ivt_first[i] + tt_car_ivt_second[i] + 1.0/6
		tt_share2[i] = tt_car_ivt_first[i] + tt_car_ivt_second[i] + 1.0/6
		tt_share3[i] = tt_car_ivt_first[i] + tt_car_ivt_second[i] + 1.0/6
		tt_motor[i] = tt_car_ivt_first[i] + tt_car_ivt_second[i] + 1.0/6
		tt_walk[i] = (d1[i]+d2[i])/5
		tt_taxi[i] = tt_car_ivt_first[i] + tt_car_ivt_second[i] + 1.0/6
		tt_SMS[i] = tt_car_ivt_first[i] + tt_car_ivt_second[i] + 1.0/6
		tt_Rail_SMS[i] = tt_public_ivt_first[i]+ tt_public_ivt_second[i]+(tt_public_out_first[i]+tt_public_out_second[i])/6.0
		tt_SMS_Pool[i] = tt_car_ivt_first[i] + tt_car_ivt_second[i] + 1.0/6 + 1/10+(d1[i]+d2[i])/2/60
		tt_Rail_SMS_Pool[i] = tt_public_ivt_first[i]+ tt_public_ivt_second[i]+(aed+aed)/60+(tt_public_out_first[i]+tt_public_out_second[i])/6.0+1/10

		--dbparams:average_transfer_number(i) = (AM[(origin,destination[i])]['avg_transfer'] + PM[(destination[i],origin)]['avg_transfer'])/2
		--origin is home, destination[i] is zone from 1 to 24
		-- 0 if origin == destination
		average_transfer_number[i] = dbparams:average_transfer_number(i)
		--dbparams:employment(i) = ZONE[i]['employment']
		--dbparams:population(i) = ZONE[i]['population']
		--dbparams:area(i) = ZONE[i]['area']
		--dbparams:shop(i) = ZONE[i]['shop']
		employment[i] = dbparams:employment(i)
		population[i] = dbparams:population(i)
		area[i] = dbparams:area(i)
		shop[i] = dbparams:shop(i)
	end

	local V_counter = 0

	--utility function for bus 1-24
	for i =1,616 do
		V_counter = V_counter + 1
		utility[V_counter] = beta_cons_bus + cost_over_income_bus[i] * (1- missing_income) * beta_cost_bus_mrt_1 + cost_bus[i] * beta_cost_bus_mrt_2 + tt_bus[i] * beta_tt_bus_mrt + beta_central_bus_mrt * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_bus_mrt + beta_female_bus * female_dummy + beta_zero_bus* zero_car + beta_oneplus_bus* one_plus_car+ beta_twoplus_bus* two_plus_car
	end

	--utility function for mrt 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_mrt + cost_over_income_mrt[i] * (1- missing_income) * beta_cost_bus_mrt_1 + cost_mrt[i] * beta_cost_bus_mrt_2 + tt_mrt[i] * beta_tt_bus_mrt + beta_central_bus_mrt * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_bus_mrt + beta_female_mrt * female_dummy + beta_zero_mrt*zero_car+ beta_oneplus_mrt*one_plus_car+beta_twoplus_mrt*two_plus_car
	end
	
	--utility function for private bus 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_private_bus + cost_over_income_private_bus[i] * (1- missing_income) * beta_cost_private_bus_1 + cost_private_bus[i] * beta_cost_bus_mrt_2 + tt_private_bus[i] * beta_tt_private_bus + beta_central_private_bus * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_private_bus + beta_female_private_bus * female_dummy + beta_zero_privatebus*zero_car+beta_oneplus_privatebus*one_plus_car+beta_twoplus_privatebus*two_plus_car
	end


	--utility function for drive1 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_drive1 + cost_over_income_drive1[i] * (1 - missing_income) * beta_cost_drive1_1 + cost_drive1[i] * beta_cost_bus_mrt_2 + tt_drive1[i] * beta_tt_drive1 + beta_central_drive1 * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_drive1 + beta_zero_drive1 *zero_car + beta_oneplus_drive1 * one_plus_car + beta_twoplus_drive1 * two_plus_car + beta_threeplus_drive1 * three_plus_car + beta_female_drive1 * female_dummy
	end

	--utility function for share2 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_share2 + cost_over_income_share2[i] * (1 - missing_income) * beta_cost_share2_1 + cost_share2[i] * beta_cost_bus_mrt_2 + tt_share2[i] * beta_tt_share2 + beta_central_share2 * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_share2 + beta_zero_share2 *zero_car + beta_oneplus_share2 * one_plus_car + beta_twoplus_share2 * two_plus_car + beta_threeplus_share2 * three_plus_car + beta_female_share2 * female_dummy
	end

	--utility function for share3 1-24
	for i=1,616 do	
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_share3 + cost_over_income_share3[i] * (1 - missing_income) * beta_cost_share3_1 + cost_share3[i] * beta_cost_bus_mrt_2 + tt_share3[i] * beta_tt_share3 + beta_central_share3 * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_share3 + beta_zero_share3 *zero_car + beta_oneplus_share3 * one_plus_car + beta_twoplus_share3 * two_plus_car + beta_threeplus_share3 * three_plus_car + beta_female_share3 * female_dummy
	end

	--utility function for motor 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_motor + cost_over_income_motor[i] * (1 - missing_income) * beta_cost_motor_1 + cost_motor[i] * beta_cost_bus_mrt_2 + tt_motor[i] * beta_tt_motor + beta_central_motor * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_motor + beta_zero_motor *zero_motor + beta_oneplus_motor * one_plus_motor + beta_twoplus_motor * two_plus_motor + beta_threeplus_motor * three_plus_motor + beta_female_motor * female_dummy + beta_zero_car_motor*zero_car+beta_oneplus_car_motor*one_plus_car+ beta_twoplus_car_motor*two_plus_car
	end

	--utility function for walk 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_walk + tt_walk[i] * beta_tt_walk + beta_central_walk * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_walk + beta_female_walk * female_dummy + beta_zero_walk*zero_car + beta_oneplus_walk*one_plus_car+beta_twoplus_walk*two_plus_car
	end

	--utility function for taxi 1-24
	--for i=1,24 do
	--	V_counter = V_counter +1
	--	utility[V_counter] = beta_cons_taxi + cost_over_income_taxi[i] * (1-missing_income)* beta_cost_taxi_1 + cost_taxi[i]* beta_cost_bus_mrt_2 + tt_taxi[i] * beta_tt_taxi + beta_central_taxi * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_taxi + beta_female_taxi * female_dummy + beta_zero_taxi*zero_car+beta_oneplus_taxi*one_plus_car+beta_twoplus_taxi*two_plus_car
	--end
	
	--utility function for SMS 1-24
	--for i=1,24 do
	--	V_counter = V_counter +1
	--	utility[V_counter] = beta_cons_SMS + cost_over_income_SMS[i] * (1-missing_income)* beta_cost_SMS_1 + cost_SMS[i]* beta_cost_SMS_2 + tt_SMS[i] * beta_tt_SMS + beta_central_SMS * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_SMS + beta_female_SMS * female_dummy + beta_zero_SMS*zero_car+beta_oneplus_SMS*one_plus_car+beta_twoplus_SMS*two_plus_car
	--end

	--utility function for Rail_SMS 1-24
	--for i=1,24 do
	--	V_counter = V_counter +1
	--	utility[V_counter] = beta_cons_Rail_SMS + cost_over_income_Rail_SMS[i] * (1- missing_income) * beta_cost_Rail_SMS_1 + cost_Rail_SMS[i] * beta_cost_Rail_SMS_2 + tt_Rail_SMS[i] * beta_tt_Rail_SMS + beta_central_Rail_SMS * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_Rail_SMS + beta_female_Rail_SMS * female_dummy + beta_zero_Rail_SMS*zero_car+ beta_oneplus_Rail_SMS*one_plus_car+beta_twoplus_Rail_SMS*two_plus_car
	--end
		--utility function for SMS_Pool 1-24
	--for i=1,24 do
	--	V_counter = V_counter +1
	--	utility[V_counter] = beta_cons_SMS_Pool + cost_over_income_SMS_Pool[i] * (1-missing_income)* beta_cost_SMS_Pool_1 + cost_SMS_Pool[i]* beta_cost_SMS_Pool_2 + tt_SMS[i] * beta_tt_SMS_Pool + beta_central_SMS_Pool * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_SMS_Pool + beta_female_SMS_Pool * female_dummy + beta_zero_SMS_Pool*zero_car+beta_oneplus_SMS_Pool*one_plus_car+beta_twoplus_SMS_Pool*two_plus_car
	--end

	--utility function for Rail_SMS_Pool 1-24
	--for i=1,24 do
	--	V_counter = V_counter +1
	--	utility[V_counter] = beta_cons_Rail_SMS_Pool + cost_over_income_Rail_SMS_Pool[i] * (1- missing_income) * beta_cost_Rail_SMS_Pool_1 + cost_Rail_SMS_Pool[i] * beta_cost_Rail_SMS_Pool_2 + tt_Rail_SMS_Pool[i] * beta_tt_Rail_SMS_Pool + beta_central_Rail_SMS_Pool * central_dummy[i] + beta_log * log(exp(beta_area)*area[i]+exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_Rail_SMS_Pool + beta_female_Rail_SMS_Pool * female_dummy + beta_zero_Rail_SMS_Pool*zero_car+ beta_oneplus_Rail_SMS_Pool*one_plus_car+beta_twoplus_Rail_SMS_Pool*two_plus_car
	--end
end


--availability
--the logic to determine availability is the same with current implementation
local availability = {}
local function computeAvailabilities(params,dbparams)
	for i = 1, 616*8 do 
		availability[i] = dbparams:availability(i)
	end
end

--scale
local scale = 1 --for all choices

-- function to call from C++ preday simulator
-- params and dbparams tables contain data passed from C++
-- to check variable bindings in params or dbparams, refer PredayLuaModel::mapClasses() function in dev/Basic/medium/behavioral/lua/PredayLuaModel.cpp
function choose_tmdo(params,dbparams)
	computeUtilities(params,dbparams) 
	computeAvailabilities(params,dbparams)
	local probability = calculate_probability("mnl", choice, utility, availability, scale)
	return make_final_choice(probability)
end

-- function to call from C++ preday simulator for logsum computation
-- params and dbparams tables contain data passed from C++
-- to check variable bindings in params or dbparams, refer PredayLuaModel::mapClasses() function in dev/Basic/medium/behavioral/lua/PredayLuaModel.cpp
function compute_logsum_tmdo(params,dbparams)
	computeUtilities(params,dbparams) 
	computeAvailabilities(params,dbparams)
	return compute_mnl_logsum(utility, availability)
end

