clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

system('cp Taiwan.bty Taiwan3D.bty');
system('cp Taiwan.ssp Taiwan3D.ssp');

disp('Bellhop3D - Taiwan (3D run):') 
disp('Coherent TL calculation') 
disp('Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe Taiwan3D');
system('rm Taiwan3D.bty');
system('rm Taiwan3D.ssp');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'Taiwan3D.shd' );

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
xlabel('X (km)')
ylabel('Y (km)')
title('Bellhop3D - Taiwan (3D run)')
view(0,-90)

disp('done.')
