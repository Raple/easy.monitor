using System.Web.Mvc;
using Easy.Monitor.Utility;
using System.Collections.Generic;

namespace Easy.Monitor.Controllers
{
    [WebAuthorize]
    public class ServiceMiniChartController : BaseController
    {
        public ActionResult Index(string serviceName)
        {
            ViewBag.ServiceName = serviceName;
            return View();
        }


        public JsonResult SelectFrequency(string serviceName)
        {
            var result = Application.ApplicationRegistry.ServiceStatMinute.SelectFrequency(serviceName);
            return Json(result,JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 渲染服务统计数据
        /// </summary>
        /// <param name="serviceName"></param>
        /// <returns></returns>
        public ActionResult ServiceStatistics(string serviceName)
        {
            ViewBag.ServiceName = serviceName;
            ViewBag.Count = Application.ApplicationRegistry.ServiceStatMinute.SelectCount(serviceName); ;
            var result = Application.ApplicationRegistry.ServiceStatMinute.SelectBy(serviceName,1);            
            return View(result);
        }

        /// <summary>
        /// 获取服务统计数据
        /// </summary>
        /// <param name="serviceName"></param>
        /// <returns></returns>
        public JsonResult GetServiceStatistics(string serviceName,int pageIndex)
        {
            var result = Application.ApplicationRegistry.ServiceStatMinute.SelectBy(serviceName,pageIndex);
            return Json(result,JsonRequestBehavior.AllowGet);
        }
    }
}