int b,rng,orng,tt,deg,odeg,dir,t,q,dam,reg;

main()
{
    if (loc_x()<500) {sx(70);
    if ((!scan(90,10))&&(!scan(70,10))) up(930); else dw(70);}
    else {dx(930);
    if ((!scan(90,10))&&(!scan(110,10))) up(930); else dw(70);}
    deg=3600;
    tt=1;
    while(1)
    {
    dam=damage();
    while ((!orng || orng>450) && (damage()<dam+5))
    {
        if (t>12)
            if (Radar()) End();
        dam=damage();
        Fire(1);

        if (UpDown())
        {
            Angle();
            if (UpDown()) Move();
        }
    }
    b=(loc_x()>500)+2*(loc_y()>500);
            if (b==0)     {dx(300);if (!scan(350,10)&&!scan(10,10)) dx(930); else {sx(70);
            up(300);if (!scan(95,10)&&!scan(75,10)) up(930); else dw(70);}}
            else if (b==1) {up(300);if (!scan(85,10)&&!scan(105,10)) up(930); else {dw(70);
            sx(700);if (!scan(185,10)&&!scan(165,10)) sx(70); else dx(930);}}
            else if (b==2) {dx(300);if (!scan(10,10)&&!scan(350,10)) dx(930); else {sx(70);
            dw(700);if (!scan(265,10)&&!scan(285,10)) dw(70); else up(930);}}
            else           {dw(700);if (!scan(275,10)&&!scan(255,10)) dw(70); else {up(930);
            sx(700);if (!scan(175,10)&&!scan(195,10)) sx(70); else dx(930);}}
        }
}

up(l) { dir=90;  while(loc_y()<l) { drive(90,100);  Fire(); } drive(270,0); }
dw(l) { dir=270; while(loc_y()>l) { drive(270,100); Fire(); } drive(90,0);  }
dx(l) { dir=0;    while(loc_x()<l) { drive(0,100);   Fire(); } drive(180,0); }
sx(l) { dir=180; while(loc_x()>l) { drive(180,100); Fire(); } drive(0,0);    }

Radar()
{
    reg=10; t=0;
    while((reg+=20)!=730) if (scan(reg,10)) if(++t>2) {t=0; return 0;}
    return 1;
}

End(){
        tt=0;
        dw(550);up(450);
        while(1) {
                        dx(850);sx(150);
                        }
}

Move()
{
    if (loc_x()<500) dx(); else sx();
}

UpDown()
{
    if (t>15) return 1;
    if (loc_y()<500) { if (!scan(80,10) && !scan(100,10)) { up(); return 0; } }
    else { if (!scan(260,10) && !scan(280,10)) { dw(); return 0; } }
    return 1;
}

Angle()
{
    dam=damage();
    while ((!orng || orng>450) && (damage()<dam+4))
    {
        if (t>15)
           if (Radar())
              { Stop(); while(1) { diag(); Stop(); } }       
        dam=damage();
        Fire(1);
    }
}

Stop()
{
    if (loc_x()<500) if (loc_y()<500) q=0; else q=3;
                else if (loc_y()<500) q=1; else q=2;
    dir=45+90*q;
    drive(dir,0);
}

diag()
{
    while ((loc_x()<450) || (loc_x()>550)) { drive(dir,100); Fire(); }
if ((scan(dir-10,10)) || (scan(dir+10,10)))
{
    if ((scan(dir-80,10)) || (scan(dir-100,10)))
    { dir+=90; drive(dir); }
    else
    { dir-=90; drive(dir); }
}

while ((loc_x() < 850) && (loc_x() > 150) &&
       (loc_y() < 850) && (loc_y() > 150)) { drive(dir,100); Fire(); }
Stop();
}

Fire(flag)
{
    if (orng=scan(deg,10))
    {
        if (!scan(deg-=5,5)) deg+=10;
        if (tt) if (orng>770)
        {
            if (!scan(deg-=3,3)) deg+=6;
            cannon(deg,orng); ++t; deg+=40; return;
        }

        if(scan(deg-5,1)) deg-=5;
        if(scan(deg+5,1)) deg+=5;
        if(scan(deg-3,1)) deg-=3;
        if(scan(deg+3,1)) deg+=3;
        if(scan(deg-1,1)) deg-=1;
        if(scan(deg+1,1)) deg+=1;

        if (orng=scan(odeg=deg,5))
        {
            if(scan(deg-5,1)) deg-=5;
            if(scan(deg+5,1)) deg+=5;
            if(scan(deg-3,1)) deg-=3;
            if(scan(deg+3,1)) deg+=3;
            if(scan(deg-1,1)) deg-=1;
            if(scan(deg+1,1)) deg+=1;

            if (rng=scan(deg,10))
            {
                if (flag)
                {
                cannon(deg+(deg-odeg)*((1200+rng)>>9),
                                rng*160/(160+orng-rng));
                }
                else
                {
                cannon(deg+(deg-odeg)*((1200+rng)>>9)-(sin(deg-dir)>>14),
                                rng*165/(165+orng-rng-(cos(deg-dir)>>12)));
                }
                t=0;
            }
        }
    }
    else
    {
        if (scan(deg-=20,10)) return;
        if (scan(deg+=40,10)) return;
        deg+=40; return;
    }
}
