using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Easy.Domain.Application;
using Easy.Monitor.Application.Models.ServiceStatMinute;
using Easy.Monitor.Model.ServiceStatMinute;

namespace Easy.Monitor.Application.Application.ServiceStatMinute
{
    public class ServiceStatMinuteApplication : BaseApplication
    {
        public void StartStat()
        {
            var serviceNames = Model.RepositoryRegistry.Directory.Select().Select(m => m.Name).ToArray();
            new Model.ServiceStatMinute.StatService().Stat(serviceNames);
        }

        /// <summary>
        /// 统计
        /// </summary>
        /// <param name="serviceName"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<ServiceStatMinuteModel> SelectBy(string serviceName, int pageIndex = 1, int pageSize = 100)
        {           
            var list = Model.RepositoryRegistry.ServiceStatMinute.SelectBy(new Model.ServiceStatMinute.Query()
            {
                ServiceName = serviceName,               
                PageIndex = pageIndex,
                PageSize = pageSize
            });

            return list.Select(m => new ServiceStatMinuteModel()
            {
                AverageRequestResponseTime=m.AverageRequestResponseTime,
                ErrorResponseFrquency=m.ErrorResponseFrquency,
                RequestFrequency = m.RequestFrequency,
                ServiceName = m.ServiceName,
                ResponseFrequency = m.ResponseFrequency,
                MaxResponseTime = m.MaxResponseTime,
                MinResponseTime = m.MinResponseTime,
                AverageResponseTime = m.AverageResponseTime,
                TotalResponseTime = m.TotalResponseTime,               
                StatTime = m.StatTime.ToString("yyyy-MM-dd HH:mm:ss")
            });
        }


        /// <summary>
        /// 图表
        /// </summary>
        /// <param name="serviceName"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IEnumerable<FrequencyData> SelectFrequency(string serviceName, int pageIndex = 1, int pageSize = 100)
        {
            var curentDateTime = DateTime.Now;

            var list = Model.RepositoryRegistry.ServiceStatMinute.SelectBy(new Model.ServiceStatMinute.Query()
            {
                ServiceName = serviceName,
                StatTimeStart = curentDateTime.AddMinutes(-30),
                StatTimeEnd = curentDateTime,
                PageIndex=pageIndex,
                PageSize=pageSize
            });

            list = new StatDataFillService().Fill(curentDateTime, list);
            return list.Select(m => new FrequencyData()
            {
                StatTime = m.StatTime.ToString("yyyy-MM-dd HH:mm:ss"),
                ResponseFrequency = m.ResponseFrequency /60d,
                RequestFrequency = m.RequestFrequency / 60d,
                AverageRequestTime = m.AverageRequestResponseTime,
                AverageResponseTime = m.AverageResponseTime
            });
        }
    }
}
