using Microsoft.EntityFrameworkCore;
using Nemesis.DAL.Entities;
using System;
using System.Linq;

namespace Nemesis.DAL
{
    public static class NemesisInitializer
    {
        public static void Initialize(NemesisContext context)
        {
            context.Database.Migrate();




            if (!context.Initiatives.Any())
            {
                var initiatives = new Initiative[]
                {
                new Initiative{  Name = "Marketing", ShortName = "MKT" },
                new Initiative{  Name = "HAT", ShortName = "HAT" },
                new Initiative{  Name = "Aplicaciones internas", ShortName = "AP" },
                new Initiative{  Name = "Capacitación", ShortName = "CAP" },
                new Initiative{  Name = "Proyectos Solidarios", ShortName = "PS" },
                new Initiative{  Name = "Green Team", ShortName = "GT" },
                new Initiative{  Name = "Recursos Humanos", ShortName = "RH" },
                new Initiative{  Name = "Software Engineering Process Group", ShortName = "SEPG" }
                };

                foreach (Initiative i in initiatives)
                {
                    context.Initiatives.Add(i);
                }
                context.SaveChanges();
            }


        }
    }
}
