#==================================================================
#  
#  KRAKEN: Tabulated Reflection Coefficient test cases
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

print("KRAKEN - Tabulated Reflection Coefficient test cases")

system( "kraken.exe neggradK_geo" ) # reference solution (full geoacoustic bottom)
system( "fields.exe neggradK_geo < neggradK_geo.flp" )

filename = 'neggradK_geo.shd'
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
title('KRAKEN - full geoacoustic bottom')
ylim(Dmax,0)

system( "bounce.exe neggradB" )

system( "cp neggradB.brc neggradK_brc.brc" )
system( "kraken.exe neggradK_brc" )
system( "fields.exe neggradK_brc < neggradK_brc.flp" )

filename = 'neggradK_brc.shd'
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
title('KRAKEN - Tabulated Reflection Coefficient')
ylim(Dmax,0)

system( "cp neggradB.irc neggradK_irc.irc" )
system( "kraken.exe neggradK_irc" )
system( "fields.exe neggradK_irc < neggradK_irc.flp" )

filename = 'neggradK_irc.shd'
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
title('KRAKEN - Tabulated Reflection Coefficient')
ylim(Dmax,0)

show()

print("done.")
