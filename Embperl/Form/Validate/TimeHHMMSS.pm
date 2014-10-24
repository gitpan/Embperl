
###################################################################################
#
#   Embperl - Copyright (c) 1997-2005 Gerald Richter / ecos gmbh   www.ecos.de
#
#   You may distribute under the terms of either the GNU General Public
#   License or the Artistic License, as specified in the Perl README file.
#
#   THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
#   IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
#   WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
#   $Id: TimeHHMMSS.pm 294756 2005-08-07 00:03:03Z richter $
#
###################################################################################


package Embperl::Form::Validate::Time_Long ;

use base qw(Embperl::Form::Validate::Default);

my %error_messages = 
(
    de => 
    {
	validate_time_long => 'Feld %0: "%1" ist kein g�ltiges Zeitformat. Geben Sie die Zeit in der Form hh:mm:ss ein',
    },

    en =>
    {
	validate_time_long => 'Field %0: "%1" isn\\\'t a valid time. Please enter the time as hh:mm:ss',
    }
 );

# --------------------------------------------------------------

sub getmsg
    {
    my ($self, $id, $language, $default_language) = @_ ;

    return $error_messages{$language}{$id} || 
           $error_messages{$default_language}{$id} ||
           $self -> SUPER::getmsg ($id, $language, $default_language) ;
    }


# --------------------------------------------------------------

sub validate 
    {
    my ($self, $key, $value, $fdat, $pref) = @_ ;

    if($value =~ /^(\d\d):(\d\d):(\d\d)$/)
	{
	if ($1 < 0 || $1 > 23 ||
	    $2 < 0 || $2 > 59 ||
        $3 < 0 || $3 > 59)
	    {
            return ['validate_time_long', $value] ;
	    }
	return undef ;
	}
    return ['validate_time_long', $value] ;
    }

# --------------------------------------------------------------

sub getscript_validate
    {
    my ($self, $arg, $pref) = @_ ;

    return ('obj.value.search(/^\d\d:\d\d:\d\d$/) >= 0', ['validate_time_long', "'+obj.value+'"]) ;
    }


1;
