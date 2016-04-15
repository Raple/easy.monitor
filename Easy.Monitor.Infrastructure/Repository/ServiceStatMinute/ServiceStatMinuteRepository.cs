using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Easy.Monitor.Model.ServiceStatMinute;
using Dapper;
using Easy.Domain.RepositoryFramework;

namespace Easy.Monitor.Infrastructure.Repository.ServiceStatMinute
{
    public class ServiceStatMinuteRepository : IServiceStatMinuteRepository,IDao
    {
        public void Add(Model.ServiceStatMinute.ServiceStatMinute[] data)
        {
            using (var conn = Database.OpenMonitorDatabase())
            {
                var  trans = conn.BeginTransaction();
                try
                {

                    string addsql = Sql.Add();
                    conn.Execute(addsql, data, trans);
                    trans.Commit();
                }
                catch
                {
                    trans.Rollback();
                }
            }
        }

        public DateTime? FindMaxStatTime(string serviceName)
        {
            using (var conn = Database.OpenMonitorDatabase())
            {
                string sql = Sql.FindMaxStatTime(serviceName);
                return conn.ExecuteScalar<DateTime?>(sql);
            }
        }

        public void RemoveAll()
        {
            using (var conn = Database.OpenMonitorDatabase())
            {
                string sql = Sql.RemoveAll();
                conn.Execute(sql);
            }
        }

        public IEnumerable<Model.ServiceStatMinute.ServiceStatMinute> SelectBy(Query query)
        {
            using (var conn = Database.OpenMonitorDatabase())
            {
                var sql = Sql.SelectBy(query);

                return conn.Query<Model.ServiceStatMinute.ServiceStatMinute>(sql, query);
            }
        }

        public int SelectCount(string serviceName)
        {
            using (var conn = Database.OpenMonitorDatabase())
            {
                var sql = Sql.SelectCount(serviceName);
                var temp=conn.ExecuteScalar(sql);

                return (temp == null ? 0 : Convert.ToInt32(temp));
            }
        }
    }
}
