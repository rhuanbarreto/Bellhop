% Tabulated Reflection Coefficient test cases
% mbp

clear all, close all 

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

system( 'kraken.exe neggradK_geo' );   % reference solution (full geoacoustic bottom)
system( 'fields.exe neggradK_geo < neggradK_geo.flp' );

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'neggradK_geo.shd' );

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
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([60 130]), colorbar
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('KRAKEN - full geoacoustic bottom')

system( 'bounce.exe neggradB' );

system( 'cp neggradB.brc neggradK_brc.brc' );
system( 'kraken.exe neggradK_brc' );

system( 'fields.exe neggradK_brc < neggradK_brc.flp' );

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'neggradK_brc.shd' );

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
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([60 130]), colorbar
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('KRAKEN - Tabulated Reflection Coefficient')

system( 'cp neggradB.irc neggradK_irc.irc' );
system( 'kraken.exe neggradK_irc' );

system( 'fields.exe neggradK_irc < neggradK_irc.flp > neggradK_irc.prt' );

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'neggradK_irc.shd' );

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
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([60 130]), colorbar
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('KRAKEN - Tabulated Reflection Coefficient')

system( 'krakenc.exe neggradC_geo' );   % reference solution (full geoacoustic bottom)
system( 'fields.exe neggradC_geo < neggradC_geo.flp' );

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'neggradC_geo.shd' );

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
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([60 130]), colorbar
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('KRAKEN - full geoacoustic bottom')

system( 'cp neggradB.brc neggradC_brc.brc' );

system( 'krakenc.exe neggradC_brc' );
system( 'fields.exe neggradC_brc < neggradC_brc.flp' );

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'neggradC_brc.shd' );

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
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([60 130]), colorbar
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('KRAKEN - Tabulated Reflection Coefficient')

system( 'cp neggradB.irc neggradC_irc.irc' );
system( 'krakenc.exe neggradC_irc' );

system( 'fields.exe neggradC_irc < neggradC_irc.flp' );

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'neggradC_irc.shd' );

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
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), caxis([60 130]), colorbar
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('KRAKEN - Tabulated Reflection Coefficient')

disp('done.')
