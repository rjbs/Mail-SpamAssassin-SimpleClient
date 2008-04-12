use strict;
use warnings;

use inc::Module::Install;

name          ('Mail-SpamAssassin-SimpleClient');
author        ('Ricardo Signes <rjbs@cpan.org>');
license       ('perl');
version_from  ('lib/Mail/SpamAssassin/SimpleClient.pm');

requires('Email::MIME'        => 1); # no idea what the minimum version is
requires('Mail::SpamAssassin' => 3); # no idea what the minimum version is

extra_tests;

WriteAll();
