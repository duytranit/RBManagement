using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

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
            Helpers.Telerik hlpTelerik = new Helpers.Telerik();
            hlpTelerik.SetSequenceNumberColumn(rgProject, e, "lblSTT");
        }

        protected void rgProject_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helpers.Telerik hlpTelerik = new Helpers.Telerik();
            hlpTelerik.RadGridFilterTextbox(e, "Name", "Tên dự án");
            hlpTelerik.RadGridFilterTextbox(e, "CATName", "Loại dự án");
            hlpTelerik.RadGridFilterTextbox(e, "ACCUsername", "Người tạo");
            hlpTelerik.RadGridFilterTextbox(e, "CreatedDate", "Ngày tạo");
        }

        protected void rgProject_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            int projectID = (int)(e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ID"];
            Models.Entities.Project ettProject = new Models.Entities.Project();
            ettProject.Delete(projectID);
        }
        private void Load_RGProject_DataSource()
        {
            Models.Entities.Project ettProject = new Models.Entities.Project();
            ettProject.Load_AllProject_ToRadGrid(rgProject);
        }

        protected void rgProject_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                rgProject.MasterTableView.EditFormSettings.CaptionDataField = "Name";
                rgProject.MasterTableView.EditFormSettings.CaptionFormatString = "Cập nhật dự án : {0}";
            }
            else if (e.CommandName == "InitInsert")
            {
                rgProject.MasterTableView.EditFormSettings.CaptionDataField = "";
                rgProject.MasterTableView.EditFormSettings.CaptionFormatString = "Tạo mới dự án";

            }
        }
    }
}