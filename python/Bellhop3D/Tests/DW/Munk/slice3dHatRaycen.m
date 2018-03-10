clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Munk SSP:') 
disp('Coherent TL calculation')
disp('Geometric gaussian beams')

system('bellhop3d.exe slice3dHatRaycen');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'slice3dHatRaycen.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl  = -20*log10( abs( pressure ) );
tl1 = squeeze( tl(1,:,:) );
tl2 = squeeze( tl(2,:,:) );

tej = flipud( jet( 256 ) );

figure(1), hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl1), shading interp, colormap( tej ), caxis([40 150]), 
h = colorbar;
set( h, 'YDir', 'reverse' );
hold off
xlabel('Range (km)')
ylabel('Depth (m)')
title('Bellhop3D - Munk SSP')
view(0,-90)

figure(2), hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl1), shading interp, colormap( tej ), caxis([40 150]), 
h = colorbar;
set( h, 'YDir', 'reverse' );
hold off
xlabel('Range (km)')
ylabel('Depth (m)')
title('Bellhop3D - Munk SSP')
view(0,-90)

disp('done.')
