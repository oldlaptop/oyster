# "oyster" theme; based on clam from the Tk core (in particular this file is
# largely cribbed from library/ttk/clamTheme.tcl). Black-on-cream orientation
# with green accents, meant to resemble its author's preferred KDE/Qt color
# theme (originating from a theme once included with KDE3 named "Forest Green"
# or something to that effect).
#
# This software is copyrighted by the Regents of the University of
# California, Sun Microsystems, Inc., Scriptics Corporation, ActiveState
# Corporation, Apple Inc. and other parties.  The following terms apply to
# all files associated with the software unless explicitly disclaimed in
# individual files.
#
# The authors hereby grant permission to use, copy, modify, distribute,
# and license this software and its documentation for any purpose, provided
# that existing copyright notices are retained in all copies and that this
# notice is included verbatim in any distributions. No written agreement,
# license, or royalty fee is required for any of the authorized uses.
# Modifications to this software may be copyrighted by their authors
# and need not follow the licensing terms described here, provided that
# the new terms are clearly indicated on the first page of each file where
# they apply.
#
# IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY
# FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
# ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
# DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
# IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE
# NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
# MODIFICATIONS.
#
# GOVERNMENT USE: If you are acquiring this software on behalf of the
# U.S. government, the Government shall have only "Restricted Rights"
# in the software and related documentation as defined in the Federal
# Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
# are acquiring the software on behalf of the Department of Defense, the
# software shall be classified as "Commercial Computer Software" and the
# Government shall have only "Restricted Rights" as defined in Clause
# 252.227-7013 (b) (3) of DFARs.  Notwithstanding the foregoing, the
# authors grant the U.S. Government and others acting in its behalf
# permission to use and distribute the software in accordance with the
# terms specified in this license.

package require Tk

namespace eval ttk::theme::oyster {
	package provide ttk::theme::oyster 0.1

	variable colors
	array set colors {
		-disabledfg           "#e8dcce"
		-frame                "#d9ccbb"
		-window               "#fef1e1"
		-dark                 "#c1b5a7"
		-darker               "#9c9082"
		-darkest              "#72675b"
		-lighter              "#f1e1d1"
		-lightest             "#fef1e1"
		-selectbg             "#2f8c3c"
		-selectfg             "#fef1e1"
		-altindicator         "#2f8c3c"
		-disabledaltindicator "#a09184"
		-highlight            "#43c855"
		-highdark             "#24662b"
	}

	variable font [font create -family "DejaVu Serif" -size 9]

	# Don't unconditionally create the theme; it's annoying when testing.
	if {"oyster" ni [ttk::style theme names]} {
		ttk::style theme create oyster -parent clam
	}

	ttk::style theme settings oyster {

		ttk::style configure "." \
			-background $colors(-frame) \
			-foreground black \
			-bordercolor $colors(-darkest) \
			-darkcolor $colors(-dark) \
			-lightcolor $colors(-lighter) \
			-troughcolor $colors(-darker) \
			-selectbackground $colors(-selectbg) \
			-selectforeground $colors(-selectfg) \
			-selectborderwidth 0 \
			-font $font \
		;

		ttk::style map "." \
			-background [list \
				disabled $colors(-frame) \
				active $colors(-lighter)
			] \
			-foreground [list disabled $colors(-disabledfg)] \
			-selectbackground [list !focus $colors(-darkest)] \
			-selectforeground [list !focus white] \
			;

		# The stock clam setting -padding 5 is a bit much.
		ttk::style configure TButton \
			-anchor center -width -11 -padding 2 -relief raised
		ttk::style map TButton \
			-background [list \
				 disabled $colors(-frame) \
				 pressed $colors(-darker) \
				 active $colors(-lighter)
			] \
			-lightcolor [list pressed $colors(-darker)] \
			-darkcolor [list pressed $colors(-darker)] \
			-bordercolor [list alternate "#000000"] \
		;

		ttk::style configure Toolbutton \
			-anchor center -padding 2 -relief flat
		ttk::style map Toolbutton \
			-relief [list \
				disabled flat \
				selected sunken \
				pressed sunken \
				active raised
			] \
			-background [list \
				disabled $colors(-frame) \
				pressed $colors(-darker) \
				active $colors(-lighter)
			] \
			-lightcolor [list pressed $colors(-darker)] \
			-darkcolor [list pressed $colors(-darker)] \
		;

		ttk::style configure TCheckbutton \
			-indicatorbackground $colors(-window) \
			-indicatormargin {1 1 4 1} \
			-padding 2 \
		;
		ttk::style configure TRadiobutton \
			-indicatorbackground $colors(-window) \
			-indicatormargin {1 1 4 1} \
			-padding 2 \
		;
		ttk::style map TCheckbutton -indicatorbackground [list \
			pressed $colors(-frame) \
			{!disabled alternate} $colors(-altindicator) \
			{disabled alternate} $colors(-disabledaltindicator) \
			disabled $colors(-frame) \
		]
		ttk::style map TRadiobutton -indicatorbackground [list \
			pressed $colors(-frame) \
			{!disabled alternate} $colors(-altindicator) \
			{disabled alternate} $colors(-disabledaltindicator) \
			disabled $colors(-frame) \
		]

		ttk::style configure TMenubutton \
			-width -11 -padding 5 -relief raised

		ttk::style configure TEntry \
			-padding 1 \
			-insertwidth 1 \
			-fieldbackground $colors(-window) \
		;
		ttk::style map TEntry \
			-fieldbackground [list \
				readonly $colors(-frame) \
			] \
			-bordercolor [list focus $colors(-selectbg)] \
			-lightcolor [list focus $colors(-highlight)] \
			-darkcolor [list focus $colors(-highdark)] \
		;

		ttk::style configure TCombobox \
			-padding 1 \
			-insertwidth 1 \
			-fieldbackground $colors(-window) \
		;
		ttk::style map TCombobox \
			-background [list \
				active $colors(-lighter) \
				pressed $colors(-lighter)
			] \
			-fieldbackground [list \
				{readonly focus} $colors(-selectbg) \
				readonly $colors(-frame)
			] \
			-foreground [list {readonly focus} $colors(-selectfg)] \
			-arrowcolor [list disabled $colors(-disabledfg)] \
			-bordercolor [list focus $colors(-selectbg)] \
			-lightcolor [list focus $colors(-highlight)] \
			-darkcolor [list focus $colors(-highdark)] \
		;
		ttk::style configure ComboboxPopdownFrame \
			-relief solid -borderwidth 1

		ttk::style configure TSpinbox \
			-arrowsize 10 \
			-padding {2 0 10 0} \
			-fieldbackground $colors(-window) \
		;
		ttk::style map TSpinbox \
			-fieldbackground [list  readonly $colors(-frame)] \
			-arrowcolor [list disabled $colors(-disabledfg)] \
			-bordercolor [list focus $colors(-selectbg)] \
			-lightcolor [list focus $colors(-highlight)] \
			-darkcolor [list focus $colors(-highdark)] \
		;

		ttk::style configure TNotebook.Tab -padding {6 2 6 2}
		ttk::style map TNotebook.Tab \
			-padding [list selected {6 4 6 2}] \
			-background [list selected $colors(-frame) {} $colors(-darker)] \
			-lightcolor [list selected $colors(-lighter) {} $colors(-dark)] \
		;

		# Treeview:
		ttk::style configure Heading \
			-font TkHeadingFont -relief raised -padding {3}
		ttk::style configure Treeview -background $colors(-window)
		ttk::style map Treeview \
			-background [list \
				disabled $colors(-frame) \
				selected $colors(-selectbg)
			] \
			-foreground [list \
				disabled $colors(-disabledfg) \
				selected $colors(-selectfg)
			]

		ttk::style configure TLabelframe \
			-labeloutside true -labelmargins {0 0 0 4} \
			-borderwidth 2 -relief raised \
		;

		ttk::style configure TProgressbar \
			-background $colors(-selectbg) \
			-lightcolor $colors(-highlight) \
			-darkcolor $colors(-highdark) \
		;

		ttk::style configure Sash -sashthickness 6 -gripcount 10
	}
}
