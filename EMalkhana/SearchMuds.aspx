<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="SearchMuds.aspx.cs" Inherits="EMalkhana.SearchMuds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- JQUERY JS -->
    <script src="../assets/js/jquery.min.js"></script>

    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap-Date Range Picker js-->
    <script src="assets/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="assets\js\formelementadvnced.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="app-content main-content mt-0">
        <div class="side-app">
            <!-- CONTAINER -->
            <div class="main-container container-fluid">
                <!-- PAGE-HEADER -->
                <div class="page-header">
                    <div>
                        <h1 class="page-title">Search Muds</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">હોમ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Search Muds</li>
                        </ol>
                    </div>
                </div>
                <!-- PAGE-HEADER END -->
                <div class="row">
                    <div class="col-12 col-sm-12">
                        <div class="card product-sales-main">
                            <div class="row">
                                <div class="col-12 col-sm-12">
                                    <div class="card product-sales-main">
                                        <div class="card-header border-bottom">
                                            <div style="width: 90%">
                                                <h3 class="card-title mb-0">Search Muds</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <asp:ListView ID="lstView" runat="server" DataKeyNames="id"
                                                EnableModelValidation="True" OnItemCommand="lstVwAdmin_ItemCommand">
                                                <EditItemTemplate>
                                                </EditItemTemplate>
                                                <EmptyDataTemplate>
                                                    <div>
                                                        મંજૂરી માટે રાહ જોઈ રહ્યું છે.
                                                    </div>
                                                </EmptyDataTemplate>
                                                <InsertItemTemplate>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-muted fs-14 fw-semibold">
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Container.DataItemIndex + 1 %>' /></td>
                                                        <td class="text-muted fs-14 fw-semibold">
                                                            <asp:Label ID="numRoleId" runat="server" Text='<%# Eval("id") %>' /></td>
                                                        <td class="text-muted fs-14 fw-semibold">
                                                            <asp:Label ID="numMudNumber" runat="server" Text='<%# Eval("mudNo") %>' /></td>
                                                        <td class="text-muted fs-14 fw-semibold">
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("firNo") %>' /></td>
                                                        <td class="text-muted fs-14 fw-semibold">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("receiptNo") %>' /></td>
                                                        <td>
                                                            <div class="d-flex align-items-stretch">
                                                                <asp:ImageButton ID="btnEdit" ToolTip="Edit Mud Details" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("MudNo") %>'
                                                                    CommandName="EDITRECORD" ImageUrl="assets/images/action-edit.png" />
                                                                <asp:ImageButton ID="btnView" ToolTip="View Mud Details" Height="25px" Width="25px" runat="server" CommandArgument='<%# Eval("mudNo") %>'
                                                                    CommandName="VIEWRECORD" ImageUrl="assets/images/action_view.png" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <LayoutTemplate>
                                                    <div class="table-responsive">
                                                        <table id="data-table" class="table text-nowrap mb-0 table-bordered">
                                                            <thead class="table-head">
                                                                <tr>
                                                                    <th class="bg-transparent border-bottom-0 wp-15">S. No.</th>
                                                                    <th class="bg-transparent border-bottom-0 wp-15">ID</th>
                                                                    <th class="bg-transparent border-bottom-0">મુદ્દા માલ નંબર</th>
                                                                    <th class="bg-transparent border-bottom-0">કેસ નંબર</th>
                                                                    <th class="bg-transparent border-bottom-0 no-btn">મુદ્દામાલ પાવતી નઁ.</th>
                                                                    <th class="bg-transparent border-bottom-0 no-btn">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="table-body">
                                                                <div runat="server" id="itemPlaceholder">
                                                                </div>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </LayoutTemplate>
                                            </asp:ListView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
</asp:Content>
