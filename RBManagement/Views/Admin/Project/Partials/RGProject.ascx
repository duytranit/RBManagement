<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RGProject.ascx.cs" Inherits="RBManagement.Views.Admin.Project.Partials.RGProject" %>

<telerik:RadGrid ID="rgProject" runat="server" EnableLinqExpressions="false" AutoGenerateColumns="false"
    AllowFilteringByColumn="true" AllowPaging="true" AllowSorting="true"
    OnNeedDataSource="rgProject_NeedDataSource"
    OnPageIndexChanged="rgProject_PageIndexChanged"
    OnPageSizeChanged="rgProject_PageSizeChanged"
    OnItemDataBound="rgProject_ItemDataBound"
    OnItemCreated="rgProject_ItemCreated"
    OnDeleteCommand="rgProject_DeleteCommand">
    <HeaderStyle Font-Bold="true" HorizontalAlign="Center" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy dữ liệu phù hợp" DataKeyNames="ID" EditMode="PopUp"
        EditFormSettings-EditColumn-ShowFilterIcon="false" EditFormSettings-EditColumn-ShowSortIcon="true">
        <Columns>
            <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                <ItemStyle HorizontalAlign="Center" Width="70px" />
            </telerik:GridEditCommandColumn>
            <telerik:GridTemplateColumn HeaderText="STT" AllowFiltering="false">
                <ItemTemplate>
                    <asp:Label ID="lblSTT" runat="server"/>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="20px" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn HeaderText="Dự án" DataTextField="Name"
                DataNavigateUrlFields="ID" DataNavigateUrlFormatString="~/Resource/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Loại dự án" DataField="CATName"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Trạng thái" DataField="Status">
                <FilterTemplate>
                    <telerik:RadComboBox ID="cbbSearchStatus" runat="server" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Status").CurrentFilterValue %>'
                        OnClientSelectedIndexChanged="SelectedIndexChanged_Status">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                            <telerik:RadComboBoxItem Text="True" Value="True" />
                            <telerik:RadComboBoxItem Text="False" Value="False" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="SelectedIndexChanged_Status" runat="server">
                        <script type="text/javascript">
                            function SelectedIndexChanged_Status(sender, args) {
                                var tableview = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableview.filter("Status", args.get_item().get_value(), "EqualTo");
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <ItemStyle Width="150px" HorizontalAlign="Center" />
            </telerik:GridBoundColumn>            
            <telerik:GridButtonColumn UniqueName="DeleteColumn" Text="Delete" CommandName="Delete" ConfirmText="Bạn có muốn xóa tài khoản này không?">
                <ItemStyle HorizontalAlign="Center" Width="70px" />
            </telerik:GridButtonColumn>
        </Columns>
        <EditFormSettings UserControlName="~\Partials\Account\Form.ascx" EditFormType="WebUserControl">
            <EditColumn UniqueName="EditCommandColumn1">
            </EditColumn>
        </EditFormSettings>
    </MasterTableView>
</telerik:RadGrid>