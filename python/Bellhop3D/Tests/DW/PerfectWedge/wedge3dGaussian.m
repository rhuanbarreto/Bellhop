clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Perfect wedge:') 
disp('Coherent TL calculation') 
disp('Geometric gaussian beams')

%system('bellhop3d.exe wedge3dGaussian');

%plotshdpol( 'wedge3dGaussian.shd', xs, ys, rd )

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'wedge3dGaussian.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) );

bearings = linspace(-90,90,901);

[R,Bearings] = meshgrid(rarray,bearings);

X = R.*cos( Bearings*pi/180 ); Xkm = X/1000;
Y = R.*sin( Bearings*pi/180 ); Ykm = Y/1000;

tej = flipud( jet( 256 ) );

figure(1), hold on
plot(0,0,'ko',0,0,'m*','MarkerSize',16) 
pcolor(Xkm,Ykm,tl), shading interp, colormap( tej ), caxis([40 180]), 
h = colorbar;
set( h, 'YDir', 'reverse' );
hold off
xlabel('X (km)')
ylabel('Y (km)')
title('Bellhop3D - Perfect wedge')

disp('done.')
