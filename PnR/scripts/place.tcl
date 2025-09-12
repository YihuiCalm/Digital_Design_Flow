
puts "----------Placing Cells-----------"

setPlaceMode -place_global_place_io_pins true
setPlaceMode -fp false
placeDesign
setDrawView place
fit

# Now run the first optimization step - pre-CTS (Clock Tree Synthesis) 
# in-place optimization.
setOptMode -yieldEffort none
setOptMode -effort high
setOptMode -maxDensity 0.9
setOptMode -drcMargin 0.0
setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
setOptMode -SimplifyNetlist false
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS -outDir work/report/
#optDesign -postCTS
fit
# saveNetlist [format "%s_soc.v" $BASENAME] -includePowerGround

# Save the design so far
saveDesign work/design/${BASENAME}_placed.enc
puts "-------------Done Placing Cells-----"
