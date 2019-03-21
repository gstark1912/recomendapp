using Castle.DynamicProxy;
using Serilog;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Nemesis.Utils
{
    public class LoggerInterceptor : IInterceptor
    {
        IAsyncInterceptor _asyncInterceptor;

        public LoggerInterceptor(IAsyncInterceptor asyncInterceptor)
        {
            _asyncInterceptor = asyncInterceptor;
        }

        public void Intercept(IInvocation invocation)
        {
            _asyncInterceptor.ToInterceptor().Intercept(invocation);
        }
    }
}