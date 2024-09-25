<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="RCSearch.aspx.cs" Inherits="EMalkhana.RCSearch" %>

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
                        <h1 class="page-title">આરસી નંબર દ્વારા શોધો</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">હોમ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">આરસી નંબર દ્વારા શોધો</li>
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
                                    અહીં આરસી નંબર દાખલ કરો:
                                    <asp:TextBox CssClass="form-fieldset" ID="rcNum" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="regex" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="rcNum" ErrorMessage="કૃપા કરીને આરસી નંબર દાખલ કરો"></asp:RequiredFieldValidator>
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
                                    <h3 class="card-title mb-0">આરસી નંબર દ્વારા શોધો List</h3>
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
                                                <asp:Label ID="ToDepartment" runat="server" Text='<%# Eval("sendingVia") %>' /></td>
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("sentOn") %>' /></td>
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                               <asp:HyperLink Target="_blank" NavigateUrl='<%# Eval("rcCertPath") %>'
                                                              Text="RC Certificate"
                                                              runat="server"/>         
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                               <asp:HyperLink Target="_blank" NavigateUrl='<%# Eval("transfereeIdPath")%>'
                                                              Text="Transferee ID"
                                                              runat="server"/>         
                                            </td>
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
                                                        <th class="bg-transparent border-bottom-0 wp-15">ID</th>
                                                        <th class="bg-transparent border-bottom-0">મુદ્દા માલ નંબર</th>
                                                        <th class="bg-transparent border-bottom-0">Sent Via</th>
                                                        <th class="bg-transparent border-bottom-0 no-btn">પર મોકલ્યો</th>
                                                        <th class="bg-transparent border-bottom-0 no-btn">RC Certificate</th>
                                                        <th class="bg-transparent border-bottom-0 no-btn">Transferee ID</th>
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
                    <asp:SqlDataSource ID="mudMovementView" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_rcNum_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                        <SelectParameters>
                            <asp:ControlParameter Name="strRcNum" ControlID="rcNum" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
