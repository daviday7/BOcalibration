--[[
Model - Mode/destination choice for shopping tour
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
local beta_cost_drive1_1 = -2.321514e+00
local beta_cost_share2_1 = -4.812179e+00
local beta_cost_share3_1 = -4.225758e+00
local beta_cost_motor_1 = -1.153170e+00
local beta_cost_taxi_1 =  0.000000e+00
local beta_cost_SMS_1 =  0.000000e+00
local beta_cost_Rail_SMS_1 =  0.000000e+00
local beta_cost_SMS_Pool_1 =  0.000000e+00
local beta_cost_Rail_SMS_Pool_1 =  0.000000e+00

local beta_cost_bus_mrt_2 =  0.000000e+00
local beta_cost_private_bus_2 = -9.990000e+02
local beta_cost_drive1_2 = -1.530977e+00
local beta_cost_share2_2 = -5.355932e+00
local beta_cost_share3_2 = -2.875487e+00
local beta_cost_motor_2 =  1.037284e+00
local beta_cost_taxi_2 = -1.130000e-01
local beta_cost_SMS_2 = -1.130000e-01
local beta_cost_Rail_SMS_2 = -2.940000e-01
local beta_cost_SMS_Pool_2 = -1.130000e-01
local beta_cost_Rail_SMS_Pool_2 = -2.940000e-01

local beta_tt_bus_mrt = -1.319679e-01
local beta_tt_private_bus = -9.990000e+02
local beta_tt_drive1 = -6.021383e+00
local beta_tt_share2 = -7.000000e+00
local beta_tt_share3 = -8.253835e+00
local beta_tt_motor =  1.253490e-01
local beta_tt_walk = -6.652438e+00
local beta_tt_taxi = -3.330000e+00
local beta_tt_SMS = -3.330000e+00
local beta_tt_Rail_SMS = -2.780000e+00
local beta_tt_SMS_Pool = -3.330000e+00
local beta_tt_Rail_SMS_Pool = -2.780000e+00

local beta_log =  8.139052e-01
local beta_area =  4.668753e+00
local beta_population = -5.559749e+00

local beta_central_bus_mrt =  1.456391e+00
local beta_central_private_bus = -9.990000e+02
local beta_central_drive1 = -1.406318e+00
local beta_central_share2 = -1.346498e+00
local beta_central_share3 = -6.099857e-01
local beta_central_motor = -4.786385e-01
local beta_central_walk = -2.106254e+00
local beta_central_taxi =  1.920000e+00
local beta_central_SMS =  1.920000e+00
local beta_central_Rail_SMS = -1.780000e-01
local beta_central_SMS_Pool =  1.920000e+00
local beta_central_Rail_SMS_Pool = -1.780000e-01

local beta_distance_bus_mrt = -1.189785e+00
local beta_distance_private_bus = -9.990000e+02
local beta_distance_drive1 = -1.780249e+00
local beta_distance_share2 = -1.133787e-02
local beta_distance_share3 = -2.498802e+00
local beta_distance_motor = -3.457425e-02
local beta_distance_walk = -2.938808e+00
local beta_distance_taxi =  0.000000e+00
local beta_distance_SMS =  0.000000e+00
local beta_distance_Rail_SMS =  9.110000e-03
local beta_distance_SMS_Pool =  0.000000e+00
local beta_distance_Rail_SMS_Pool =  9.110000e-03

local beta_cons_bus =  4.803659e-01
local beta_cons_mrt = -3.657890e+00
local beta_cons_private_bus = -9.990000e+02
local beta_cons_drive1 = -1.581867e+00
local beta_cons_share2 = -6.759739e+00
local beta_cons_share3 = -5.419591e+00
local beta_cons_motor =  3.409148e-01
local beta_cons_walk = -7.674160e+00
local beta_cons_taxi = -1.515800e+01
local beta_cons_SMS = -1.000000e+01
local beta_cons_Rail_SMS = -1.727200e+01
local beta_cons_SMS_Pool = -1.700000e+01
local beta_cons_Rail_SMS_Pool = -1.700000e+01

local beta_zero_bus = -1.548317e+00
local beta_oneplus_bus = -7.020197e-01
local beta_twoplus_bus = -3.954946e-01
local beta_threeplus_bus = -1.999148e+00

local beta_zero_mrt = -1.109245e-01
local beta_oneplus_mrt =  8.628726e-01
local beta_twoplus_mrt = -2.096412e+00
local beta_threeplus_mrt = -1.975451e+00

local beta_zero_privatebus =  1.000000e+00
local beta_oneplus_privatebus =  8.620000e-02
local beta_twoplus_privatebus =  0.000000e+00
local beta_threeplus_privatebus =  0.000000e+00

local beta_zero_drive1 = -1.521684e+00
local beta_oneplus_drive1 = -1.139088e+00
local beta_twoplus_drive1 =  1.566790e-01
local beta_threeplus_drive1 = -8.713492e-01

local beta_zero_share2 =  2.000000e+00
local beta_oneplus_share2 =  3.716892e+00
local beta_twoplus_share2 =  6.477589e-01
local beta_threeplus_share2 =  1.058727e+00

local beta_zero_share3 =  1.776017e+00
local beta_oneplus_share3 =  2.445034e+00
local beta_twoplus_share3 = -9.765191e-01
local beta_threeplus_share3 =  4.837306e-01

local beta_zero_car_motor =  4.621385e-01
local beta_oneplus_car_motor = -1.453431e+00
local beta_twoplus_car_motor = -1.047600e+00
local beta_threeplus_car_motor =  2.230139e-01

local beta_zero_walk =  5.340918e-01
local beta_oneplus_walk = -1.596868e+00
local beta_twoplus_walk = -2.462943e-01
local beta_threeplus_walk = -1.612911e+00

local beta_zero_taxi =  0.000000e+00
local beta_oneplus_taxi = -6.550000e-02
local beta_twoplus_taxi =  0.000000e+00
local beta_threeplus_taxi =  0.000000e+00

local beta_zero_motor =  8.649309e-01
local beta_oneplus_motor =  5.847377e-01
local beta_twoplus_motor =  4.543590e+00
local beta_threeplus_motor = -4.731927e-01

local beta_zero_SMS =  0.000000e+00
local beta_oneplus_SMS = -6.550000e-02
local beta_twoplus_SMS =  0.000000e+00
local beta_threeplus_SMS =  0.000000e+00

local beta_zero_Rail_SMS =  0.000000e+00
local beta_oneplus_Rail_SMS =  6.480000e-01
local beta_twoplus_Rail_SMS = -2.550000e+00
local beta_threeplus_Rail_SMS =  0.000000e+00

local beta_zero_SMS_Pool =  0.000000e+00
local beta_oneplus_SMS_Pool = -6.550000e-02
local beta_twoplus_SMS_Pool =  0.000000e+00
local beta_threeplus_SMS_Pool =  0.000000e+00

local beta_zero_Rail_SMS_Pool =  0.000000e+00
local beta_oneplus_Rail_SMS_Pool =  6.480000e-01
local beta_twoplus_Rail_SMS_Pool = -2.550000e+00
local beta_threeplus_Rail_SMS_Pool =  0.000000e+00

local beta_female_bus =  4.217501e-01
local beta_female_mrt =  8.832800e-01
local beta_female_private_bus = -4.370000e-01
local beta_female_drive1 =  7.356006e-01
local beta_female_share2 = -3.032393e-01
local beta_female_share3 = -1.619726e+00
local beta_female_motor = -1.730920e+00
local beta_female_taxi =  4.040000e-01
local beta_female_SMS =  4.040000e-01
local beta_female_Rail_SMS =  0.000000e+00
local beta_female_walk =  8.523627e-01
local beta_female_SMS_Pool =  4.040000e-01
local beta_female_Rail_SMS_Pool =  0.000000e+00

--choice set
local choice = {}

for i = 1, 616*8 do
	choice[i] = i
end

--utility
-- 1 for public bus; 2 for MRT/LRT; 3 for private bus; 4 for drive1;
-- 5 for shared2; 6 for shared3+; 7 for motor; 8 for walk; 9 for taxi
-- 10 for SMS,
local utility = {}
local function computeUtilities(params,dbparams)
	local cost_increase = dbparams.cost_increase
	local female_dummy = params.female_dummy
	local income_id = params.income_id
	local income_cat = {500,1250,1750,2250,2750,3500,4500,5500,6500,7500,8500,0,99999,99999}
	local income_mid = income_cat[income_id]
	local missing_income = (params.income_id >= 13) and 1 or 0 -- Vishnu 14th April 2016- Changed from the previous value of 12

	local zero_car,one_plus_car,two_plus_car,three_plus_car, zero_motor,one_plus_motor,two_plus_motor,three_plus_motor = 0,0,0,0,0,0,0,0
	local veh_own_cat = params.vehicle_ownership_category
	if veh_own_cat == 0 or veh_own_cat == 1 or veh_own_cat == 2 then
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



	for i =1,616 do
		d1[i] = dbparams:walk_distance1(i)
		d2[i] = dbparams:walk_distance2(i)
		--dbparams:cost_public_first(i) = AM[(origin,destination[i])]['pub_cost']
		--dbparams:cost_public_second(i) = PM[(destination[i],origin)]['pub_cost']
		--origin is home, destination[i] is zone from 1 to 24

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

		cost_taxi_1[i] = 3.4+((d1[i]*(d1[i]>10 and 1 or 0)-10*(d1[i]>10 and 1 or 0))/0.35+(d1[i]*(d1[i]<=10 and 1 or 0)+10*(d1[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_first(i) + central_dummy[i]*3
		cost_taxi_2[i] = 3.4+((d2[i]*(d2[i]>10 and 1 or 0)-10*(d2[i]>10 and 1 or 0))/0.35+(d2[i]*(d2[i]<=10 and 1 or 0)+10*(d2[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_second(i) + central_dummy[i]*3
		cost_taxi[i] = cost_taxi_1[i] + cost_taxi_2[i] + cost_increase

		cost_SMS_1[i] = 3.4+((d1[i]*(d1[i]>10 and 1 or 0)-10*(d1[i]>10 and 1 or 0))/0.35+(d1[i]*(d1[i]<=10 and 1 or 0)+10*(d1[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_first(i)+central_dummy[i]*3
		cost_SMS_2[i] = 3.4+((d2[i]*(d2[i]>10 and 1 or 0)-10*(d2[i]>10 and 1 or 0))/0.35+(d2[i]*(d2[i]<=10 and 1 or 0)+10*(d2[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_second(i)+central_dummy[i]*3
		cost_SMS[i] = (cost_SMS_1[i] + cost_SMS_2[i])*0.72 + cost_increase

		cost_SMS_Pool_1[i] = 3.4+((d1[i]*(d1[i]>10 and 1 or 0)-10*(d1[i]>10 and 1 or 0))/0.35+(d1[i]*(d1[i]<=10 and 1 or 0)+10*(d1[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_first(i)+central_dummy[i]*3
		cost_SMS_Pool_2[i] = 3.4+((d2[i]*(d2[i]>10 and 1 or 0)-10*(d2[i]>10 and 1 or 0))/0.35+(d2[i]*(d2[i]<=10 and 1 or 0)+10*(d2[i]>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_second(i)+central_dummy[i]*3
		cost_SMS_Pool[i] = (cost_SMS_Pool_1[i] + cost_SMS_Pool_2[i])*0.72*0.7 + cost_increase


		local aed = 2.0 -- Access egress distance
		cost_Rail_SMS_AE_1[i] = 3.4+((aed*(aed>10 and 1 or 0)-10*(aed>10 and 1 or 0))/0.35+(aed*(aed<=10 and 1 or 0)+10*(aed>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_first(i) + central_dummy[i]*3
		cost_Rail_SMS_AE_2[i] = 3.4+((aed*(aed>10 and 1 or 0)-10*(aed>10 and 1 or 0))/0.35+(aed*(aed<=10 and 1 or 0)+10*(aed>10 and 1 or 0))/0.4)*0.22 + dbparams:cost_car_ERP_second(i) + central_dummy[i]*3
		cost_Rail_SMS_AE_avg[i] = (cost_Rail_SMS_AE_1[i] + cost_Rail_SMS_AE_2[i])/2.0
		cost_Rail_SMS[i] = cost_public_first[i] + cost_public_second[i] + cost_increase + cost_Rail_SMS_AE_avg[i] * 2 * 0.72

		cost_Rail_SMS_AE_Pool_1[i] = 3.4+((aed*(aed>10 and 1 or 0)-10*(aed>10 and 1 or 0))/0.35+(aed*(aed<=10 and 1 or 0)+10*(aed>10 and 1 or 0))/0.4)*0.22+ dbparams:cost_car_ERP_first(i) + central_dummy[i]*3
		cost_Rail_SMS_AE_Pool_2[i] = 3.4+((aed*(aed>10 and 1 or 0)-10*(aed>10 and 1 or 0))/0.35+(aed*(aed<=10 and 1 or 0)+10*(aed>10 and 1 or 0))/0.4)*0.22 + dbparams:cost_car_ERP_second(i) + central_dummy[i]*3
		cost_Rail_SMS_AE_Pool_avg[i] = (cost_Rail_SMS_AE_Pool_1[i] + cost_Rail_SMS_AE_Pool_2[i])/2.0
		cost_Rail_SMS_Pool[i] = cost_public_first[i] + cost_public_second[i] + cost_increase + cost_Rail_SMS_AE_avg[i] * 2 * 0.72 *0.7

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
		tt_Rail_SMS[i] = tt_public_ivt_first[i]+ tt_public_ivt_second[i]+(tt_public_out_first[i]+tt_public_out_second[i])/6
		tt_SMS_Pool[i] = tt_car_ivt_first[i] + tt_car_ivt_second[i]+1.0/6 + 1/10+(d1[i]+d2[i])/2/60 + 1.0/6
		tt_Rail_SMS_Pool[i] = tt_public_ivt_first[i]+ tt_public_ivt_second[i]+(tt_public_out_first[i]+tt_public_out_second[i])/6 +(aed+aed)/60+1/10

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
		utility[V_counter] = beta_cons_bus + cost_over_income_bus[i] * (1- missing_income) * beta_cost_bus_mrt_1 + cost_bus[i] * beta_cost_bus_mrt_2 + tt_bus[i] * beta_tt_bus_mrt + beta_central_bus_mrt * central_dummy[i] + beta_log * math.log(shop[i]+math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_bus_mrt + beta_female_bus * female_dummy + beta_zero_bus* zero_car + beta_oneplus_bus* one_plus_car+ beta_twoplus_bus* two_plus_car
	end

	--utility function for mrt 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_mrt + cost_over_income_mrt[i] * (1- missing_income) * beta_cost_bus_mrt_1 + cost_mrt[i] * beta_cost_bus_mrt_2 + tt_mrt[i] * beta_tt_bus_mrt + beta_central_bus_mrt * central_dummy[i] + beta_log * math.log(shop[i]+math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_bus_mrt + beta_female_mrt * female_dummy + beta_zero_mrt*zero_car+ beta_oneplus_mrt*one_plus_car+beta_twoplus_mrt*two_plus_car
	end


	--utility function for private bus 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_private_bus + cost_over_income_private_bus[i] * (1- missing_income) * beta_cost_private_bus_2 + cost_private_bus[i] * beta_cost_private_bus_2 + tt_private_bus[i] * beta_tt_bus_mrt + beta_central_private_bus * central_dummy[i] + beta_log * math.log(shop[i]+math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_private_bus + beta_female_private_bus * female_dummy + beta_zero_privatebus*zero_car+beta_oneplus_privatebus*one_plus_car+beta_twoplus_privatebus*two_plus_car
	end


	--utility function for drive1 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_drive1 + cost_over_income_drive1[i] * (1 - missing_income) * beta_cost_drive1_1 + cost_drive1[i] * beta_cost_drive1_2 + tt_drive1[i] * beta_tt_drive1 + beta_central_drive1 * central_dummy[i] + beta_log * math.log(shop[i]+math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_drive1 + beta_zero_drive1 *zero_car + beta_oneplus_drive1 * one_plus_car + beta_twoplus_drive1 * two_plus_car + beta_threeplus_drive1 * three_plus_car + beta_female_drive1 * female_dummy
	end

	--utility function for share2 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_share2 + cost_over_income_share2[i] * (1 - missing_income) * beta_cost_share2_1 + cost_share2[i] * beta_cost_share2_2 + tt_share2[i] * beta_tt_share2 + beta_central_share2 * central_dummy[i] + beta_log * math.log(shop[i]+math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_share2 + beta_zero_share2 *zero_car + beta_oneplus_share2 * one_plus_car + beta_twoplus_share2 * two_plus_car + beta_threeplus_share2 * three_plus_car + beta_female_share2 * female_dummy
	end

	--utility function for share3 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_share3 + cost_over_income_share3[i] * (1 - missing_income) * beta_cost_share3_1 + cost_share3[i] * beta_cost_share2_2 + tt_share3[i] * beta_tt_share3 + beta_central_share3 * central_dummy[i] + beta_log * math.log(shop[i]+math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_share3 + beta_zero_share3 *zero_car + beta_oneplus_share3 * one_plus_car + beta_twoplus_share3 * two_plus_car + beta_threeplus_share3 * three_plus_car + beta_female_share3 * female_dummy
	end

	--utility function for motor 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_motor + cost_over_income_motor[i] * (1 - missing_income) * beta_cost_motor_1 + cost_motor[i] * beta_cost_motor_2 + tt_motor[i] * beta_tt_drive1 + beta_central_motor * central_dummy[i] + beta_log * math.log(shop[i]+math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_motor + beta_zero_motor *zero_motor + beta_oneplus_motor * one_plus_motor + beta_twoplus_motor * two_plus_motor + beta_threeplus_motor * three_plus_motor + beta_female_motor * female_dummy + beta_zero_car_motor*zero_car+beta_oneplus_car_motor*one_plus_car+ beta_twoplus_car_motor*two_plus_car
	end

	--utility function for walk 1-24
	for i=1,616 do
		V_counter = V_counter +1
		utility[V_counter] = beta_cons_walk + tt_walk[i] * beta_tt_walk + beta_central_walk * central_dummy[i] + beta_log * math.log(shop[i]+math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i] + 1) + (d1[i]+d2[i]) * beta_distance_walk + beta_female_walk * female_dummy + beta_zero_walk*zero_car + beta_oneplus_walk*one_plus_car+beta_twoplus_walk*two_plus_car
	end

	--utility function for taxi 1-24
	--for i=1,24 do
	--	V_counter = V_counter +1
	--	utility[V_counter] = beta_cons_taxi + cost_over_income_taxi[i] * (1-missing_income)* beta_cost_taxi_1 + cost_taxi[i]* beta_cost_taxi_2 + tt_taxi[i] * beta_tt_taxi + beta_central_taxi * central_dummy[i] + beta_log * math.log(shop[i]+math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_taxi + beta_female_taxi * female_dummy + beta_zero_taxi*zero_car+beta_oneplus_taxi*one_plus_car+beta_twoplus_taxi*two_plus_car
	--end

	--utility function for SMS 1-24
	--for i=1,24 do
	--	V_counter = V_counter +1
	--	utility[V_counter] = beta_cons_SMS + cost_over_income_SMS[i] * (-missing_income)* beta_cost_SMS_1 + cost_SMS[i]* beta_cost_bus_mrt_2 + tt_SMS[i] * beta_tt_SMS + beta_central_SMS * central_dummy[i] + beta_log * math.log(math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_SMS + beta_female_SMS * female_dummy + beta_zero_SMS*zero_car+beta_oneplus_SMS*one_plus_car+beta_twoplus_SMS*two_plus_car
	--end

	--utility function for Rail_SMS 1-24
	--for i=1,24 do
	--	V_counter = V_counter +1
	--	utility[V_counter] = beta_cons_Rail_SMS + cost_over_income_Rail_SMS[i] * (1- missing_income) * beta_cost_Rail_SMS_1 + cost_Rail_SMS[i] * beta_cost_Rail_SMS_2 + tt_Rail_SMS[i] * beta_tt_Rail_SMS + beta_central_Rail_SMS * central_dummy[i] + beta_log * math.log(math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_Rail_SMS + beta_female_Rail_SMS * female_dummy + beta_zero_Rail_SMS*zero_car+ beta_oneplus_Rail_SMS*one_plus_car+beta_twoplus_Rail_SMS*two_plus_car
	--end

	--utility function for SMS_Pool 1-24
	--for i=1,24 do
	--	V_counter = V_counter +1
	--	utility[V_counter] = beta_cons_SMS_Pool + cost_over_income_SMS_Pool[i] * (-missing_income)* beta_cost_SMS_Pool_1 + cost_SMS_Pool[i]* beta_cost_bus_mrt_2 + tt_SMS_Pool[i] * beta_tt_SMS_Pool + beta_central_SMS_Pool * central_dummy[i] + beta_log * math.log(math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_SMS_Pool + beta_female_SMS_Pool * female_dummy + beta_zero_SMS_Pool*zero_car+beta_oneplus_SMS_Pool*one_plus_car+beta_twoplus_SMS_Pool*two_plus_car
	--end

	--utility function for Rail_SMS_Pool 1-24
	--for i=1,24 do
	--	V_counter = V_counter +1
	--	utility[V_counter] = beta_cons_Rail_SMS_Pool + cost_over_income_Rail_SMS_Pool[i] * (1- missing_income) * beta_cost_Rail_SMS_Pool_1 + cost_Rail_SMS_Pool[i] * beta_cost_Rail_SMS_Pool_2 + tt_Rail_SMS_Pool[i] * beta_tt_Rail_SMS_Pool + beta_central_Rail_SMS_Pool * central_dummy[i] + beta_log * math.log(math.exp(beta_area)*area[i]+math.exp(beta_population)*population[i]) + (d1[i]+d2[i]) * beta_distance_Rail_SMS_Pool + beta_female_Rail_SMS_Pool * female_dummy + beta_zero_Rail_SMS_Pool*zero_car+ beta_oneplus_Rail_SMS_Pool*one_plus_car+beta_twoplus_Rail_SMS_Pool*two_plus_car
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
function choose_tmds(params,dbparams)
	computeUtilities(params,dbparams) 
	computeAvailabilities(params,dbparams)
	local probability = calculate_probability("mnl", choice, utility, availability, scale)
	return make_final_choice(probability)
end

-- function to call from C++ preday simulator for logsums computation
-- params and dbparams tables contain data passed from C++
-- to check variable bindings in params or dbparams, refer PredayLuaModel::mapClasses() function in dev/Basic/medium/behavioral/lua/PredayLuaModel.cpp
function compute_logsum_tmds(params,dbparams)
	computeUtilities(params,dbparams) 
	computeAvailabilities(params,dbparams)
	return compute_mnl_logsum(utility, availability)
end

