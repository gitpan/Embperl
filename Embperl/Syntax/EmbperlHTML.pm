
###################################################################################
#
#   Embperl - Copyright (c) 1997-2001 Gerald Richter / ECOS
#
#   You may distribute under the terms of either the GNU General Public
#   License or the Artistic License, as specified in the Perl README file.
#
#   THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
#   IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
#   WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
#   $Id: EmbperlHTML.pm,v 1.3 2003/02/27 07:05:33 richter Exp $
#
###################################################################################
 


package Embperl::Syntax::EmbperlHTML ;

use Embperl::Syntax qw{:types} ;
use Embperl::Syntax::HTML ;

use strict ;
use vars qw{@ISA} ;

@ISA = qw(Embperl::Syntax::HTML) ;


###################################################################################
#
#   Methods
#
###################################################################################

# ---------------------------------------------------------------------------------
#
#   Create new Syntax Object
#
# ---------------------------------------------------------------------------------

sub new

    {
    my $class = shift ;

    my $self = Embperl::Syntax::HTML::new ($class) ;

    Init ($self) ;

    return $self ;
    }



###################################################################################
#
#   Definitions for Embperl HTML tags
#
###################################################################################

sub Init

    {
    my ($self) = @_ ;

    $self -> AddInitCode ('use vars qw{$_ep_selectname};') ;

    $self -> AddTag ('input', ['type', 'name', 'value'], ['src'], ['checked'], 
                { 
                perlcode =>
                    [ 
                    'Embperl::Cmd::InputCheck (%$n%, %&*\'name%, %&*\'value%, %&\'checked%) ;  %&=-type:radio|checkbox% ',
                    '$idat{%&*\'name%}=$fdat{%&*\'name%} ; _ep_sa(%$n%, \'value\', $fdat{%&*\'name%} || \'\') ;   %&!-value%',
                    '$idat{%&*\'name%}=%&*\'value% ; ',
                    ]
                }) ;
    $self -> AddTagBlock ('textarea', ['name'], undef, undef,
                { 
                perlcode =>
                    [ 
                    '$idat{%&*\'name%}=$fdat{%&*\'name%};_ep_ac(%$n%, Embperl::Syntax::ntypText, $fdat{%&*\'name%}) ;   %#!-0%',
                    '$idat{%&*\'name%}=\'%#*0%\' ; ',
                    ]
                }) ;

    $self -> AddTagBlock ('tr', undef, undef, undef, 
                { 
                perlcode    => 'l%$p%: for (my $col = 0; $col < $maxcol; $col++) {' ,
                perlcodeend => '} %?*-htmlrow%' ,
                perlcoderemove => 1,
                stackname   => 'htmlrow',
                'push'        => '%$p%',
                mayjump     => 1,
                }) ;

    my %ProcInfoTable = (
                perlcode    => 'l%$p%: for (my $row = 0; $row < $maxrow; $row++) {' ,
                perlcodeend =>  '} %?*-htmltable%' ,
                perlcoderemove => 1,
                stackname   => 'htmltable',
                'push'        => '%$p%',
                mayjump     => 1,
            ) ;

    $self -> AddTagBlock ('table',  undef, undef, undef, \%ProcInfoTable) ;
    $self -> AddTagBlock ('ol',     undef, undef, undef, \%ProcInfoTable) ;
    $self -> AddTagBlock ('ul',     undef, undef, undef, \%ProcInfoTable) ;
    $self -> AddTagBlock ('dl',     undef, undef, undef, \%ProcInfoTable) ;
    $self -> AddTagBlock ('menu',   undef, undef, undef, \%ProcInfoTable) ;
    $self -> AddTagBlock ('dir',    undef, undef, undef, \%ProcInfoTable) ;


    $self -> AddTagBlock ('select', ['name'], undef, undef,
                { 
                stackname2   => 'htmlselect',
                push2        => '%&*\'name%',

                perlcode    => 'l%$p%: for (my $row = 0; $row < $maxrow; $row++) {' ,
                perlcodeend =>  '} %?*-htmltable%' ,
                perlcoderemove => 1,
                stackname   => 'htmltable',
                'push'        => '%$p%',
                mayjump     => 1,
                },
                {
                procinfo =>
                    {
                    'embperl#2' =>
                        {
                        perlcode => '{  my $_ep_selectname=%&*\'name%;',
                        perlcodeend => '} %&*-name%', 
                        stackname   => 'htmltable',
                        'push'        => '%$p%',
                        }
                    }
                }
            ) ;
    # option tag are _not_ added as block, to allow <option> without </option>
    # which are interpreted correct by most browsers
    $self -> AddTag ('option', ['value'], undef, ['selected'],
                { 
                perlcode =>
                    [ 
                    '_ep_opt (%$n%, $_ep_selectname, %&*\'value%, %&\'selected%);',
                    '_ep_opt (%$n%, $_ep_selectname, %>*\'1%, %&\'selected%);',
                    #'_ep_opt (%$n%, %^*htmlselect%, %&*\'value%, %&\'selected%);',
                    #'_ep_opt (%$n%, %^*htmlselect%, %>*\'1%, %&\'selected%);',
                    ]
                }) ;
    $self -> AddTagWithStart ('/option', 'option') ;

    $self -> AddTag ('a', undef, ['href'], undef, undef, undef, 1) ;
    $self -> AddTag ('frame', undef, ['src'], undef, undef, undef, 1) ; 
    $self -> AddTag ('iframe', undef, ['src'], undef, undef, undef, 1) ; 
    $self -> AddTag ('embed', undef, ['src'], undef, undef) ; 
    $self -> AddTag ('layer', undef, ['src'], undef, undef) ; 
    $self -> AddTag ('img', undef, ['src'], undef, undef) ; 
    $self -> AddTag ('form', undef, ['action'], undef, undef, undef, 2) ; 
    
    }






1;



__END__

=pod

=head1 NAME

Embperl::Syntax::EmbperlHTML

=head1 SYNOPSIS


=head1 DESCRIPTION

Class derived from Embperl::Syntax::HTML to define the syntax for 
HTML tags that Embperl processes.

=head1 Methods

I<Embperl::Syntax::EmbperlHTML> does not defines any methods.

=head1 Author

G. Richter (richter@dev.ecos.de)

=head1 See Also

Embperl::Syntax, Embperl::Syntax::HTML


