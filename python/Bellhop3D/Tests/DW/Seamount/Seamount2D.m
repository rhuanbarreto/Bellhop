clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Seamount2D:') 
disp('Coherent TL calculation') 
disp('Geometric gaussian beams')

system('bellhop3d.exe Seamount2D');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'Seamount2D.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) );

bearings = linspace(90,180,721);

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
title('Bellhop3D - Seamount2D')

disp('done.')
