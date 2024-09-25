<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="HeadWise.aspx.cs" Inherits="EMalkhana.HeadWise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- JQUERY JS -->
    <script src="../assets/js/jquery.min.js"></script>

    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <link href="https://atlas.microsoft.com/sdk/javascript/mapcontrol/2/atlas.min.css" rel="stylesheet" />
    <script src="https://atlas.microsoft.com/sdk/javascript/mapcontrol/2/atlas.min.js"></script>
    <link href="css/textbox.css" rel="stylesheet" />
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
                        <h1 class="page-title">Head Wise</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Head Wise</li>
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
                                <asp:DropDownList ID="numHeadId" runat="server" AppendDataBoundItems="True" CssClass="form-control form-select" DataSourceID="dataRole" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="dataRole" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM Head where isActive = 1"></asp:SqlDataSource>
                                
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
                                    <h3 class="card-title mb-0">Head Wise</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                 <asp:ListView ID="lstView" runat="server" DataKeyNames="id" DataSourceID="headView"
                                    EnableModelValidation="True" OnItemCommand="lstVwAdmin_ItemCommand">
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <div>
                                            No record found.
                                        </div>
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="numRoleId" runat="server" Text='<%# Eval("id") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="txtName" runat="server" Text='<%# Eval("mudNo") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("year") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("departmentName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("headName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("seizeDate") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("ioName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("statusName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("location") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("caseDecided").ToString()=="1"?true:false %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("dateDecision") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("courtName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("dateOrderDestroy") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("dateDestroy") %>' /></td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="table-responsive">
                                            <table id="data-table" class="table text-nowrap mb-0 table-bordered">
                                                <thead class="table-head">
                                                    <tr>
                                                        <th class="bg-transparent border-bottom-0 wp-15">ID</th>
                                                        <th class="bg-transparent border-bottom-0">Mud Name</th>
                                                        <th class="bg-transparent border-bottom-0">Year</th>
                                                        <th class="bg-transparent border-bottom-0">Department</th>
                                                        <th class="bg-transparent border-bottom-0">Head</th>
                                                        <th class="bg-transparent border-bottom-0">જપ્તી તારીખ</th>
                                                        <th class="bg-transparent border-bottom-0">IO Name</th>
                                                        <th class="bg-transparent border-bottom-0">Status</th>
                                                        <th class="bg-transparent border-bottom-0">Location</th>
                                                        <th class="bg-transparent border-bottom-0">CaseDecided</th>
                                                        <th class="bg-transparent border-bottom-0">DateDecision</th>
                                                        <th class="bg-transparent border-bottom-0">Court Name</th>
                                                        <th class="bg-transparent border-bottom-0">ડિસ્ટોરીના ઓર્ડરની તારીખ</th>
                                                        <th class="bg-transparent border-bottom-0">નાશ કરવાની તારીખ</th>
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
                    <!-- COL END -->

                    <asp:SqlDataSource ID="headView" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_Mud_Head_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                            <asp:ControlParameter Name="startDate" ControlID="startDate" />
                            <asp:ControlParameter Name="endDate" ControlID="endDate" />
                            <asp:ControlParameter Name="numHeadId" ControlID="numHeadId" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
