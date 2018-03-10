#==================================================================
#  
#  SCOOTER: Tabulated Reflection Coefficient test cases
#  Mexilhoeira Grande, Sab Jul 29 11:58:02 WEST 2017
#  Written by Tordar
#  
#==================================================================

# ipython: run neggradB

from os import *
import sys
from numpy import *
from scipy.io import *
from pylab import *
sys.path.append ("/home/orodrig/FORdoc/at/Python/")
from readshd import *

rs = 0.0

print("SCOOTER - Tabulated Reflection Coefficient test cases")

system( "scooter.exe neggradS_geo" ) # reference solution (full geoacoustic bottom)
system( "fields.exe neggradS_geo < neggradS_geo.flp" )

filename = 'neggradS_geo.shd'
xs = nan
ys = nan
pressure,geometry = readshd(filename,xs,ys)

zs     = geometry["zs"]
rarray = geometry["rarray"]; rarraykm = rarray/1000
zarray = geometry["zarray"]

Dmax = zarray[-1]
rmax = rarray[-1]; rmaxkm = rmax/1000

p = squeeze( pressure, axis=(0,1) )
tl = -20*log10( abs( p ) )

figure(1)
imshow(tl,extent=[0,rmaxkm,0,Dmax],aspect='auto',cmap='jet_r',origin='lower',vmin=60,vmax=130)
cb = colorbar()
cb.ax.invert_yaxis()
plot(rs,-zs,marker="<",markersize=16,color="k")
xlabel('Range (km)')
ylabel('Depth (m)')
title('SCOOTER - full geoacoustic bottom')
ylim(Dmax,0)

system( "bounce.exe neggradB" )

system( "cp neggradB.brc neggradS_brc.brc" )
system( "scooter.exe neggradS_brc" )
system( "fields.exe neggradS_brc < neggradS_brc.flp" )

filename = 'neggradS_brc.shd'
xs = nan
ys = nan
pressure,geometry = readshd(filename,xs,ys)

zs     = geometry["zs"]
rarray = geometry["rarray"]; rarraykm = rarray/1000
zarray = geometry["zarray"]

Dmax = zarray[-1]
rmax = rarray[-1]; rmaxkm = rmax/1000

p = squeeze( pressure, axis=(0,1) )
tl = -20*log10( abs( p ) )

figure(2)
imshow(tl,extent=[0,rmaxkm,0,Dmax],aspect='auto',cmap='jet_r',origin='lower',vmin=60,vmax=130)
cb = colorbar()
cb.ax.invert_yaxis()
plot(rs,-zs,marker="<",markersize=16,color="k")
xlabel('Range (km)')
ylabel('Depth (m)')
title('SCOOTER - Tabulated Reflection Coefficient')
ylim(Dmax,0)

system( "cp neggradB.irc neggradS_irc.irc" )
system( "scooter.exe neggradS_irc" )
system( "fields.exe neggradS_irc < neggradS_irc.flp" )

filename = 'neggradS_irc.shd'
xs = nan
ys = nan
pressure,geometry = readshd(filename,xs,ys)

zs     = geometry["zs"]
rarray = geometry["rarray"]; rarraykm = rarray/1000
zarray = geometry["zarray"]

Dmax = zarray[-1]
rmax = rarray[-1]; rmaxkm = rmax/1000

p = squeeze( pressure, axis=(0,1) )
tl = -20*log10( abs( p ) )

figure(3)
imshow(tl,extent=[0,rmaxkm,0,Dmax],aspect='auto',cmap='jet_r',origin='lower',vmin=60,vmax=130)
cb = colorbar()
cb.ax.invert_yaxis()
plot(rs,-zs,marker="<",markersize=16,color="k")
xlabel('Range (km)')
ylabel('Depth (m)')
title('SCOOTER - Tabulated Reflection Coefficient')
ylim(Dmax,0)

show()

print("done.")
