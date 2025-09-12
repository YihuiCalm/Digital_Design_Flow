
puts "-------------Power Planning----------------"
puts "-------Making power rings------------------"
#
# Make power and ground rings 
#    $pwidth microns wide with $pspace spacing between them
#    and centered in the channel 

#addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer met6 -type core_rings -jog_distance 0.2 -threshold 0.2 -nets {VGND VPWR} -follow core -stacked_via_bottom_layer met1 -layer {bottom met1 top met1 right met2 left met2} -width $pwidth -spacing $pspace

# globalNetConnect vpwr -type pgpin -pin vpwr  -inst * -all -override
# globalNetConnect vgnd -type pgpin -pin vgnd  -inst * -all -override
# globalNetConnect vpwr -type pgpin -pin vpb  -inst * -all -override
# globalNetConnect vgnd -type pgpin -pin vnb  -inst * -all -override
# globalNetConnect vpwr -type tiehi -inst * -all -override
# globalNetConnect vgnd -type tielo -inst * -all -override

addRing -nets {vpwr vgnd} -type core_rings -follow core -layer {top met1 bottom met1 left met2 right met2} -width $pwidth -spacing $sspace -offset $soffset -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
set sprCreateIeStripeNets {}
set sprCreateIeStripeLayers {}
set sprCreateIeStripeWidth 1
set sprCreateIeStripeSpacing 1
set sprCreateIeStripeThreshold 1



#
puts "------making power stripes-----------------"
#
# Make Power Stripes. This step is optional. If you keep it in remember to 
# check the stripe spacing (set-to-set-distance = $sspace) 
# and stripe offset (xleft-offset = $soffset)) 
#addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit M2 -max_same_layer_jog_length 6 -padcore_ring_bottom_layer_limit M1 -number_of_sets 1 -skip_via_on_pin Standardcell -stacked_via_top_layer AP -padcore_ring_top_layer_limit M2 -spacing 2 -merge_stripes_value 0.1 -direction horizontal -layer M1 -block_ring_bottom_layer_limit M1 -width 1 -nets {vdd vss} -stacked_via_bottom_layer M1

#addStripe -block_ring_top_layer_limit M3 -max_same_layer_jog_length 3.0 \
#          -snap_wire_center_to_grid Grid -padcore_ring_bottom_layer_limit M1 \
#          -set_to_set_distance $sspace -stacked_via_top_layer M3 \
#          -padcore_ring_top_layer_limit M3 -spacing $pspace -xleft_offset $soffset \
#        -merge_stripes_value 1.5 -layer M2 -block_ring_bottom_layer_limit M1 \
#          -width $swidth -nets {vss vdd} -stacked_via_bottom_layer M1
#
# Use the special-router to route the vdd! and gnd! nets
sroute -jogControl { preferWithChanges differentLayer } -nets {vgnd vpwr}

# Save the design so far
saveDesign ../work/design/${BASENAME}_pplan.enc
puts "-------------Power Planning done---------"
