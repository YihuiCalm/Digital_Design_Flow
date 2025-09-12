
globalNetConnect vpwr -type pgpin -pin vpwr  -inst * -all -override
globalNetConnect vgnd -type pgpin -pin vgnd  -inst * -all -override
globalNetConnect vpwr -type pgpin -pin vpb  -inst * -all -override
globalNetConnect vgnd -type pgpin -pin vnb  -inst * -all -override
# globalNetConnect vpwr -type tiehi -inst * -all -override
# globalNetConnect vgnd -type tielo -inst * -all -override
puts "-----------Routing-----------"
#
# setNanoRouteMode -routeTieNetToShape  "ring powergroundpin"
setNanoRouteMode -quiet -routeInsertAntennaDiode 0
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithTimingDriven 0
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer 6
setNanoRouteMode -quiet -routeBottomRoutingLayer 3
setNanoRouteMode -quiet -drouteEndIteration 150
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail




# Unfix the clock nets to avoid routing problems.
#changeUseClockNetStatus -noFixedNetWires

# Configure NanoRoute to do the final routing
getNanoRouteMode -quiet
getNanoRouteMode -quiet envSuperthreading
getNanoRouteMode -quiet drouteFixAntenna
getNanoRouteMode -quiet routeInsertAntennaDiode
getNanoRouteMode -quiet routeAntennaCellName
getNanoRouteMode -quiet timingEngine
getNanoRouteMode -quiet routeWithTimingDriven
setNanoRouteMode -quiet routeWithTimingDriven true
getNanoRouteMode -quiet routeWithEco
getNanoRouteMode -quiet routeWithSiDriven
getNanoRouteMode -quiet routeTdrEffort
setNanoRouteMode -quiet routeTdrEffort 10
getNanoRouteMode -quiet routeWithSiPostRouteFix
getNanoRouteMode -quiet drouteAutoStop
getNanoRouteMode -quiet routeSelectedNetOnly
getNanoRouteMode -quiet drouteStartIteration
getNanoRouteMode -quiet envNumberProcessor
getNanoRouteMode -quiet envSuperthreading
getNanoRouteMode -quiet routeTopRoutingLayer
getNanoRouteMode -quiet routeBottomRoutingLayer
getNanoRouteMode -quiet drouteEndIteration 
getNanoRouteMode -quiet routeEcoOnlyInLayers
#setNanoRouteMode -quiet drouteUseMultiCutVia true

# Do the actual routing
#globalDetailRoute

puts "----------Timing design--------------"
# Check timing after routing.
timeDesign -postRoute -outDir ../work/report/

puts "---------Post-route optimize---------"
#
# The final optimization step - post-route
setOptMode -yieldEffort none
setOptMode -highEffort
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -SimplifyNetlist false
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
setDelayCalMode -engine aae -SIAware true
setAnalysisMode -analysisType onChipVariation -cppr both
optDesign -postRoute -outDir ../work/report/


puts "--------Add Filler Cells---------------"
# Add the filler cells
setFillerMode -corePrefix ${BASENAME}_FILL -core ${fillerCells}
addFiller -cell $fillerCells -prefix ${BASENAME}FILL -markFixed

# Save the design so far
saveDesign ../work/design/${BASENAME}_routed.enc
puts "-----------Routing done-------------"
