clc;clear;

% generate a number of images with trees with parallel workers
number_of_images = 2;
% generate coloured trees if 1 else trees with coloured leaves
use_coloured_trees = 0;

dirlist = size(dir('trees*.png'));
dirlist = dirlist(:,1);

parfor i = dirlist:dirlist + (number_of_images - 1)
    s = 0;
    r = true;
    fig = figure(); axis off; hold on;
    tic
    Ay = 225;
    By = Ay;
    for Ax = 0:350:1750
        Bx = Ax+50;
        if use_coloured_trees == 1
            coloured_trees(Ax,Ay,Bx,By,s,r);
        else
            trees_coloured_leaves(Ax,Ay,Bx,By,s,r);
        end
    end
    Ay = 0;
    By = Ay;    
    for Ax = 175:350:1750-175
        Bx = Ax+50;            
        if use_coloured_trees == 1
            coloured_trees(Ax,Ay,Bx,By,s,r);
        else
            trees_coloured_leaves(Ax,Ay,Bx,By,s,r);
        end
    end        
    time1 = toc;
    axis equal;
    tic
    print(['trees' num2str(i)], '-dpng', '-noui', '-r900', '-opengl');
    time2 = toc;
    hold off;
    close(fig)    
    disp(['time to generate trees: ' num2str(time1) 's; time to save trees: ' num2str(time2) 's'])
end
