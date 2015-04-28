using System.Web;
using System.Web.Script.Serialization;

namespace Lixr.Util.editor.tinymce.plugins.validatetext.Handlers {
    /// <summary>
    /// 
    /// </summary>
    public class LixrHandler : IHttpHandler {
        /* *******************************************************************
         * Properties
         * *******************************************************************/
        #region public bool IsReusable
        /// <summary>
        /// Gets the IsReusable of the Lixr
        /// </summary>
        /// <value></value>
        public bool IsReusable {
            get {
                return true;
            }
        }
        #endregion
        /* *******************************************************************
         * Methods
         * *******************************************************************/
        #region public void ProcessRequest(HttpContext context)
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context) {
            context.Response.ContentType = "application/json";

            var text = context.Request.Form["text"];
            if(string.IsNullOrEmpty(text))
                return;

            var lixr = new Editor.Lixr(text);
            var serializer = new JavaScriptSerializer();
            var json = serializer.Serialize(lixr);
            context.Response.Write(json);
        }
        #endregion
    }
}