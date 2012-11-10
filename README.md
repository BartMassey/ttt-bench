# Tic-Tac-Toe Benchmarks
Copyright © 2012 Bart Massey

This is as direct as possible a translation of the same
pseudocode into a variety of different imperative languages.
The code is a Tic-Tac-Toe solver: i.e., a search that proves
that Tic-Tac-Toe is a draw. The search is complete and
completely unoptimized, so it searches about 550K positions
before proving the draw.

I used standard language tools, and the fastest simple
settings I could manage. The C was compiled with -O2 and the
Java with -O. The JavaScript was run with the d8 shell of
the v8 interpreter [1], with the Java-based rhino
interpreter shell [2], and with the js shell of SpiderMonkey
[3]. The Matlab version [4] was run on a different machine,
because I had access to Matlab there.

Timings on my home machine (2GHz Intel Core 2 Quad Q9300)
are as follows:

    C:               0.05s
    Java:            0.16s
    JavaScript [1]:  0.25s
    JavaScript [2]:  1.8s
    JavaScript [3]:  3.0s
    Python:          8.3s
    Nickle:          14s
    Matlab [4]:      15s
    Octave:          3.5m

Yes, Octave is 4000x slower than C on this benchmark!

I was surprised to see the differences in performance
between languages. Slow recursion might be a problem for
this code, but most of the time is expected to be spent in
gamevalue() checking for wins. As such, it's running the
most generic little for loops ever.

I split the program across several files, for complicated
reasons. Thus this code is also a demo of separate source
files for the various languages.

This code is made available under the "MIT License". Please
see the file COPYING in this distribution for license
details.

Enjoy!
