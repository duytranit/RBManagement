using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RBManagement.Views.Admin.Project.Partials
{
    public partial class RGProject : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
                this.Load_RGProject_DataSource();
        }

        protected void rgProject_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            this.Load_RGProject_DataSource();
        }

        protected void rgProject_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            this.Load_RGProject_DataSource();
        }

        protected void rgProject_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            this.Load_RGProject_DataSource();
        }

        protected void rgProject_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {

        }

        protected void rgProject_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {

        }

        protected void rgProject_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }
        private void Load_RGProject_DataSource()
        {
            Models.Entities.Project ettProject = new Models.Entities.Project();
            ettProject.Load_AllProject_ToRadGrid(rgProject);
        }
    }
}