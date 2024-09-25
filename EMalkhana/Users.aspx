<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="EMalkhana.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                        <h1 class="page-title">વપરાશકર્તા</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">હોમ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">વપરાશકર્તા</li>
                        </ol>
                    </div>
                </div>
                <!-- PAGE-HEADER END -->

                <asp:Panel ID="pnlAdmin" runat="server" class="form-horizontal" Visible="false">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h3 class="card-title">અહીં નવો વપરાશકર્તા દાખલ કરો</h3>
                            </div>
                            <div class="card-body">
                                <p class="text-muted"></p>
                                <asp:Label ID="numUniqueID" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                <asp:FormView ID="frmVwAdmin" runat="server" Width="100%" DataKeyNames="id"
                                    DataSourceID="userDetail" OnDataBound="frmVwAdmin_DataBound"
                                    OnItemInserting="frmVwAdmin_ItemInserting"
                                    OnItemUpdating="frmVwAdmin_ItemUpdating" OnPreRender="frmVwAdmin_PreRender">
                                    <EditItemTemplate>
                                        <div class="row col-md-12">
                                            <div class="col-md-6">
                                                <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">નામ</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ValidationGroup="a" CssClass="form-control" ID="txtName" placeholder="નામ દાખલ કરો" type="text" Text='<%# Bind("name") %>' />
                                                        <asp:RequiredFieldValidator ValidationGroup="a" SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="txtNameRequiredField" ErrorMessage="Please enter a Name" ControlToValidate="txtName" ></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                 <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">રોલ આઈડી</label>
                                                    <div class="col-md-9">
                                                       <asp:DropDownList ID="numRoleId" runat="server" AppendDataBoundItems="True" CssClass="form-control form-select" Text='<%# Bind("roleId") %>' DataSourceID="dataRole" DataTextField="Name" DataValueField="Id">
                                                        </asp:DropDownList>
                                                        <asp:SqlDataSource ID="dataRole" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM Role where isActive = 1"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                 <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">સુલભ પોલીસ સ્ટેશનો પસંદ કરો</label>
                                                    <div class="col-md-12">
                                                        <asp:CheckBoxList ID="numDepartmentId" DataTextField="name" DataValueField="id" runat="server" DataSourceID="dataDepartment" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" CssClass="chkChoice" Width="100%">
                                                        </asp:CheckBoxList>
                                                        <asp:SqlDataSource ID="dataDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM department where isPs = 1"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">વપરાશકર્તા નામ</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server"  CssClass="form-control" ID="txtUserName" placeholder="વપરાશકર્તા નામ દાખલ કરો" type="text" Text='<%# Bind("username") %>' />
                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ErrorMessage="વપરાશકર્તા નામ દાખલ કરો" ControlToValidate="txtUserName" ></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                 <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">પાસવર્ડ</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ValidationGroup="a" CssClass="form-control" ID="txtPassword" placeholder="પાસવર્ડ દાખલ કરો" type="text" Text='<%# Bind("password") %>' />
                                                        <asp:RequiredFieldValidator ValidationGroup="a" SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator4" ErrorMessage="Please enter a Password" ControlToValidate="txtPassword" ></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="row col-md-12">
                                            <div class="col-md-6">
                                                <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">નામ</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ValidationGroup="a" CssClass="form-control" ID="txtName" placeholder="નામ દાખલ કરો" type="text" Text='<%# Bind("name") %>' />
                                                        <asp:RequiredFieldValidator ValidationGroup="a" SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="txtNameRequiredField" ErrorMessage="Please enter a Name" ControlToValidate="txtName" ></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                 <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">રોલ આઈડી</label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="numRoleId" runat="server" AppendDataBoundItems="True" CssClass="form-control form-select" Text='<%# Bind("roleId") %>' DataSourceID="dataRole" DataTextField="Name" DataValueField="Id">
                                                        </asp:DropDownList>
                                                        <asp:SqlDataSource ID="dataRole" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM Role where isActive = 1"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                 <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">વિભાગ આઈડી</label>
                                                    <div class="col-md-9">
                                                        <asp:CheckBoxList ID="numDepartmentId" DataTextField="name" DataValueField="id" runat="server" DataSourceID="dataDepartment" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" CssClass="chkChoice" Width="100%">
                                                        </asp:CheckBoxList>
                                                        <asp:SqlDataSource ID="dataDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM department where isPs = 1"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">વપરાશકર્તા નામ</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server"  CssClass="form-control" ID="txtUserName" placeholder="વપરાશકર્તા નામ દાખલ કરો" type="text" Text='<%# Bind("username") %>' />
                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ErrorMessage="વપરાશકર્તા નામ દાખલ કરો" ControlToValidate="txtUserName" ></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                 <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">પાસવર્ડ</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ValidationGroup="a" CssClass="form-control" ID="txtPassword" placeholder="પાસવર્ડ દાખલ કરો" type="text" Text='<%# Bind("password") %>' />
                                                        <asp:RequiredFieldValidator ValidationGroup="a" SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator4" ErrorMessage="Please enter a Password" ControlToValidate="txtPassword" ></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="સબમિટ કરો" OnClick="btnSubmit_Click" ValidationGroup="a" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click"
                                    CausesValidation="False" />

                                <asp:SqlDataSource ID="userDetail" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>"
                                    SelectCommand="sp_users_search" SelectCommandType="StoredProcedure" ProviderName="MySql.Data.MySqlClient">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="numUniqueID" DefaultValue="0"
                                            Name="numId" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <div class="row">
                    <div class="col-12 col-sm-12">
                        <div class="card product-sales-main">
                            <div class="card-header border-bottom">
                                <div style="width: 90%">
                                    <h3 class="card-title mb-0">વપરાશકર્તા યાદી</h3>
                                </div>
                                <div>
                                    <asp:Button runat="server" CssClass="btn btn-primary" Text="નવો વપરાશકર્તા બનાવો" OnClick="btnAddNew_Click"></asp:Button>
                                </div>
                            </div>
                            <div class="card-body">

                                <asp:ListView ID="lstView" runat="server" DataKeyNames="id" DataSourceID="userView"
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
                                                <asp:Label ID="numUserId" runat="server" Text='<%# Eval("id") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="txtName" runat="server" Text='<%# Eval("name") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("rname") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("username") %>' /></td>
                                            <td>
                                                <div class="d-flex align-items-stretch">
                                                    <asp:ImageButton ID="btnEdit" runat="server" CommandArgument='<%# Eval("id") %>'
                                                        CommandName="EDITRECORD" ImageUrl="assets/images/action-edit.png" />
                                                    <asp:ConfirmButtonExtender ID="btnEdit_ConfirmButtonExtender" runat="server" ConfirmText="શું તમે આ રેકોર્ડમાં ફેરફાર કરવા માંગો છો?"
                                                        Enabled="True" TargetControlID="btnEdit"></asp:ConfirmButtonExtender>
                                                    <asp:ImageButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("id") %>'
                                                        CommandName="DELETERECORD" ImageUrl="assets/images/action-remove.png" />
                                                    <asp:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" ConfirmText="શું તમે આ રેકોર્ડ દૂર કરવા માંગો છો?"
                                                        Enabled="True" TargetControlID="btnDelete"></asp:ConfirmButtonExtender>
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
                                                        <th class="bg-transparent border-bottom-0">નામ</th>
                                                        <th class="bg-transparent border-bottom-0">રોલ નામ</th>
                                                        <th class="bg-transparent border-bottom-0">વપરાશકર્તા નામ</th>
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
                    <!-- COL END -->

                    <asp:SqlDataSource ID="userView" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_users_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
