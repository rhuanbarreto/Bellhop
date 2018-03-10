% Tabulated Reflection Coefficient test cases
% mbp

clear all, close all 

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

system( 'scooter.exe neggradS_geo' );   % reference solution (full geoacoustic bottom)
system( 'fields.exe neggradS_geo < neggradS_geo.flp' );

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'neggradS_geo.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) ); 

tej = flipud( jet( 256 ) );

figure, hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([60 130]),
h = colorbar;
set( h, 'YDir', 'reverse' );
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('SCOOTER - full geoacoustic bottom')

system( 'bounce.exe neggradB' );

system( 'cp neggradB.brc neggradS_brc.brc' );
system( 'scooter.exe neggradS_brc' );
system( 'fields.exe neggradS_brc < neggradS_brc.flp' );

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'neggradS_brc.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) ); 

tej = flipud( jet( 256 ) );

figure, hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([60 130]),
h = colorbar;
set( h, 'YDir', 'reverse' );
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('SCOOTER - Tabulated Reflection Coefficient')

system( 'cp neggradB.irc neggradS_irc.irc' );
system( 'scooter.exe neggradS_irc' );
system( 'fields.exe neggradS_irc < neggradS_irc.flp' );

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'neggradS_irc.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) ); 

tej = flipud( jet( 256 ) );

figure, hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([60 130]),
h = colorbar;
set( h, 'YDir', 'reverse' );
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('SCOOTER - Tabulated Reflection Coefficient')

disp('done.')
