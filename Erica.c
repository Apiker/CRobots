int  direz, alfa, range, dato, grado;
main()
{
    direz = rand(360); /* DEFINISCE UNA DIREZIONE A CASO */
    grado = rand(360); /* DEFINISCE LA DIREZION DEL CANNONE */
    while (1)
    {
        drive(direz, 100);
        if (loc_y() > 850) /* GIUNTO AI MARGINI CAMBIA */
            direz = 180 + rand(180); /* DIREZIONE CASUALMENTE */
        if (loc_y() < 150)
            direz = rand(180);
        if (loc_x() > 850)
            direz = 90 + rand(180);
        if (loc_x() < 150)
            direz = 270 + rand(180);    
        range = scan(grado, 20); /* RICERCA PRESENZA ROBOTS */    
        if (range > 0)
        {
            cannon(grado, range); /* CE N'è UNO? FUOCO!!!! */    
            cannon(grado, range);    
        }    
        else
            grado = grado + 20; /* NON C'ERA? INCREMENTA ANGOLAZIONE */
    }
}