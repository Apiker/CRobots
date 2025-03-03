int rng,orng,deg,odeg,dir,t,q,dam;
main()
{
/* Vai nell'angolo più vicino */
    if (loc_x()<500) sx(); else dx();
    if (loc_y()<500) dw(); else up();
    while(1)
    {
        if (UpDown())
        {
            Angle();
            if (UpDown()) Move();
        }
    }

}

up() { dir=90;  while(loc_y()<900) { drive(90,100);  Fire(); } drive(270,0); }
dw() { dir=270; while(loc_y()>100) { drive(270,100); Fire(); } drive(90,0);  }
dx() { dir=0;   while(loc_x()<900) { drive(0,100);   Fire(); } drive(180,0); }
sx() { dir=180; while(loc_x()>100) { drive(180,100); Fire(); } drive(0,0);   }

/* Attacca quando nell'angolo */
/* Se riceve danno oltre in 5% oppure ci sono robot vicino passa alla funzione Move() */

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

/* Cambia angolo */

Move()
{
    if (loc_x()<500) dx(); else sx();
}

/* Vai nell'angolo superiore al tuo nel caso fosse libero */

UpDown()
{
    if (t>15) return 1;
    if (loc_y()<500) { if (!scan(80,10) && !scan(100,10)) { up(); return 0; } }
    else { if (!scan(260,10) && !scan(280,10)) { dw(); return 0; } }
    return 1;
}

/* conta gli avversari dopo 16 tiri */

Radar()
{
    deg=-10; t=0;
    while((deg+=20)!=710) if (scan(deg,10)) ++t;
    if (t<3) return 1;
    t=0;
    return 0;
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
