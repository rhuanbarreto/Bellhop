clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

system('cp Taiwan.bty KoreanSea_demo.bty');
system('cp Taiwan.ssp KoreanSea_demo.ssp');

disp('Bellhop3D - Korean Sea 3D (Nx2D run):') 
disp('Coherent TL calculation') 
disp('Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe KoreanSea_demo');
system('rm KoreanSea_demo.bty');
system('rm KoreanSea_demo.ssp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'KoreanSea_demo.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) );
return
bearings = linspace(0,360,37);

[R,Bearings] = meshgrid(rarray,bearings);

X = R.*cos( Bearings*pi/180 ); Xkm = X/1000;
Y = R.*sin( Bearings*pi/180 ); Ykm = Y/1000;

tej = flipud( jet( 256 ) );

figure(1), hold on
plot(0,0,'ko',0,0,'m*','MarkerSize',16) 
pcolor(Xkm,Ykm,tl), shading interp, colormap( tej ), %caxis([40 80]), 
h = colorbar;
set( h, 'YDir', 'reverse' );
hold off
xlabel('X (km)')
ylabel('Y (km)')
title('Bellhop3D - Korean Sea 3D (Nx2D run)')

disp('done.')
