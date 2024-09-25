<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="MudOutOfStation.aspx.cs" Inherits="EMalkhana.MudOutOfStation" %>

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
                        <h1 class="page-title">Mud Out of Station</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">હોમ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Mud Out of Station</li>
                        </ol>
                    </div>
                </div>
                <!-- PAGE-HEADER END -->
                <div class="row">
                    <div class="col-12 col-sm-12">
                        <div class="card product-sales-main">
                            <div class="card-header border-bottom">
                                <span id="spanVehicleData" runat="server" style="display: none;">
                                    <asp:TextBox ID="txtVehicleData" runat="server"></asp:TextBox>
                                </span>
                                <div class="col-md-3">
                                    અહીં પ્રારંભ તારીખ દાખલ કરો:
                                    <asp:TextBox CssClass="form-fieldset" ID="startDate" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    અહીં સમાપ્તિ તારીખ દાખલ કરો:
                                    <asp:TextBox CssClass="form-fieldset" ID="endDate" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <asp:Button CssClass="btn btn-primary" ID="btnSearch" OnClick="btnSearch_Click" runat="server" Text="હવે શોધો" />
								</div>
                                <!-- input-group -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12">
                        <div class="card product-sales-main">
                            <div class="card-header border-bottom">
                                <div style="width: 90%">
                                    <h3 class="card-title mb-0">Mud Out of Station List</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <asp:ListView ID="lstView" runat="server" DataKeyNames="id" DataSourceID="mudMovementView"
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
                                                <asp:Label ID="numRoleId" runat="server" Text='<%# Eval("id") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="numMudNumber" runat="server" Text='<%# Eval("mudNo") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="ToDepartment" runat="server" Text='<%# Eval("name") %>' /></td>
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Status" runat="server" Text='<%# Eval("mdActive").ToString()=="1"?"PENDING":"REJECTED" %>' /></td>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="table-responsive">
                                            <table id="data-table" class="table text-nowrap mb-0 table-bordered">
                                                <thead class="table-head">
                                                    <tr>
                                                        <th class="bg-transparent border-bottom-0 wp-15">ID</th>
                                                        <th class="bg-transparent border-bottom-0">મુદ્દા માલ નંબર</th>
                                                        <th class="bg-transparent border-bottom-0">વિભાગને</th>
                                                        <th class="bg-transparent border-bottom-0 no-btn">Status</th>
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
                    <asp:SqlDataSource ID="mudMovementView" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_mudmovement_out_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" Name="numUserId" SessionField="numUserId" Type="Int32" />
                            <asp:ControlParameter Name="startDate" ControlID="startDate" />
                            <asp:ControlParameter Name="endDate" ControlID="endDate" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
