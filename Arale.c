int
    posy,        /* Luogo di nascita */
    pazienza, /* Pazienza di Arale */
    ang,d;       /* Angolo e distanza degli amici di Arale */
    main()
    {
        pazienza=100;
        posy=loc_y();
        if (loc_x() > 500) if (posy > 500)
        {
            /* Angolo Nord-Est */
            drive(90,100); while (loc_y()<930) hoyoyo();
            drive(90,0);   gupi_gupi();
            drive(0,100);  while (loc_x()<930) hoyoyo();
            drive(0,0);    gupi_gupi();
            while (pazienza-=1)
            {
                drive(180,100); while(loc_x() > 800) hoyoyo();
                drive(180,0);  gupi_gupi();
                drive(0,100);   while(loc_x() < 930) hoyoyo();
                drive(0,0);     gupi_gupi();
            }
            drive(270,100); while (loc_y() > 520) hoyoyo();
            drive(270,0);   gupi_gupi();
    
    }
    else
    {
        /* Angolo Sud-Est */
        drive(0,100);   while (loc_x()<930) hoyoyo();
        drive(0,0);     gupi_gupi();
        drive(270,100); while (loc_y()>70) hoyoyo();
        drive(0,0);     gupi_gupi();
        while (pazienza-=1)
        {
            drive(90,100);  while(loc_y() < 200) hoyoyo();
            drive(90,0);    gupi_gupi();
            drive(270,100); while(loc_y() >  70) hoyoyo();
            drive(270,0);   gupi_gupi();
        }
        drive(90,100); while (loc_y() < 480) hoyoyo();
        drive(90,0);   gupi_gupi();
      
    }
    else if (posy > 500)
    {
        /* Angolo Nord-Ovest */
        drive(180,100); while (loc_x()>70) hoyoyo();
        drive(180,0);   gupi_gupi();
        drive(90,100);  while (loc_y()<930) hoyoyo();
        drive(0,0);     gupi_gupi();
        while (pazienza-=1)
        {
            drive(270,100); while(loc_y() > 800) hoyoyo();
            drive(270,0);   gupi_gupi();
            drive(90,100);  while(loc_y() < 930) hoyoyo();
            drive(90,0);    gupi_gupi();
        }
        drive(270,100); while (loc_y() > 520) hoyoyo();
        drive(270,0);   gupi_gupi();
        drive(90,0);   gupi_gupi(); 
    
    }
    else
    {
        /* Angolo Sud-Ovest */
        drive(270,100); while (loc_y()>70) hoyoyo();
        drive(270,0);   gupi_gupi();
        drive(180,100); while (loc_x()>70) hoyoyo();
        drive(0,0);     gupi_gupi();
        while (pazienza-=1)
        {
            drive(0,100);   while(loc_x() < 200) hoyoyo();
            drive(0,0);     gupi_gupi();
            drive(180,100); while(loc_x() > 70) hoyoyo();
            drive(180,0);   gupi_gupi();
        }
        drive(90,100); while (loc_y() < 480) hoyoyo();
        drive(90,0);   gupi_gupi();
        drive(90,0);   gupi_gupi(); 
    
    }
    /* WOOOOOOSH!! (Aereoplano)*/
    while(1)
    {
        drive(0,100);  while (loc_x() < 900) if (scan(ang,10))
        cannon(ang+=7*(!(scan(ang+356,7)))+353*(!(scan(ang+4,7))),scan(ang,10));
        else ang+=21;
        drive(0,0);     gupi_gupi();
        drive(180,100); while (loc_x() > 100) if (scan(ang,10))
        cannon(ang+=7*(!(scan(ang+356,7)))+353*(!(scan(ang+4,7))),scan(ang,10));
        else ang+=21;
        drive(180,0);   gupi_gupi();
    }
    }
    /* Routine di attacco standard */
    hoyoyo()
    {
    if ( (d=scan(ang,10)) && (d<770) )
    {
        if (d=scan(ang+353,3)) cannon(ang+=353,d);
        else if (d=scan(ang,3)) cannon(ang,d);
        else if (d=scan(ang+7,3)) cannon(ang+=7,d);
    }
    else
    {
        if ((d=scan(ang+21,10))&&(d<700)) {ang+=21;cannon(ang,d);}
        else if ((d=scan(ang+42,10))&&(d<700)) ang+=42;
        else ang+=63;
    }
    }
    /* Routine di attacco veloce */
    gupi_gupi()
    {
        while (speed() > 49) if ((d=scan(ang,10))) cannon(ang,d);
        else ang+=21;
    }