
/*
 * *********** WARNING **************
 * This file generated by Embperl::WrapXS/0.01
 * Any changes made here will be lost
 * ***********************************
 * 1. /opt/perlt5.8.0/lib/site_perl/5.8.0/ExtUtils/XSBuilder/WrapXS.pm:38
 * 2. /opt/perlt5.8.0/lib/site_perl/5.8.0/ExtUtils/XSBuilder/WrapXS.pm:2073
 * 3. xsbuilder/xs_generate.pl:6
 */


#include "ep.h"

#include "epmacro.h"

#include "epdat2.h"

#include "eptypes.h"

#include "eppublic.h"

#include "EXTERN.h"

#include "perl.h"

#include "XSUB.h"

#include "ep_xs_sv_convert.h"

#include "ep_xs_typedefs.h"



void Embperl__Req__Config_destroy (pTHX_ Embperl__Req__Config  obj) {
            if (obj -> pAllow)
                SvREFCNT_dec(obj -> pAllow);
            if (obj -> pPathAV)
                SvREFCNT_dec(obj -> pPathAV);

};



void Embperl__Req__Config_new_init (pTHX_ Embperl__Req__Config  obj, SV * item, int overwrite) {

    SV * * tmpsv ;

    if (SvTYPE(item) == SVt_PVMG) 
        memcpy (obj, (void *)SvIVX(item), sizeof (*obj)) ;
    else if (SvTYPE(item) == SVt_PVHV) {
        if ((tmpsv = hv_fetch((HV *)item, "allow", sizeof("allow") - 1, 0)) || overwrite) {
            CV * tmpobj = ((CV *)epxs_sv2_SVPTR((tmpsv && *tmpsv?*tmpsv:&PL_sv_undef)));
            if (tmpobj)
                obj -> pAllow = (CV *)SvREFCNT_inc(tmpobj);
            else
                obj -> pAllow = NULL ;
        }
        if ((tmpsv = hv_fetch((HV *)item, "mult_field_sep", sizeof("mult_field_sep") - 1, 0)) || overwrite) {
            obj -> cMultFieldSep = (char)epxs_sv2_CHAR((tmpsv && *tmpsv?*tmpsv:&PL_sv_undef)) ;
        }
        if ((tmpsv = hv_fetch((HV *)item, "path", sizeof("path") - 1, 0)) || overwrite) {
            AV * tmpobj = ((AV *)epxs_sv2_AVREF((tmpsv && *tmpsv?*tmpsv:&PL_sv_undef)));
            if (tmpobj)
                obj -> pPathAV = (AV *)SvREFCNT_inc(tmpobj);
            else
                obj -> pPathAV = NULL ;
        }
        if ((tmpsv = hv_fetch((HV *)item, "output_mode", sizeof("output_mode") - 1, 0)) || overwrite) {
            obj -> nOutputMode = (int)epxs_sv2_IV((tmpsv && *tmpsv?*tmpsv:&PL_sv_undef)) ;
        }
        if ((tmpsv = hv_fetch((HV *)item, "debug", sizeof("debug") - 1, 0)) || overwrite) {
            obj -> bDebug = (unsigned)epxs_sv2_UV((tmpsv && *tmpsv?*tmpsv:&PL_sv_undef)) ;
        }
        if ((tmpsv = hv_fetch((HV *)item, "options", sizeof("options") - 1, 0)) || overwrite) {
            obj -> bOptions = (unsigned)epxs_sv2_UV((tmpsv && *tmpsv?*tmpsv:&PL_sv_undef)) ;
        }
        if ((tmpsv = hv_fetch((HV *)item, "session_mode", sizeof("session_mode") - 1, 0)) || overwrite) {
            obj -> nSessionMode = (int)epxs_sv2_IV((tmpsv && *tmpsv?*tmpsv:&PL_sv_undef)) ;
        }
   ; }

    else
        croak ("initializer for Embperl::Req::Config::new is not a hash or object reference") ;

} ;


MODULE = Embperl::Req::Config    PACKAGE = Embperl::Req::Config 

CV *
allow(obj, val=NULL)
    Embperl::Req::Config obj
    CV * val
  PREINIT:
    /*nada*/

  CODE:
    RETVAL = (CV *)  obj->pAllow;

    if (items > 1) {
        obj->pAllow = (CV *)SvREFCNT_inc(val);
    }
  OUTPUT:
    RETVAL

MODULE = Embperl::Req::Config    PACKAGE = Embperl::Req::Config 

char
mult_field_sep(obj, val=NULL)
    Embperl::Req::Config obj
    char val
  PREINIT:
    /*nada*/

  CODE:
    RETVAL = (char)  obj->cMultFieldSep;

    if (items > 1) {
        obj->cMultFieldSep = (char) val;
    }
  OUTPUT:
    RETVAL

MODULE = Embperl::Req::Config    PACKAGE = Embperl::Req::Config 

AV *
path(obj, val=NULL)
    Embperl::Req::Config obj
    AV * val
  PREINIT:
    /*nada*/

  CODE:
    RETVAL = (AV *)  obj->pPathAV;

    if (items > 1) {
        obj->pPathAV = (AV *)SvREFCNT_inc(val);
    }
  OUTPUT:
    RETVAL

MODULE = Embperl::Req::Config    PACKAGE = Embperl::Req::Config 

int
output_mode(obj, val=0)
    Embperl::Req::Config obj
    int val
  PREINIT:
    /*nada*/

  CODE:
    RETVAL = (int)  obj->nOutputMode;

    if (items > 1) {
        obj->nOutputMode = (int) val;
    }
  OUTPUT:
    RETVAL

MODULE = Embperl::Req::Config    PACKAGE = Embperl::Req::Config 

unsigned
debug(obj, val=0)
    Embperl::Req::Config obj
    unsigned val
  PREINIT:
    /*nada*/

  CODE:
    RETVAL = (unsigned)  obj->bDebug;

    if (items > 1) {
        obj->bDebug = (unsigned) val;
    }
  OUTPUT:
    RETVAL

MODULE = Embperl::Req::Config    PACKAGE = Embperl::Req::Config 

unsigned
options(obj, val=0)
    Embperl::Req::Config obj
    unsigned val
  PREINIT:
    /*nada*/

  CODE:
    RETVAL = (unsigned)  obj->bOptions;

    if (items > 1) {
        obj->bOptions = (unsigned) val;
    }
  OUTPUT:
    RETVAL

MODULE = Embperl::Req::Config    PACKAGE = Embperl::Req::Config 

int
session_mode(obj, val=0)
    Embperl::Req::Config obj
    int val
  PREINIT:
    /*nada*/

  CODE:
    RETVAL = (int)  obj->nSessionMode;

    if (items > 1) {
        obj->nSessionMode = (int) val;
    }
  OUTPUT:
    RETVAL

MODULE = Embperl::Req::Config    PACKAGE = Embperl::Req::Config 



SV *
new (class,initializer=NULL)
    char * class
    SV * initializer 
PREINIT:
    SV * svobj ;
    Embperl__Req__Config  cobj ;
    SV * tmpsv ;
CODE:
    epxs_Embperl__Req__Config_create_obj(cobj,svobj,RETVAL,malloc(sizeof(*cobj))) ;

    if (initializer) {
        if (!SvROK(initializer) || !(tmpsv = SvRV(initializer))) 
            croak ("initializer for Embperl::Req::Config::new is not a reference") ;

        if (SvTYPE(tmpsv) == SVt_PVHV || SvTYPE(tmpsv) == SVt_PVMG)  
            Embperl__Req__Config_new_init (aTHX_ cobj, tmpsv, 0) ;
        else if (SvTYPE(tmpsv) == SVt_PVAV) {
            int i ;
            SvGROW(svobj, sizeof (*cobj) * av_len((AV *)tmpsv)) ;     
            for (i = 0; i <= av_len((AV *)tmpsv); i++) {
                SV * * itemrv = av_fetch((AV *)tmpsv, i, 0) ;
                SV * item ;
                if (!itemrv || !*itemrv || !SvROK(*itemrv) || !(item = SvRV(*itemrv))) 
                    croak ("array element of initializer for Embperl::Req::Config::new is not a reference") ;
                Embperl__Req__Config_new_init (aTHX_ &cobj[i], item, 1) ;
            }
        }
        else {
             croak ("initializer for Embperl::Req::Config::new is not a hash/array/object reference") ;
        }
    }
OUTPUT:
    RETVAL 

MODULE = Embperl::Req::Config    PACKAGE = Embperl::Req::Config 



void
DESTROY (obj)
    Embperl::Req::Config  obj 
CODE:
    Embperl__Req__Config_destroy (aTHX_ obj) ;

PROTOTYPES: disabled

BOOT:
    items = items; /* -Wall */

