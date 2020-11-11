.. _history-of-man_osu-lug_2015:

A History of `$ man`
====================

Presented by Elijah Caine

    What is `$ man`?

    Who made `$ man`?

    Why do we use `$ man`?

    Alternatives.

`$ man`
-------

.. figure:: /static/history-of-man_osu-lug_2015/history_of_man_sm.png
    :align: center

What?
-----

A man page is a form of online software documentation found on unix and
unix-like computer operating systems.

Topic include programs, libraries, system calls, formal standards, and abstract
concepts.

- Wikipedia

man is the system's manual pager. Each page argument given to man is normally
the name of a program, utility or function.

- `$ man man`

They are usually very dry. 

Sections
--------

There are generally 8 classes of man pages

1. General Commands
2. System Calls
3. Library Functions (C libraries in particular)
4. Special Files (/dev/) and drivers
5. File formats and conversions
6. Games and Screensavers
7. Miscellanea
8. System Administration commands and daemons

Sections (cont)
---------------

`$ man 3 printf` will bring up the printf library manpage, `$ man printf` will
bring up the printf program manpage.

|

Most systems have different, modified, or additional sections.

Layout
------

* NAME
    What it's called
* SYNOPSIS
    What this document is about to tell you
* DESCRIPTION
    What it does and how to do those things
* EXAMPLES
    Useful
* SEE ALSO
    Also useful

RUNOFF
------

Jerome H. Saltzer wrote the RUNOFF utility into the MAD Computer Language for
MIT's IBM 7094 CTSS Operating System. RUNOFF was used for computer text
formatting.

RUNOFF was later ported to many systems as `roff`, `runoff`, `rf`, `compose`,
`nroff`, `troff`, `ditroff`.

`groff` was the GNU port of `troff` and was also the first Open Source
implementation of a RUNOFF derivative.

Something like `man`
--------------------

Dennis Ritchie and Ken Tompson at Bell Labs November 3, 1971 published the `Unix
Programmer's Manual` with the first version of UNIX.

.. figure:: /static/history-of-man_osu-lug_2015/unix_programmers_manual.jpg
    :align: center

Why?
----

Doug Mcllroy (Dennis and Ken's Manager) insisted they include documentation for
Unix.

To this day every (well made) \*nix program comes with a man page.  

Post-man: Alternatives
----------------------

- GNU `info`
- `yelp` (html viewer for man pages)
- `mandoc` (replacement for `troff`)

Notes
-----

Sources include:

https://en.wikipedia.org/wiki/Man_page

`$ man man`

https://web.archive.org/web/20140327174307/http://manpages.bsd.lv/history.html
(because manpages.bsd.lv is broken for some reason)
