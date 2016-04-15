using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Easy.Monitor.Model.StatMetaData;

namespace Easy.Monitor.Model.ServiceStatMinute
{
    public interface IServiceStatMinuteRepository
    {
        void Add(ServiceStatMinute[] data);
        IEnumerable<ServiceStatMinute> SelectBy(Query query);
        /// <summary>
        /// 获得当前最大的统计时间
        /// </summary>
        /// <param name="serviceName"></param>
        /// <returns></returns>
        DateTime? FindMaxStatTime(string serviceName);
        void RemoveAll();

        /// <summary>
        /// 查询总条数
        /// </summary>
        /// <param name="serviceName"></param>
        /// <returns></returns>
        int SelectCount(string serviceName);
    }
}
