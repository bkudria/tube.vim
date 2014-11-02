# -*- coding: utf-8 -*-
"""
tube.utils.options
~~~~~~~~~~~~~~~~~~

This module defines various utilities for setting/getting Tube options.
"""

from tube.utils import v


prefix = 'g:tube_'


def get(name, fmt=None):
    """To retrieve the value of a Tube option."""
    if not v.eval(u"exists('{0}')".format(prefix + name), fmt=bool):
        raise ValueError("Option '{0}' does not exist".format(prefix + name))
    return v.eval(prefix + name, fmt=fmt)
