#!/usr/bin/tclsh
#
# From the Tcl wiki at https://wiki.tcl-lang.org/page/List+of+ttk+Themes (and
# not even reindented)

package require Tk

set theme [lindex $::argv 0]

if { [file exists $theme.tcl] } {
  source $theme.tcl
}

ttk::style theme use $theme
set tbg [ttk::style lookup TFrame -background]
lassign [winfo rgb . $tbg] bg_r bg_g bg_b
set tbg [format {#%02x%02x%02x} \
  [expr {$bg_r / 256}] \
  [expr {$bg_g / 256}] \
  [expr {$bg_b / 256}]]

set val 55
set valb $theme
set off 0
set on 1

. configure -background $tbg

ttk::notebook .nb
pack .nb -side left -fill both -expand true
ttk::labelframe .lf -text " $theme "
.nb add .lf -text $theme
ttk::frame .junk
.nb add .junk -text [join [lreverse [split $theme {}]] {}]
ttk::frame .bf
ttk::label .lb -text $theme
ttk::button .b -text $theme
pack .lb .b -in .bf -side left -padx 3p
ttk::combobox .combo -values [list aaa bbb ccc] -textvariable valb -width 15
ttk::frame .cbf
ttk::checkbutton .cboff -text off -variable off
ttk::checkbutton .cbon -text on -variable on
pack .cboff .cbon -in .cbf -side left -padx 3p
ttk::separator .sep
ttk::frame .rbf
ttk::radiobutton .rboff -text off -variable on -value 0
ttk::radiobutton .rbon -text on -variable on -value 1
pack .rboff .rbon -in .rbf -side left -padx 3p
ttk::scale .sc -from 0 -to 100 -variable val
ttk::progressbar .pb -mode determinate -length 100 -variable val
ttk::entry .ent -textvariable valb -width 15
ttk::spinbox .sbox -textvariable val -width 5
ttk::scrollbar .sb
ttk::sizegrip  .sg
pack .sb -side right -fill y -expand true
pack .bf .combo .cbf .sep .rbf .sc .pb .ent .sbox \
    -in .lf -side top -anchor w -padx 3p -pady 3p
pack configure .sep -fill x -expand true
pack .sg -in .lf -side right -anchor s


