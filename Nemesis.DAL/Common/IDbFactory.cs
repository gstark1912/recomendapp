using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.DAL.Common
{

    public interface IDbFactory : IDisposable
    {
        NemesisContext Init();
    }

}
