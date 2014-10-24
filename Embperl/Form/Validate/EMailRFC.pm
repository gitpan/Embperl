
###################################################################################
#
#   Embperl  - Copyright (c) 1997-2005 Gerald Richter / ecos gmbh   www.ecos.de
#
#   You may distribute under the terms of either the GNU General Public
#   License or the Artistic License, as specified in the Perl README file.
#
#   THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
#   IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
#   WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
#   $Id: EMailRFC.pm,v 1.3 2005/08/07 00:03:01 richter Exp $
#
###################################################################################


package Embperl::Form::Validate::EMailRFC ;

use base qw(Embperl::Form::Validate::EMail);

# --------------------------------------------------------------

sub validate 
    {
    my ($self, $key, $value, $fdat, $pref) = @_ ;
    
    # The valid address "user@tld" or local addresses are valid in this RFC conforming ruleset
    if ($value !~ /^[^ <>()@�-�]+@[^ <>()@�-�]+$/ or
	$value =~ /@(\.|.*(\.\.|@))/)
	{
	return ['validate_email', $value, $key] ;
	}

    if ($value =~ /^mailto:/i)
	{
	return ['validate_email_nomailto', $value, $key] ;
	}

    return undef ;
    }

# --------------------------------------------------------------

sub getscript_validate 
    {
    my ($self, $arg, $pref) = @_ ;
    
    return ('((obj.value.search(/^[^ <>()@�-�]+@[^ <>()@�-�]+$/) >= 0) && (obj.value.search(/@(\.|.*(\.\.|@))|mailto:/i) < 0))', 
	    ['validate_email', "'+obj.value+'"]) ;
    }

1;
