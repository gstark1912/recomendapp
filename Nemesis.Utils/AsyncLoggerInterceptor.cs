using Castle.DynamicProxy;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nemesis.Utils
{
    public class AsyncLoggerInterceptor : IAsyncInterceptor
    {
        private readonly ILogger logger;

        public AsyncLoggerInterceptor(ILogger logger)
        {
            this.logger = logger;
        }

        public void InterceptAsynchronous(IInvocation invocation)
        {
            LogMethodInvocationInfo(invocation);

            try
            {
                invocation.Proceed();
                invocation.ReturnValue = InternalInterceptAsynchronous(invocation);
            }

            catch (Exception ex)
            {
                LogError(invocation, ex);
            }
        }

        private void LogError(IInvocation invocation, Exception ex)
        {
            logger.Error(ex, "Error en {0} con argumentos: {1}",
                invocation.Method.Name,
                string.Join(", ", invocation.Arguments.Select(a => (a ?? "").ToString()).ToArray()));
        }

        public void InterceptAsynchronous<TResult>(IInvocation invocation)
        {
            invocation.ReturnValue = InternalInterceptAsynchronous<TResult>(invocation); ;
        }

        public void InterceptSynchronous(IInvocation invocation)
        {
            LogMethodInvocationInfo(invocation);

            try
            {
                invocation.Proceed();
            }

            catch (Exception ex)
            {
                LogError(invocation, ex);
            }
        }

        private async Task InternalInterceptAsynchronous(IInvocation invocation)
        {
            LogMethodInvocationInfo(invocation);

            try
            {

                invocation.Proceed();
                var task = (Task)invocation.ReturnValue;
                await task;
            }

            catch (Exception ex)
            {
                LogError(invocation, ex);
            }


        }

        private void LogMethodInvocationInfo(IInvocation invocation)
        {
            logger.Information("Metodo {0} con parametros {1}...",
                 invocation.Method.Name,
                 string.Join(", ", invocation.Arguments.Select(a => (a ?? "").ToString()).ToArray()));
        }

        private async Task<TResult> InternalInterceptAsynchronous<TResult>(IInvocation invocation)
        {
            LogMethodInvocationInfo(invocation);

            try
            {
                invocation.Proceed();
                var task = (Task<TResult>)invocation.ReturnValue;
                TResult result = await task;
                return result;
            }
            catch (Exception ex)
            {
                LogError(invocation, ex);
            }

            return default(TResult);
        }
    }
}
