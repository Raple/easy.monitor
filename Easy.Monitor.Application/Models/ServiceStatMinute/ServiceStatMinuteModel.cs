using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Monitor.Application.Models.ServiceStatMinute
{
    public class ServiceStatMinuteModel
    {
        /// <summary>
        /// 每分钟请求平均响应时间
        /// </summary>
        public double AverageRequestResponseTime;
        /// <summary>
        /// 错误请求次数
        /// </summary>
        public int ErrorResponseFrquency;
        /// <summary>
        /// 请求次数
        /// </summary>
        public int RequestFrequency;
        /// <summary>
        /// 服务名称
        /// </summary>
        public string ServiceName;
        /// <summary>
        /// 每分钟请求数量
        /// </summary>
        public int ResponseFrequency;
        /// <summary>
        /// 请最大响应时间
        /// </summary>
        public int MaxResponseTime;
        /// <summary>
        /// 请求最小响应时间
        /// </summary>
        public int MinResponseTime;
        /// <summary>
        /// 请求平均响应时间
        /// </summary>
        public double AverageResponseTime;
        /// <summary>
        /// 总响应时间
        /// </summary>
        public int TotalResponseTime;
        /// <summary>
        /// 统计时间
        /// </summary>
        public string StatTime;

        /// <summary>
        /// 总数据条数
        /// </summary>
        public int TotalCount;
    }
}
