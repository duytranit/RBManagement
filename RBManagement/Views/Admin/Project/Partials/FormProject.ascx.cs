using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RBManagement.Views.Admin.Project.Partials
{
    public partial class FormProject : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSubmit_Click(object sender, EventArgs e)
        {
            if (lblID.Text.Equals(""))
                this.CreateStatus();
            else
                this.UpdateStatus();
        }
        private void CreateStatus()
        {
            int categoryID = Convert.ToInt32(cbbCategory.SelectedValue);
            int accountID = Convert.ToInt32(cbbAccount.SelectedValue);
            string name = txtName.Text;
            DateTime createdDate = Convert.ToDateTime(txtDate.Text);
            bool status = (bool)chbStatus.Checked;

            Models.Entities.Project ettProject = new Models.Entities.Project();
            ettProject.Insert(name, createdDate, status, categoryID, accountID);

            Response.Redirect(Request.RawUrl);
        }
        private void UpdateStatus()
        {
            int projectID = Convert.ToInt32(lblID.Text);
            int categoryID = Convert.ToInt32(cbbCategory.SelectedValue);
            int accountID = Convert.ToInt32(cbbAccount.SelectedValue);
            string name = txtName.Text;
            DateTime createdDate = Convert.ToDateTime(txtDate.Text);
            bool status = (bool)chbStatus.Checked;

            Models.Entities.Project ettProject = new Models.Entities.Project();
            ettProject.Update(projectID, name, createdDate, status, categoryID, accountID);

            Response.Redirect(Request.RawUrl);
        }
    }
}