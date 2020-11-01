cv = dbOpenCellViewByType("PHYSICS_TAPEOUT_2020_Wassim" "physics_trial_series_SKILL_Test" "schematic" "" "a")

;<---------------------------------------------------------Place & Route DCD Components----------------------------------------------------------------------------------------------------->
for(i 1 72 ; # of columns
for(j 0 76 ; # of columns if 0-1 then 4 columns in total, 2 diodes, and 2 capacitors
x = 1*i*2
y = -1*j*2

ifStatementDecisionMod2		= mod(i, 2)
ifStatementDecisionMod24_1 	= mod(i, 23)
ifStatementDecisionMod24 	= mod(i, 24)

;<---------------------------------------------------------Place & Route First DCD Component in Even Rows---------------------------------------------------------------------------->

if(j == 0 && (ifStatementDecisionMod2 != 0 || ifStatementDecisionMod24 == 0 ) then
dbCreateParamInstByMasterName(cv "Sealring" "DCD_Unit_Series" "symbol"  symbolToString(gensym("i")) x:y "R0" 1 ) ; Place the even DCD Component design

xa = 0.75 + x;
ya = -2.875 + y;
xb = 0.75 + x;
yb = -0.6875 + y;
WireCapConnection = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = x;
ya = -1.375 + y;
xb = x;
yb = -2.0 + y;
WireBottomToTopConnection = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

else

;<---------------------------------------------------------Place & Route Not First DCD Component in Odd Rows---------------------------------------------------------------------------->

if( ifStatementDecisionMod2 != 0 && j != 0 then
dbCreateParamInstByMasterName(cv "Sealring" "DCD_Unit_Series_One_N_One" "symbol"  symbolToString(gensym("i")) x:y "R0" 1 ) ; Place the odd DCD Component design
else

;<---------------------------------------------------------Choose which DCD Component to Place Depending on its Position in the Row------------------------------------------------------>
if( j != 0 then
dbCreateParamInstByMasterName(cv "Sealring" "DCD_Unit_Series_One_N_One" "symbolFlipped"  symbolToString(gensym("i")) x:y "R0" 1 )
else
dbCreateParamInstByMasterName(cv "Sealring" "DCD_Unit_Series_One_N_One_Flipped" "symbolFlipped"  symbolToString(gensym("i")) x:y "R0" 1 )
)
)
xa = 0.75 + x;
ya = -2.875 + y;
xb = 0.75 + x;
yb = -0.875 + y;
WireCapConnection = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = x;
ya = -1.75 + y;
xb = x;
yb = -2.0 + y;
WireBottomToTopConnection = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

;<---------------------------------------------------------Route the Entire Row---------------------------------------------------------------------------->
if( j == 0 then

xa = 0.75 + x;
ya = 0.375;
xb = 0.75 + x + 2;
yb = 0.375;
WireBottomToTopConnection = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = 0.75 + x + 2;
ya = -0.6875;
xb = 0.75 + x + 2;
yb = 0.375;
WireBottomToTopConnection = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = 0.75 + x;
ya = -0.875;
xb = 0.75 + x;
yb = 0.375;
WireBottomToTopConnection = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = x;
ya = 0;
xb = x+2;
yb = 0;
WireBottomToTopConnection = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = x - 2;
ya = -154;
xb = x;
yb = -154;
WireBottomToTopConnection = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = 0.75 + x - 2;
ya = -154.875;
xb = 0.75 + x ;
yb = -154.875;
WireBottomToTopConnection = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

)
)


)
)

;<------------------------------------------------------------Save Schematic------------------------------------------------------------------------>

dbSave(cv "PHYSICS_TAPEOUT_2020_Wassim" "physics_trial_series_SKILL_Test" "schematic" "" "a")
dbClose(cv)
