
puts "--------Clock Tree Synthesis-------"

# Create the clock tree spec from the .sdc file
createClockTreeSpec -output $BASENAME.ctstch -invFootprint $clockBufName
specifyClockTree -clkfile $BASENAME.ctstch

# Use -useCTSRouteGuide to use routing guide during CTS.
setCTSMode -useCTSRouteGuide

# Set routeClkNet to use Nanoroute during CTS.
setCTSMode -routeClkNet

# Perform clocktree synthesis
clockDesign -outDir ${BASENAME}_clock_reports



# Run the second optimization - post-CTS
setOptMode -yieldEffort none
setOptMode -highEffort
setOptMode -maxDensity 0.95
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -noSimplifyNetlist
getOpCond -max
getOpCond -max
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -postCTS
optDesign -postCTS -hold
# Save the design so far
saveDesign ${BASENAME}_cts.enc
puts "---------Clock Tree Synthesis done----"
