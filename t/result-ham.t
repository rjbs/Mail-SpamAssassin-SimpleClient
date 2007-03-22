#!perl
use strict;
use warnings;

use Test::More 'no_plan';

use Email::Simple;

BEGIN { use_ok('Mail::SpamAssassin::SimpleClient'); }

open my $msg_fh, '<', 't/messages/not-spam.msg';
my $msg = do { local $/; <$msg_fh>; };

my $email = Email::Simple->new($msg);

Mail::SpamAssassin::SimpleClient->new->check($email);
