clear all, close all 

addpath /home/orodrig/FORdoc/at/Matlab/Plot
addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

disp('KRAKEN3D: Atlantic 3D')

plottri( 'lant' )

depths = 36:2:52;
for depth = depths
    filename = [ 'lanta' num2str( depth ) ];
    thecase = [ 'kraken.exe ' filename ];
    system( thecase );
end

depths = 36:2:48;
for depth = depths
    filename = [ 'lantb' num2str( depth ) ];
    thecase = [ 'kraken.exe ' filename ];
    system( thecase );
    filename = [ 'lantc' num2str( depth ) ];
    thecase = [ 'kraken.exe ' filename ];
    system( thecase );
    filename = [ 'lantd' num2str( depth ) ];
    thecase = [ 'kraken.exe ' filename ];
    system( thecase );
end

depths = 2:2:52;
for depth = depths
    filename = [ 'lante' num2str( depth, '%02i' ) ];
    thecase = [ 'kraken.exe ' filename ];
    system( thecase );
end

system( 'field3d.exe lant > field3d.prt' );

[ PlotTitle, PlotType, freq, atten, Pos, p ] = read_shd( 'lant.shd' );

zs = Pos.s.depth;

rarray = Pos.r.range; rarraykm = rarray/1000;
zarray = Pos.r.depth;

rmax = max( rarray ); rmaxkm = rmax/1000;
zmax = max( zarray );

pressure = squeeze( p );

tl = -20*log10( abs( pressure ) ); 
bearings = linspace(0,360,180);

[R,Bearings] = meshgrid(rarray,bearings);

X = R.*cos( Bearings*pi/180 ); Xkm = X/1000;
Y = R.*sin( Bearings*pi/180 ); Ykm = Y/1000;

tej = flipud( jet( 256 ) );

figure, hold on
plot(0,0,'ko',0,0,'m*','MarkerSize',16) 
pcolor(Xkm,Ykm,tl), shading interp, colormap( tej ), caxis([60 120]), 
h = colorbar;
set( h, 'YDir', 'reverse' );
hold off
xlabel('X (km)')
ylabel('Y (km)')
title('KRAKEN3D - Atlantic 3D')

disp('done.')
