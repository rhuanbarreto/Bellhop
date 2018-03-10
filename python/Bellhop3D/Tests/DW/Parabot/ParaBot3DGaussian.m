clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Parabolic bottom profile:') 
disp('Coherent TL calculation') 
disp('Geometric gaussian beams')

system('cp ParaBot.ati ParaBot3DGaussian.ati');
system('cp ParaBot.bty ParaBot3DGaussian.bty');
system('bellhop3d.exe ParaBot3DGaussian');
system('rm ParaBot3DGaussian.ati');
system('rm ParaBot3DGaussian.bty');

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'ParaBot3DGaussian.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) );

tej = flipud( jet( 256 ) );

figure(1), hold on
plot(0,zs,'ko',0,zs,'m*','MarkerSize',16) 
pcolor(rarraykm,zarray,tl), shading interp, colormap( tej ), %caxis([40 80]), 
h = colorbar;
set( h, 'YDir', 'reverse' );
hold off
xlabel('X (km)')
ylabel('Y (km)')
title('Bellhop3D - Parabolic bottom profile')
view(0,-90)

disp('done.')
