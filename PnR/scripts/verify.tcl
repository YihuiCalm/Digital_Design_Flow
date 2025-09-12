
puts "----------Verifying and File Output-------------"
#
# Verify the connectivity and geometry
verifyConnectivity -type regular -error 50 -warning 50 \
                   -reportfile ../work/report/${BASENAME}_Conn_regular.rpt
verifyConnectivity -type special -error 50 -warning 50 \
                   -reportfile ../work/report/${BASENAME}_Conn_special.rpt
verifyGeometry -allowSameCellViols -noSameNet -noOverlap\
               -reportfile ../work/report/${BASENAME}_Geom.rpt

puts "----------Output ${BASENAME}.def file------------"
# Export the DEF, v, spef, sdf, lef, and lib files
saveDesign ../work/design/${BASENAME}_done.enc -def


streamOut [format "../work/output/%s_soc.gds" $BASENAME] -mapFile /afs/glue.umd.edu/department/enee/software/cadskywaterpdk/pdk/V2.1.306/LIBS/S130/s130_innovus.layermap -libName Test -structureName $BASENAME -units 2000 -mode ALL

puts "----------Output ${BASENAME}_soc.v file---------"
saveNetlist [format "../work/output/%s_soc.v" $BASENAME] -includePowerGround


extractRC -outfile ../work/output/$BASENAME.cap
rcOut -spef ../work/output/$BASENAME.spef


# Generate timing model for PrimeTime
writeTimingCon -pt -filePrefix ../work/timing/${BASENAME}_done

puts "------------Verify and file output done------"
