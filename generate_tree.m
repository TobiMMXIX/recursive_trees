clc;clear;

% generate a number of trees
number_of_trees = 1;
% generate coloured trees if true else trees with coloured leaves
use_coloured_trees = false;

dirlist = size(dir('tree*.png'));
dirlist = dirlist(:,1);

for i = dirlist:dirlist + (number_of_trees - 1)
    fig = figure(); axis off; hold on;
    Ax = -25;
    Ay = 0.0;
    Bx = 25;
    By = Ay;
    s = 0;
    r = true;
    tic
    if use_coloured_trees
        coloured_trees(Ax,Ay,Bx,By,s,r);
    else
        trees_coloured_leaves(Ax,Ay,Bx,By,s,r);
    end
    time1 = toc;
    axis equal;
    tic
    print(['tree' num2str(i)], '-dpng', '-noui', '-r900', '-opengl');
    time2 = toc;
    hold off;
    close(fig)
    disp(['time to generate tree: ' num2str(time1) 's; time to save tree: ' num2str(time2) 's'])
end
