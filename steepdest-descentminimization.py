#!/usr/bin/env python
# 
#
# Steepest Descent minimizer: Harmonic Potential
# Saravana P Thirumurugananndham, 05/04/2017
#
#
#

# Potential Function Parameters
k       = 2743.0                              # Harmonic force constant
r_eq    = 1.1283                              # Equilibrium distance

# Initial Search Point
r_ini   = 1.55

# Steepest Descent search
r = r_ini
step = 0.0001
E = 0.5 * k * (r - r_eq)**2                   # Energy
F = k * (r - r_eq)                            # Force   (first derivative)
print "Step Distance Energy Force Hessian "
print "0", r, E, F                            # Initial values
for i in range(1,50):                         # Iterate up to 50 times
   r = r - step*F                             # Steepest Descent update
   E = 0.5 * k * (r - r_eq)**2
   F = k * (r - r_eq)
   print i, r, E, F
   if (abs(F) < 0.01):                        # Are we at the stationary point already?
      break

