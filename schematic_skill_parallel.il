cv = dbOpenCellViewByType("PHYSICS_TAPEOUT_2020_Wassim" "physics_trial_SKILL_Test" "schematic" "" "a")

;<---------------------------------------------------------Place & Route DCD Components----------------------------------------------------------------------------------------------------->
for(i 0 140 
for(j 0 55
x = i*2
y = j*2
dbCreateParamInstByMasterName(cv "tsmc18" "dioden" "symbol"  symbolToString(gensym("i")) y:x "MXR90" 1 ) 

ifStatementDecision = mod(j 2)

;<---------------------------------------------------------Place & Route DCD Components in Even Rows---------------------------------------------------------------------------->
if( ifStatementDecision == 0 then

xa = 0.4375 + j*2;
ya = 0.0 + i*2;
xb = 0.4375 + j*2;
yb = 1.0 + i*2;
WireInnerConnection1 = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = 0.0 + j*2;
ya = 0.0 + i*2;
xb = 0.4375 + j*2;
yb = 0.0 + i*2;
WireInnerConnection1 = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = 0.4375 + j*2;
ya = 0.0 + i*2;
xb = 1.625 + j*2;
yb = 0 + i*2;
WireInnerConnection1 = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = 2.0 + j*2;
ya = 0.0 + i*2;
xb = 2.0 + j*2;
yb = 2.0 + i*2;
WireDiodeInput1 = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = -0.375 + j*2;
ya = 0.0 + i*2;
xb = -0.375 + j*2;
yb = 2.0 + i*2;
WireDiodeOutput1 = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = 1.5 + j*2;
ya = 1.0 + i*2;
xb = 1.5 + j*2;
yb = 3.0 + i*2;
WireCapTop1 = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = 0.4375 + j*2;
ya = 1.0 + i*2;
xb = 0.625 + j*2;
yb = 1.0 + i*2;
WireInnerConnection2 = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

xa = 1.0 + j*2;
ya = 1.0 + i*2;
xb = 1.5 + j*2;
yb = 1.0 + i*2;
WireCapTop1 = schCreateWire(cv "route" "full" list(xa:ya xb:yb) 0.5 0.5 0.0)

else
x = i*2+1
y = j*2-1
dbCreateParamInstByMasterName(cv "tsmc18" "mimcap_2p0_sin" "symbol"  symbolToString(gensym("i")) y:x "MXR90" 1 )

)
)
)


;<------------------------------------------------------------Save Schematic------------------------------------------------------------------------>

dbSave(cv "PHYSICS_TAPEOUT_2020_Wassim" "physics_trial_SKILL_Test" "schematic" "" "a")
dbClose(cv)

