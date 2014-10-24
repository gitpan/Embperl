
###################################################################################
#
#   Embperl - Copyright (c) 1997-2010 Gerald Richter / ECOS
#
#   You may distribute under the terms of either the GNU General Public
#   License or the Artistic License, as specified in the Perl README file.
#
#   THIS PACKAGE IS PROVIDED 'AS IS' AND WITHOUT ANY EXPRESS OR
#   IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
#   WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
#   $Id: EmbperlXSLT.pm 294769 2005-08-13 19:43:05Z richter $
#
###################################################################################
 


package Embperl::Recipe::EmbperlXSLT ;

use strict ;
use vars qw{@ISA} ;

use Embperl::Recipe::Embperl ;

@ISA = ('Embperl::Recipe::Embperl') ;

# ---------------------------------------------------------------------------------
#
#   Create a new recipe by converting request parameter
#
# ---------------------------------------------------------------------------------


sub get_recipe

    {
    my ($class, $r, $recipe, $src, $syntax) = @_ ;

    my $ep = Embperl::Recipe::Embperl -> get_recipe ($r, $recipe, $src, $syntax) ;
    my $param  = $r -> component -> param  ;
    return $ep if ($param -> import >= 0) ;

    my $config = $r -> component -> config  ;
    my $xsltproc = $config -> xsltproc ;

    my @stylesheet =
        (
        { type => 'file',  filename  => $config -> xsltstylesheet, },
        { type =>  $xsltproc . '-compile-xsl', cache => 1 },
        ) ;


    push @$ep, {'type'   =>  'eptostring' } ;
    push @$ep, {'type'   =>  $xsltproc . '-parse-xml', } ;
    push @$ep, {'type'   =>  $xsltproc, stylesheet => \@stylesheet, $param -> xsltparam?():
                (param => { map { my $v = $Embperl::fdat{$_} ; $v =~ s/\'/&apos;/g ; ($_ => "'$v'") } keys %Embperl::fdat }) } ;

    return $ep ;
    }


1 ;

__END__

=pod

=head1 NAME

Embperl::Recipe::EmbperlXSLT

=head1 SYNOPSIS


=head1 DESCRIPTION

This recipe does an XSLT transformation after normal Embperl processing.

=head1 Author

G. Richter (richter@dev.ecos.de)

=head1 See Also

L<Embperl::Recipe|EmbperlRecipe.pod>

L<Embperl::Recipe::XSLT|EmbperlRecipe/XSLT.pod>




