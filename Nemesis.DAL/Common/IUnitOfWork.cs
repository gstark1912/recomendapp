using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.DAL.Common
{
    public interface IUnitOfWork
    {
        void Commit();
    }
}
