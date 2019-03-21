using Castle.DynamicProxy;
using Microsoft.EntityFrameworkCore;
using Nemesis.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Transactions
{
    public class AsyncTransactionalInterceptor : IAsyncInterceptor
    {
        private readonly NemesisContext DbContext;

        public AsyncTransactionalInterceptor(NemesisContext context)
        {
            DbContext = context;
        }


        public void InterceptAsynchronous(IInvocation invocation)
        {
            if (!invocation.MethodInvocationTarget
                     .CustomAttributes
                     .Any(a => a.AttributeType == typeof(TransactionalAttribute)))
            {
                invocation.Proceed();
                return;
            }


            using (var transaction = DbContext.Database.BeginTransaction(IsolationLevel.ReadUncommitted))
            {
                try
                {
                    invocation.Proceed();
                    invocation.ReturnValue = InternalInterceptAsynchronous(invocation);
                    transaction.Commit();

                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                }
                finally
                {
                    transaction.Dispose();
                }
            }



        }

        public void InterceptAsynchronous<TResult>(IInvocation invocation)
        {
            if (!invocation.MethodInvocationTarget
                     .CustomAttributes
                     .Any(a => a.AttributeType == typeof(TransactionalAttribute)))
            {
                invocation.Proceed();
                return;
            }

            invocation.ReturnValue = InternalInterceptAsynchronous<TResult>(invocation); ;
        }

        public void InterceptSynchronous(IInvocation invocation)
        {
            throw new NotImplementedException();
        }

        private async Task InternalInterceptAsynchronous(IInvocation invocation)
        {

            using (var transaction = DbContext.Database.BeginTransaction(IsolationLevel.ReadUncommitted))
            {
                try
                {
                    invocation.Proceed();
                    var task = (Task)invocation.ReturnValue;
                    await task;
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                }
                finally
                {
                    transaction.Dispose();
                }
            }
        }

        private async Task<TResult> InternalInterceptAsynchronous<TResult>(IInvocation invocation)
        {
            using (var transaction = DbContext.Database.BeginTransaction(IsolationLevel.ReadUncommitted))
            {
                try
                {
                    invocation.Proceed();
                    var task = (Task<TResult>)invocation.ReturnValue;
                    await task;
                    transaction.Commit();
                    return task.Result;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                }
                finally
                {
                    transaction.Dispose();
                }
            }

            return default(TResult);
        }
    }
}

