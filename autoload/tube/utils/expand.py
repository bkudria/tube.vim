# -*- coding: utf-8 -*-
"""
tube.expand
~~~~~~~~~~~

This module defines various utilities for expanding special placeholders
inside commands.
"""

import re


def cr(rawstr):
    """To replace the character sequence `<CR>` into a newline.

    If `<CR>` is prepended with a backslash, the replacement is not performed.
    """
    out = re.sub(r"(?<!\\)<CR>", "\n", rawstr, flags=re.IGNORECASE)
    return re.sub(r"\\(<cr>)", "\\1", out, flags=re.IGNORECASE)


def character(rawstr, target, repl):
    """To replace the character `target` with `repl` in `rawstr`.

    If `target` is prepended with a backslash, the replacement is not performed.
    """
    out = re.sub(r"(?<!\\){0}".format(target), repl, rawstr)
    return re.sub(r"\\{0}".format(target), target, out)
