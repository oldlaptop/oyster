This is the core Ttk theme 'clam' hacked up to look closer to the way I,
personally, want it. This means somewhat red-shifted, in particular with text
rendered black-on-#fef1e1, and with serif fonts where possible without changing
TkDefaultFont. This still lets plenty of uses of TkDefaultFont slip through; for
the full experience, try the following in ~/.config/fontconfig/fonts.conf:

```
<alias>
 <family>sans-serif</family>
  <prefer>
   <family>serif</family>
 </prefer>
</alias>
```

With the demo code at <https://wiki.tcl-lang.org/page/List+of+ttk+Themes>
(bundled here as demottk.tcl, plumbed up to `make test`) you should see
something like:

![demo screenshot](demo.png)

Unthemed widgets (in particular [text] and [canvas]) will still be black-on-
white by default without further configuration. I recommend something like
the following in ~/.Xresources (or otherwise added to the resource database):

```
*TkTheme: oyster
*background: #fef1e1
```

This will of course also affect many Xt and motif applications; I consider
that a feature.
