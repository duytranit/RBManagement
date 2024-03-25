<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormProject.ascx.cs" Inherits="RBManagement.Views.Admin.Project.Partials.FormProject" %>

<asp:Label ID="lblID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ID") %>' Visible="false" />

<table style="width:100%; margin: 20px;">
    <tr>
        <td>
            Loại dự án:
            <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="cbbCategory"  Display="Dynamic"
                ErrorMessage="(*)" ToolTip="Chọn loại tài khoản" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            <telerik:RadComboBox ID="cbbCategory" runat="server" EmptyMessage="Loại dự án"
                DataSourceID="SqlDataSourceProjectCategory" DataTextField="Name" DataValueField="ID"
                SelectedValue='<%# DataBinder.Eval(Container, "DataItem.CATID") %>'></telerik:RadComboBox>
        </td>
    </tr>
    <tr>
        <td>
            Tài khoản quản lý:
            <asp:RequiredFieldValidator ID="rfvAccount" runat="server" ControlToValidate="cbbAccount" Display="Dynamic"
                ErrorMessage="(*)" ToolTip="Chọn tài khoản quản lý" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            <telerik:RadComboBox ID="cbbAccount" runat="server" EmptyMessage="Chọn tài khoản"
                DataSourceID="SqlDataSourceAccount" DataTextField="Username" DataValueField="ID"
                SelectedValue='<%# DataBinder.Eval(Container, "DataItem.ACCID") %>'></telerik:RadComboBox>
        </td>
    </tr>
    <tr>
        <td>
            Tên dự án:
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Display="Dynamic"
                ErrorMessage="(*)" ToolTip="Nhập tên dự án" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            <telerik:RadTextBox ID="txtName" runat="server" EmptyMessage="Dự án" EmptyMessageStyle-BorderColor="Red"
                Text='<%# DataBinder.Eval(Container, "DataItem.Name") %>'></telerik:RadTextBox>
        </td>
    </tr>
    <tr>
        <td>
            Ngày tạo:
            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" Display="Dynamic"
                ErrorMessage="(*)" ToolTip="Nhập ngày tạo dự án" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvDate" runat="server" ControlToValidate="txtDate" Display="Dynamic" Operator="DataTypeCheck" Type="Date"
                ErrorMessage="(*)" ToolTip="Ngày tao dự án có giá trị không thích hợp" Font-Bold="true" ForeColor="Red"></asp:CompareValidator>
        </td>
        <td>
            <telerik:RadTextBox ID="txtDate" runat="server" EmptyMessage="dd/MM/yyyy" EmptyMessageStyle-BorderColor="Red"
                Text='<%# DataBinder.Eval(Container, "DataItem.CreatedDate") %>'></telerik:RadTextBox>
        </td>
    </tr>
    <tr>
        <td>
            Trạng thái:
        </td>
        <td>
            <telerik:RadCheckBox ID="chbStatus" runat="server" Text="Kích hoạt" Checked='<%# DataBinder.Eval(Container, "DataItem.Status") %>' />
        </td>
    </tr>
</table>

<div style="width: 100%; text-align:center;">
    <telerik:RadButton ID="btSubmit" runat="server" Text="Hoàn tất" OnClick="btSubmit_Click">
        <Icon PrimaryIconCssClass="rbOk" />
    </telerik:RadButton>
</div>

<asp:SqlDataSource runat="server" ID="SqlDataSourceProjectCategory" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [ProjectCategory]" />
<asp:SqlDataSource runat="server" ID="SqlDataSourceAccount" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Account]" />