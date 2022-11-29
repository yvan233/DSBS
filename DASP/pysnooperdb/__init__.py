# Copyright 2019 Ram Rachum and collaborators.
# This program is distributed under the MIT license.

from .tracer import Tracer as snoop
from .variables import Attrs, Exploding, Indices, Keys
from .DataBaseFunc import DaspMysqlServer
import collections

__VersionInfo = collections.namedtuple('VersionInfo',
                                       ('major', 'minor', 'micro'))

__version__ = '3.0.0'
__version_info__ = __VersionInfo(*(map(int, __version__.split('.'))))

del collections, __VersionInfo # Avoid polluting the namespace
