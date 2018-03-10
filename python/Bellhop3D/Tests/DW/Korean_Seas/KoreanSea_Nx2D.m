clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

system('cp KoreanSea.bty KoreanSea_Nx2D.bty');
system('cp KoreanSea.ssp KoreanSea_Nx2D.ssp');

disp('Bellhop3D - Korean Sea 3D (Nx2D run):') 
disp('Coherent TL calculation') 
disp('Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe KoreanSea_Nx2D');
system('rm KoreanSea_Nx2D.bty');
system('rm KoreanSea_Nx2D.ssp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'KoreanSea_Nx2D.shd' );

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
plot(0,0,'ko',0,0,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl1), shading interp, colormap( tej ), %caxis([40 80]), 
h = colorbar;
set( h, 'YDir', 'reverse' );
hold off
xlabel('Range (km)')
ylabel('Depth (m)')
title('Bellhop3D - Korean Sea 3D (Nx2D run)')
view(0,-90)

disp('done.')
