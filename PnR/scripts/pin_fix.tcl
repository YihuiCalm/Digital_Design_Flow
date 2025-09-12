foreach pin [get_db ports] {

  set name  [get_db $pin .name]
  set side     [get_db $pin .side]
  set xL         [get_db $pin .location.x]
  set yL         [get_db $pin .location.y]
  set layer   [get_db $pin .layer.name]

  if {$side == "east"} {
  set xL [expr {$xL - 0.5}]
  edit_pin -layer ${layer} -side Inside -assign $xL $yL -pin ${name}
  } elseif {$side == "west"} {
  set xL [expr {$xL - 0.5}]
  edit_pin -layer ${layer} -side Inside -assign $xL $yL -pin ${name}
  } else {
  puts "Do nothing"
  }

}
