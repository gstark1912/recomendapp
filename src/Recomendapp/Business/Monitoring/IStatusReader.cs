using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Recomendapp.Business.Monitoring
{
    public interface IStatusReader
    {
        Task<Monitoring> GetStatus();
    }
}
