clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - lower halfspace:') 
disp('TL calculation, Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe lower_halfB');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'lower_halfB.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) );

tl1 = squeeze( tl(1,:,:) );
tl2 = squeeze( tl(2,:,:) );

tej = flipud( jet( 256 ) );

figure(1), hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl1), shading interp, colormap( tej ), caxis([20 90]), 
h = colorbar;
set( h, 'YDir', 'reverse' );
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('Bellhop3D - halfspace, bearing 0 degrees')

figure(2), hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl2), shading interp, colormap( tej ), caxis([20 90]), 
h = colorbar;
set( h, 'YDir', 'reverse' );
axis([0 rmaxkm 0 zmax])
hold off
view(0,-90)
xlabel('Range (km)')
ylabel('Depth (m)')
title('Bellhop3D - halfspace, bearing 1 degree')

disp('done.')
