using System;
using Microsoft.Extensions.Logging;
using Recomendapp.Logging;

namespace Recomendapp
{
    public interface IApplicationLogger : ILogger<ApplicationLogger>
    { }
}
