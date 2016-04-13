using System.Web.Mvc;
using Easy.Monitor.Utility;

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

        public ActionResult ServiceStatistics(string serviceName)
        {
            ViewBag.ServiceName = serviceName;
            var result = Application.ApplicationRegistry.ServiceStatMinute.SelectBy(serviceName);
            return View(result);
        }
    }
}