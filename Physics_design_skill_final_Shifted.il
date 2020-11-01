; Description: Physics design for the inital design where there is SI02 in the middle of the diodes.


;<------------------------------------Load the layout------------------------------------->
cv = dbOpenCellViewByType("PHYSICS_TAPEOUT_2020_Wassim" "physics_trial_SKILL" "layout" "" "a")

;<------------------------------------Place the Sealring------------------------------------->
xSealring = 0
ySealring = 0
dbCreateParamInstByMasterName(cv "Sealring" "tsmc_c018_sealring_1p6m" "layout"  symbolToString(gensym("i")) xSealring:ySealring "R0" 1 )

;<------------------------------------Place the bottom pads------------------------------------->
for(i 0 11

;xPads = 30.18 + i*101.98
xPads = 30.18 + i*101.98 + 5.6
yPads = 15.0
dbCreateParamInstByMasterName(cv "pads_test" "PAD70GU" "layout"  symbolToString(gensym("i")) xPads:yPads "R0" 1 )
)

;<------------------------------------Place the top pads------------------------------------->
for(i 0 20

;xPads = 30.18 + i*101.98
xPads = 30.18 + i*101.98 + 5.6
yPads = 2215.00
dbCreateParamInstByMasterName(cv "pads_test" "PAD70GU" "layout"  symbolToString(gensym("i")) xPads:yPads "MX" 1 )
)

;<------------------------------------Place the Parallel DCD array------------------------------------->

for(i 1 28
for(j 0 140

xDCD = 15.18 + (i-1)*41.805
yDCD = 104.99 + j*14.01

xCTopConnectionTopPadEnd = 283.13 + (i-7)*41.805 + 2.61 + 5
yCTopConnectionTopPadEnd = 2078.79


xD1ConnectionBottomPadEnd = 370.295 + (i-15)*41.805 + 20 + 5
yD1ConnectionBottomPadEnd = 115.165

xD2ConnectionBottomPadEnd = 480.145 + (i-15)*41.805 + 20 + 5
yD2ConnectionBottomPadEnd = 108.265

xD1ConnectionBottomPadStart = 126.72 + (i-1)*41.805 + 5
yD1ConnectionBottomPadStart = 115.165

xD2ConnectionBottomPadStart = 227.405 + (i-1)*41.805 + 5
yD2ConnectionBottomPadStart = 108.265


xD1ConnectionTopPadEnd = 19.785 + (i-7)*41.805 + 5
yD1ConnectionTopPadEnd = 2089.675

xD2ConnectionTopPadEnd = 121.76 + (i-7)*41.805 + 5
yD2ConnectionTopPadEnd = 2082.855

xD1ConnectionTopPadStart = 427.685 + (i-7)*41.805 + 14.81 + 5
yD1ConnectionTopPadStart = 2089.675

xD2ConnectionTopPadStart = 529.665 + (i-7)*41.805 + 14.81 + 5
yD2ConnectionTopPadStart = 2082.855

xCTopConnectionTopPadStart = 324.935 + (i-8)*41.805 + 5
yCTopConnectionTopPadStart = 2078.79

xCTopConnectionBottomPadEnd = 283.13 + (i-7)*41.805 + 2.61 + 5
yCTopConnectionBottomPadEnd = 104.99

xCTopConnectionBottomPadStart = 32.3 + (i-1)*41.805 + 5
yCTopConnectionBottomPadStart = 104.99

xCTopConnectionTop = 32.3 + (i-1)*41.805 + 5
yCTopConnectionTop = 2078.58

xCTopConnectionBottom = 32.3 + (i-1)*41.805 + 5
yCTopConnectionBottom = 104.99

xD1Connection = 12.17 + (i-1)*41.805 + 5
yD1Connection = 114.265 + j*14.01

xD2Connection = 48.845 + (i-1)*41.805 + 5
yD2Connection = 107.445 + j*14.01

ifStatementDecisionMod7 = mod(i 7)
ifStatementDecisionMod2 = mod(i 2)

ifStatementDecisionMod7_1 = mod((i-1) 7)
ifStatementDecisionMod2_1 = mod((i-1) 2)

;<------------------------------------Route the Parallel DCD array------------------------------------->

if( ifStatementDecisionMod2_1 != 0 && ifStatementDecisionMod7_1 == 0 then
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "ctop_connection_pad" "layout"  symbolToString(gensym("i")) xCTopConnectionTopPadStart:yCTopConnectionTopPadStart "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d1s_d2s_connection_pad" "layout"  symbolToString(gensym("i")) xD1ConnectionTopPadStart:yD1ConnectionTopPadStart "MY" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d1s_d2s_connection_pad" "layout"  symbolToString(gensym("i")) xD2ConnectionTopPadStart:yD2ConnectionTopPadStart "MY" 1 )
)
if( ifStatementDecisionMod2_1 == 0 && ifStatementDecisionMod7_1 == 0 then
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "ctop_connection_pad" "layout"  symbolToString(gensym("i")) xCTopConnectionBottomPadStart:yCTopConnectionBottomPadStart "MX" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d1s_d2s_connection_pad" "layout"  symbolToString(gensym("i")) xD1ConnectionBottomPadStart:yD1ConnectionBottomPadStart "MX" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d1s_d2s_connection_pad" "layout"  symbolToString(gensym("i")) xD2ConnectionBottomPadStart:yD2ConnectionBottomPadStart "MX" 1 )
)

if( ifStatementDecisionMod7 != 0 then
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d1s_d2s_connection" "layout"  symbolToString(gensym("i")) xD1Connection:yD1Connection "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d1s_d2s_connection" "layout"  symbolToString(gensym("i")) xD2Connection:yD2Connection "R0" 1 )

if( ifStatementDecisionMod2 != 0 then
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "ctop_connection" "layout"  symbolToString(gensym("i")) xCTopConnectionTop:yCTopConnectionTop "R0" 1 )

else

dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "ctop_connection" "layout"  symbolToString(gensym("i")) xCTopConnectionBottom:yCTopConnectionBottom "R0" 1 )
)

else

if( ifStatementDecisionMod2 != 0 then
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "ctop_connection_pad" "layout"  symbolToString(gensym("i")) xCTopConnectionTopPadEnd:yCTopConnectionTopPadEnd "MY" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d1s_d2s_connection_pad" "layout"  symbolToString(gensym("i")) xD1ConnectionTopPadEnd:yD1ConnectionTopPadEnd "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d1s_d2s_connection_pad" "layout"  symbolToString(gensym("i")) xD2ConnectionTopPadEnd:yD2ConnectionTopPadEnd "R0" 1 )
)

if( ifStatementDecisionMod2 == 0 then
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "ctop_connection_pad" "layout"  symbolToString(gensym("i")) xCTopConnectionBottomPadEnd:yCTopConnectionBottomPadEnd "R180" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d1s_d2s_connection_pad" "layout"  symbolToString(gensym("i")) xD1ConnectionBottomPadEnd:yD1ConnectionBottomPadEnd "MX" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d1s_d2s_connection_pad" "layout"  symbolToString(gensym("i")) xD2ConnectionBottomPadEnd:yD2ConnectionBottomPadEnd "MX" 1 )
)
)

dbCreateParamInstByMasterName(cv "Sealring" "Test" "layout"  symbolToString(gensym("i")) xDCD:yDCD "R0" 1 )
)
)

;<------------------------------------Place the Series DCD array------------------------------------->

for(i 1 72
for(j 0 76

xDCD = 1208 + (i-1)*14.03
yDCD = 14.18 + j*26.715 + 1

xCTopConnectionTop = 1223.91 + (i-2)*14.03
yCTopConnectionTop = 2082.32 + 1

xDConnectionTop = 1227.125 + (i-2)*14.03
yDConnectionTop = 2075.505 + 1

xDConnectionBottom = 1213.095 + (i-2)*14.03
yDConnectionBottom = 14.31 + 1

xCTopConnectionBottom = 1216.12 + (i-2)*14.03
yCTopConnectionBottom = 14.18 + 1

xPadConnection_0 = 1245 + (i-1)*14.03
yPadConnection_0 = 2101 + 1

xPadConnection_1 = 1345 + (i-1)*14.03
yPadConnection_1 = 2098 + 1

xPadConnection_2 = 1445 + (i-1)*14.03
yPadConnection_2 = 2095 + 1

xConnectionPad = 1207 + (i-1)*14.03
yConnectionPad_0  = 2101 + 1
yConnectionPad_1  = 2098 + 1
yConnectionPad_2  = 2095 + 1

xD1Connection = 1209.315 + (i-1)*14.03
yD1Connection  = 2073.575 + 1

xD2Connection = 1535.785 + (i-1)*14.03
yD2Connection  = 2070.105 + 1

xCTopSeriesConnection = 1538.82 + (i-1)*14.03
yCTopSeriesConnection  = 2073.575 + 1

ifStatementDecisionMod24 = mod(i 24)
ifStatementDecisionMod24_1 = mod((i-1) 24)
ifStatementDecisionMod2 = mod(i 2)

;<------------------------------------Route the Series DCD array------------------------------------->

if( ifStatementDecisionMod24_1 == 0 then
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "connection_pad" "layout"  symbolToString(gensym("i")) xConnectionPad:yConnectionPad_0 "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "connection_pad" "layout"  symbolToString(gensym("i")) xConnectionPad:yConnectionPad_1 "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "connection_pad" "layout"  symbolToString(gensym("i")) xConnectionPad:yConnectionPad_2 "R0" 1 )

dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "pad_connection" "layout"  symbolToString(gensym("i")) xPadConnection_0:yPadConnection_0 "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "pad_connection" "layout"  symbolToString(gensym("i")) xPadConnection_1:yPadConnection_1 "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "pad_connection" "layout"  symbolToString(gensym("i")) xPadConnection_2:yPadConnection_2 "R0" 1 )

dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d1_connection" "layout"  symbolToString(gensym("i")) xD1Connection:yD1Connection "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "ctop_series_connection" "layout"  symbolToString(gensym("i")) xCTopSeriesConnection:yCTopSeriesConnection "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d2_connection" "layout"  symbolToString(gensym("i")) xD2Connection:yD2Connection "R0" 1 )
)

;<------------------------------------Handle the First and Last DCD Component in the Series Setup------------------------------------->

if( ifStatementDecisionMod2 == 0 && j == 0  then
dbCreateParamInstByMasterName(cv "Sealring" "DCD_Unit_Series_One_N_One" "layout"  symbolToString(gensym("i")) xDCD:yDCD "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "ctop_connection_short" "layout"  symbolToString(gensym("i")) xCTopConnectionBottom:yCTopConnectionBottom "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d_connection" "layout"  symbolToString(gensym("i")) xDConnectionBottom:yDConnectionBottom "R0" 1 )
else
if( ifStatementDecisionMod2 == 0 && j == 76 && ifStatementDecisionMod24 != 0 then
dbCreateParamInstByMasterName(cv "Sealring" "DCD_Unit_Series_One_N_One_Flipped" "layout"  symbolToString(gensym("i")) xDCD:yDCD "R0" 1 )
if( i != 72 then
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "ctop_connection_short_Top" "layout"  symbolToString(gensym("i")) xCTopConnectionTop:yCTopConnectionTop "R0" 1 )
dbCreateParamInstByMasterName(cv "PHYSICS_TAPEOUT_2020_Wassim" "d_connection" "layout"  symbolToString(gensym("i")) xDConnectionTop:yDConnectionTop "R0" 1 )
)
else
if( ifStatementDecisionMod2 == 0 then
dbCreateParamInstByMasterName(cv "Sealring" "DCD_Unit_Series_Flipped" "layout"  symbolToString(gensym("i")) xDCD:yDCD "R0" 1 )
else
dbCreateParamInstByMasterName(cv "Sealring" "DCD_Unit_Series" "layout"  symbolToString(gensym("i")) xDCD:yDCD "R0" 1 )
)
)
)
)
)
;<----------------------------------------------------------------------------------------------------------------------------------------------------------------->
;<----------------------------------------------------- Save Layout ------------------------------------------------------>
dbSave(cv "PHYSICS_TAPEOUT_2020_Wassim" "physics_trial_SKILL" "layout" "" "a")
dbClose(cv)

