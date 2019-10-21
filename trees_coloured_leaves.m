function trees_coloured_leaves(Ax,Ay,Bx,By,s,r)
%tree with coloured leaves
if nargin < 4
    Ax = -25.0;
    Ay = 0.0;
    Bx = 25.0;
    By = 0.0;
    s = 0.5;
    r = false;
elseif nargin < 5
    s = 0.5;
    r = false;
elseif nargin < 6
    r = false;
end

if r || s < 0.2 || s > 0.8
    s = (0.8-0.2).*rand() + .2;
end

Cx = Bx+Ay-By;
Cy = By+Bx-Ax;
Dx = Ax+Ay-By;
Dy = Ay+Bx-Ax;
Ex = ((1 - s) * Dx + s * Cx + sqrt(s * (1 - s)) * (Dy - Cy));
Ey = ((1 - s) * Dy + s * Cy + sqrt(s * (1 - s)) * (Cx - Dx));
    
x = [Ax,Bx,Cx,Dx,Ax];
y = [Ay,By,Cy,Dy,Ay];
ab = sqrt((Bx-Ax).^2+(By-Ay).^2);
if(ab >= 2.0)
    fill(x,y,'k');
    x = [Cx,Dx,Ex,Cx];
    y = [Cy,Dy,Ey,Cy];
    plot(x,y,'k');
    trees_coloured_leaves(Dx,Dy,Ex,Ey,s,r);
    trees_coloured_leaves(Ex,Ey,Cx,Cy,s,r);
else
    c = rand(1,3);        
    h = fill(x,y,c);
    set(h,'EdgeColor',c)
end
end
