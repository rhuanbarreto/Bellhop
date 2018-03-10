clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

system('cp Weymouth.bty WeymouthNx2D.bty');

disp('Bellhop3D - Weymouth (Nx2D run):') 
disp('Coherent TL calculation') 
disp('Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe WeymouthNx2D');
system('rm WeymouthNx2D.bty');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'WeymouthNx2D.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) );
tl1 = squeeze( tl(1,:,:) );

tej = flipud( jet( 256 ) );

figure(1), hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl1), shading interp, colormap( tej ), %caxis([40 80]), 
h = colorbar;
set( h, 'YDir', 'reverse' );
hold off
xlabel('Range (km)')
ylabel('Depth (m)')
title('Bellhop3D - Weymouth (Nx2D run)')
view(0,-90)

disp('done.')
