/* Copyright (C) 2013-2019 Free Software Foundation, Inc.
   This file is part of the GNU C Library

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public License as
   published by the Free Software Foundation; either version 2 of the
   License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with the GNU C Library; see the file COPYING.LIB.  If
   not, see <http://www.gnu.org/licenses/>.  */

#include <math.h>
#include <math_ldbl_opt.h>
#include <libm-alias-double.h>

double
__modf (double x, double *iptr)
{
  if (__builtin_isinf (x))
    {
      *iptr = x;
      return copysign (0.0, x);
    }
  else if (__builtin_isnan (x))
    {
      *iptr = NAN;
      return NAN;
    }

  if (x >= 0.0)
    {
      *iptr = floor (x);
      return copysign (x - *iptr, x);
    }
  else
    {
      *iptr = ceil (x);
      return copysign (x - *iptr, x);
    }
}
libm_alias_double (__modf, modf)
#if LONG_DOUBLE_COMPAT (libc, GLIBC_2_0)
compat_symbol (libc, __modf, modfl, GLIBC_2_0);
#endif
