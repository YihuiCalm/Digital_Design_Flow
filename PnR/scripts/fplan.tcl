#####################################################
# Floorplanning   (Erik Brunvand, 2008)            #
#####################################################
puts "-------------Floorplanning---------------"
#
# Make a floorplan - this works fine for projects that are all 
# standard cells and include no blocks that need hand placement... 
setDrawView fplan
#setFPlanRowSpacingAndType $rowgap 2
#floorPlan -site core -r $aspect $usepct $coregap $coregap $coregap $coregap 
#setRoutingStyle -top -style m
#fit

getIoFlowFlag
setFPlanRowSpacingAndType $rowgap 2
setIoFlowFlag 0
#floorPlan -flip s -r $aspect $usepct $coregap $coregap $coregap $coregap 
floorPlan -flip s -r $aspect $usepct $coregap $coregap $coregap $coregap 
uiSetTool select
getIoFlowFlag
fit



#
# Save design so far
saveDesign ../work/design/${BASENAME}_fplan.enc
saveFPlan  ../work/design/${BASENAME}.fp
puts "--------------Floorplanning done-----------"
