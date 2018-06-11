package alias::module;

# DATE
# VERSION


sub import {
    my $class = shift;
    my $orig  = shift;

    my $caller = caller();

    (my $orig_pm = "$orig.pm") =~ s!::!/!g;
    require $orig_pm;
    *{$caller . "::"} = \*{$orig . "::"};
}

1;
# ABSTRACT: Alias one module as another

=head1 SYNOPSIS

 package Your::Alias::Name;
 use alias::module 'Some::Real::Module::Name';


=head1 DESCRIPTION

This module aliases one module name to another.

 package Your::Alias::Name;
 use alias::module 'Some::Real::Module::Name';

is equivalent to:

 package Your::Alias::Name;
 BEGIN {
     $Package::Alias::BRAVE = 1;
     require Some::Real::Module::Name;
 }
 use Package::Alias 'Your::Alias::Name' => 'Some::Real::Module::Name';

except that this module does not use L<Package::Alias> and is simpler. It is
useful if you want to let users access a module's functionality under a
different (usually shorter) name.


=head1 SEE ALSO

L<Package::Alias>

L<abbreviation>

=cut
