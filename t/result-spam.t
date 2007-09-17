#!perl
use strict;
use warnings;

use Email::Simple;
use Mail::SpamAssassin::SimpleClient;
use Test::More;

plan skip_all => "set PERL_SIMPLECLIENT_TEST to run these tests"
  unless $ENV{PERL_SIMPLECLIENT_TEST};

plan 'no_plan';

open my $msg_fh, '<', 't/messages/spam.msg';
my $msg = do { local $/; <$msg_fh>; };

my $email = Email::Simple->new($msg);

ok(
  Mail::SpamAssassin::SimpleClient->new->check($email)->is_spam,
  "yup, this message is spam",
);
