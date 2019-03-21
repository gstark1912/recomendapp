using System;
using System.Data;
using System.Linq;
using Castle.DynamicProxy;
using Microsoft.EntityFrameworkCore;
using Nemesis.DAL;
using Nemesis.DAL.Common;

namespace Transactions
{
    public class TransactionalInterceptor : IInterceptor
    {
        IAsyncInterceptor _asyncInterceptor;

        private readonly NemesisContext DbContext;

        public TransactionalInterceptor(NemesisContext context)
        {
            _asyncInterceptor = new AsyncTransactionalInterceptor(context);
        }

        public void Intercept(IInvocation invocation)
        {
            _asyncInterceptor.ToInterceptor().Intercept(invocation);
        }
    }
}
