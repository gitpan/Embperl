
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
#   $Id: MsgIdExtract.pm,v 1.2 2002/10/22 05:39:49 richter Exp $
#
###################################################################################
 


package Embperl::Syntax::MsgIdExtract ;

use Embperl::Syntax (':types') ;

use strict ;
use vars qw{@ISA %Blocks %BlocksOutput %BlocksOutputLink} ;



@ISA = qw(Embperl::Syntax) ;


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
    my $self = shift ;

    $self = Embperl::Syntax::new ($self) ;

    if (!$self -> {-epbMsgIdExtract})
        {
        $self -> {-epbMsgIdExtract}     = $self -> CloneHash (\%Blocks) ;

        $self -> AddToRoot ($self -> {-epbMsgIdExtract}) ;
        }

    return $self ;
    }



%Blocks = (
    '-lsearch' => 1,
    'Embperl command escape' => {
        'text' => '[[',
        'nodename' => '[',
        'nodetype' => ntypCDATA,
        },
     'Embperl comment' => {
        'text' => '[#',
        'end'  => '#]',
#        'inside' => \%MetaComment,
        'procinfo' => {
            embperl => { 
                compilechilds => 0,
                removenode  => 3, 
                },
            },
        },
     'Embperl output msg id' => {
        'text' => '[=',
        'end'  => '=]',
        'unescape' => 1,
        'procinfo' => {
            embperl => { 
                    perlcode => 
                        [
                        '$Embperl::Syntax::MsgIdExtract::Ids{scalar(%#0%)} = q{} if (!exists ($Embperl::Syntax::MsgIdExtract::Ids{scalar(%#0%)})) ;', 
			],
                    removenode  => 4,
                    compilechilds => 0,
                    }
            },
        },
      ) ;  
   

1;


__END__

=pod

=head1 NAME

Embperl::Syntax::MsgIdExtract

=head1 SYNOPSIS


=head1 DESCRIPTION

Class derived from Embperl::Syntax to define the syntax for 
Embperl Blocks and metacommands.

=head1 Methods

I<Embperl::Syntax::MsgIdExtract> defines the following methods:

=head2 Embperl::Syntax::MsgIdExtract -> new  /  $self -> new

Create a new syntax class. This method should only be called inside a constructor
of a derived class.


=head2 AddMetaCmd ($cmdname, $procinfo)

Add a new metacommand with name C<$cmdname> and use processor info from
C<$procinfo>. See I<Embperl::Syntax> for a definition of procinfo.

=head2 AddMetaCmdWithEnd ($cmdname, $endname, $procinfo)

Add a new metacommand with name C<$cmdname> and use processor info from
C<$procinfo>. Addtionaly specify that a matching C<$endname> metacommand
must be found to end the block, that is started by this metacommand.
See I<Embperl::Syntax> for a definition of procinfo.

=head2 AddMetaCmdBlock ($cmdname, $endname, $procinfostart, $procinfoend)

Add a new metacommand with name C<$cmdname> and and a second metacommand
C<$endname> which ends the block that is started by C<$cmdname>.
Use processor info from C<$procinfo>.
See I<Embperl::Syntax> for a definition of procinfo.



=head1 Author

G. Richter (richter@dev.ecos.de)

=head1 See Also

Embperl::Syntax


