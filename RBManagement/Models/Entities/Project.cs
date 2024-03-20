using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace RBManagement.Models.Entities
{
    public class Project
    {
        public Project() { }
        public IEnumerable<Models.Project> Projects 
        { 
            get 
            { 
                Models.RBManagementEntities db = new RBManagementEntities();
                return db.Projects;
            }
        }
        public IEnumerable<object> ProjectObjects (IEnumerable<Models.Project> _projects)
        {
            return _projects.AsEnumerable().Select(pr => new
            {
                ID = pr.ID,
                Name = pr.Name,
                Status = pr.Status,
                CATID = pr.CATID,
                CATName = pr.ProjectCategory.Name,
                ACCID = pr.ACCID,
                ACCUsername = pr.Account.Username
            });
        }
        public void Insert (string _name, bool _status, int _categoryID, int _accountID)
        {
            Models.RBManagementEntities db = new RBManagementEntities();
            Models.Project project = new Models.Project();
            project.Name = _name;
            project.Status = _status;
            project.CATID = _categoryID;
            project.ACCID = _accountID;
            db.Projects.Add(project);
            db.SaveChanges();
            db.Dispose();
        }
        public void Update (int _projectID, string _name, bool _status, int _categoryID, int _accountID)
        {
            Models.RBManagementEntities db = new RBManagementEntities();
            Models.Project project = db.Projects.FirstOrDefault(pr => pr.ID == _projectID);
            project.Name = _name;
            project.Status = _status;
            project.CATID = _categoryID;
            project.ACCID = _accountID;
            db.SaveChanges();
            db.Dispose();
        }
        public void Delete (int _projectID)
        {
            Models.RBManagementEntities db = new RBManagementEntities();
            Models.Project project = db.Projects.FirstOrDefault(pr => pr.ID == _projectID);
            db.Projects.Remove(project);
            db.SaveChanges();
            db.Dispose();
        }
        public void Load_AllProject_ToRadGrid(RadGrid _rg)
        {
            _rg.DataSource = this.ProjectObjects(this.Projects).ToList();
        }
    }
}