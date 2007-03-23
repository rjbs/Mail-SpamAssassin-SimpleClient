use strict;
use warnings;

package Mail::SpamAssassin::SimpleClient::Result;

use Carp ();

=head1 NAME

Mail::SpamAssassin::SimpleClient::Result - the results of checking a message

=head1 VERSION

version 0.001

 $Id$

=cut

our $VERSION = '0.001';

=head1 METHODS

=head2 new

  my $result = Mail::SpamAssassin::SimpleClient::Result->new(\%arg);

This method returns a new Result object.  Don't call this method unless you are
Mail::SpamAssassin::SimpleClient.  (I<nota bene>, you are not.)

=cut

sub new {
  my ($class, $arg) = @_;

  bless $arg => $class;
}

=head2 is_spam

This method returns a true or false value indicating whether the checked
message was found to be spam.

=cut

sub is_spam { $_[0]->{is_spam} }

=head2 score

=head2 threshold

These methods return the message's score and the score that would be needed to
classify the message as spam.

=cut

sub score { $_[0]->{score} }

sub threshold { $_[0]->{threshold} }

=head2 sa_version

This method returns the version of SpamAssassin that checked the message.

=cut

sub sa_version { $_[0]->{version} }

=head2 tests

  my @test_names = $result->tests;

This method returns a list of tests against which the message matched.  Note
that not every test is an indicator of spamminess.  Some indicate hamminess.

=cut

sub tests {
  my ($self) = @_;

  return keys %{ $self->{tests} };
}

=head2 test_scores

  my %test_score = $result->test_scores;

This method returns a list of name/value pairs.  The values are the number of
points (positive or negative) for which the test counts.  Since non-spam
reports do not elaborate on the number of points per test, the value for each
test on a non-spam result is undefined.

=cut

sub test_scores {
  my ($self) = @_;

  return %{ $self->{tests} };
}

=head1 AUTHOR

Ricardo SIGNES, C<< <rjbs@cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically be
notified of progress on your bug as I make changes.

=head1 COPYRIGHT

Copyright 2007 Ricardo SIGNES, all rights reserved.

This program is free software; you may redistribute it and/or modify it
under the same terms as Perl itself.

=cut


1;
