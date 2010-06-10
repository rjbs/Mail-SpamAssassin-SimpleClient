use strict;
use warnings;
package Mail::SpamAssassin::SimpleClient::Result;
# ABSTRACT: the results of checking a message

use Carp ();

=method new

  my $result = Mail::SpamAssassin::SimpleClient::Result->new(\%arg);

This method returns a new Result object.  Don't call this method unless you are
Mail::SpamAssassin::SimpleClient.  (I<nota bene>, you are not.)

=cut

sub new {
  my ($class, $arg) = @_;

  bless $arg => $class;
}

=method is_spam

This method returns a true or false value indicating whether the checked
message was found to be spam.

=cut

sub is_spam { $_[0]->{is_spam} }

=method score

=method threshold

These methods return the message's score and the score that would be needed to
classify the message as spam.

=cut

sub score { $_[0]->{score} }

sub threshold { $_[0]->{threshold} }

=method sa_version

This method returns the version of SpamAssassin that checked the message.

=cut

sub sa_version { $_[0]->{version} }

=method tests

  my @test_names = $result->tests;

This method returns a list of tests against which the message matched.  Note
that not every test is an indicator of spamminess.  Some indicate hamminess.

=cut

sub tests {
  my ($self) = @_;

  return keys %{ $self->{tests} };
}

=method test_scores

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

=method test_descriptions

  my %descriptions = $result->test_descriptions;

This method returns a list of name/value pairs.  The values are the
full description names for any tests run. Since non-spam reports do not
elaborate on individual tests run, the description for each test on a
non-spam result is undefined.

=cut

sub test_descriptions {
  my ($self) = @_;

  return %{ $self->{test_desc} };
}

=method email

This method returns the email object included in the response.

=cut

sub email {
  $_[0]->{email}
}

1;
