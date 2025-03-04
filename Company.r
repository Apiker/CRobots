int rng, orng, deg, odeg, dir, t, q, dam, aggression, nemiciRilevati, pazienza;
main()
{
    aggression = 1;  
    nemiciRilevati = 0;  
    pazienza = 100;
    if (loc_x() < 500) sx(); else dx();
    if (loc_y() < 500) dw(); else up();

    while (1)
    {
        if (UpDown())
        {
            Angle();
            if (UpDown()) Move();
        }
    }
}

up() { dir = 90; while(loc_y() < 900) { drive(90, 200); Fire(); } drive(270, 0); }
dw() { dir = 270; while(loc_y() > 100) { drive(270, 200); Fire(); } drive(90, 0); }
dx() { dir = 0; while(loc_x() < 900) { drive(0, 200); Fire(); } drive(180, 0); }
sx() { dir = 180; while(loc_x() > 100) { drive(180, 200); Fire(); } drive(0, 0); }

Angle()
{
    dam = damage();
    while ((!orng || orng > 450) && (damage() < dam + 4))
    {
        if (t > 15)
           if (Radar())
              { Stop(); while(1) { diag(); Stop(); } }       
        dam = damage();
        Fire(1);
    }
}

Move()
{
    if (aggression == 1)
    {
  
        if (loc_x() < 500) dx(); else sx();
        if (loc_y() < 500) dw(); else up();
    }
    else
    {

        if (loc_x() < 500) sx(); else dx();
        if (loc_y() < 500) dw(); else up();
    }
}

UpDown()
{
    if (t > 15) return 1;
    if (loc_y() < 500) { if (!scan(80, 10) && !scan(100, 10)) { up(); return 0; } }
    else { if (!scan(260, 10) && !scan(280, 10)) { dw(); return 0; } }
    return 1;
}

Radar()
{
    deg = -10; t = 0;
    nemiciRilevati = 0;
    while ((deg += 20) != 710)
    {
        if (scan(deg, 10))
        {
            ++t;
            nemiciRilevati++;
        }
    }
    if (t < 3) return 1;
    t = 0;
    return 0;
}

Stop()
{
    if (loc_x() < 500) if (loc_y() < 500) q = 0; else q = 3;
                else if (loc_y() < 500) q = 1; else q = 2;
    dir = 45 + 90 * q;
    drive(dir, 0);
}

diag()
{
    while ((loc_x() < 450) || (loc_x() > 550)) { drive(dir, 200); Fire(); }
    if ((scan(dir - 10, 10)) || (scan(dir + 10, 10)))
    {
        if ((scan(dir - 80, 10)) || (scan(dir - 100, 10)))
        { dir += 90; drive(dir); }
        else
        { dir -= 90; drive(dir); }
    }

    while ((loc_x() < 850) && (loc_x() > 150) &&
           (loc_y() < 850) && (loc_y() > 150)) { drive(dir, 200); Fire(); }
    Stop();
}

Fire(flag)
{
    if (orng = scan(deg, 10))
    {
        if (!scan(deg -= 5, 5)) deg += 10;
        if (orng > 700)
        {
            if (!scan(deg -= 3, 3)) deg += 6;
            cannon(deg, orng); ++t; deg += 40; return;
        }
        if(scan(deg - 5, 1)) deg -= 5;
        if(scan(deg + 5, 1)) deg += 5;
        if(scan(deg - 3, 1)) deg -= 3;
        if(scan(deg + 3, 1)) deg += 3;
        if(scan(deg - 1, 1)) deg -= 1;
        if(scan(deg + 1, 1)) deg += 1;
        if (orng = scan(odeg = deg, 5))
        {
            if(scan(deg - 5, 1)) deg -= 5;
            if(scan(deg + 5, 1)) deg += 5;
            if(scan(deg - 3, 1)) deg -= 3;
            if(scan(deg + 3, 1)) deg += 3;
            if(scan(deg - 1, 1)) deg -= 1;
            if(scan(deg + 1, 1)) deg += 1;
            if (rng = scan(deg, 10))
            {
                if (flag)
                {
                    cannon(deg + (deg - odeg) * ((1200 + rng) >> 9),
                        rng * 160 / (160 + orng - rng));
                }
                else
                {
                    cannon(deg + (deg - odeg) * ((1200 + rng) >> 9) - (sin(deg - dir) >> 14),
                        rng * 160 / (160 + orng - rng - (cos(deg - dir) >> 12)));
                }
                t = 0;
            }
        }
    }
    else
    {
        if (scan(deg -= 20, 10)) return;
        if (scan(deg += 40, 10)) return;
        deg += 40; return;
    }
}
