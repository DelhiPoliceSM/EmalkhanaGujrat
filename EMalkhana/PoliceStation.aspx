<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="PoliceStation.aspx.cs" Inherits="EMalkhana.PoliceStation" %>

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
                        <h1 class="page-title">પોલીસ સ્ટેશન</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">હોમ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">પોલીસ સ્ટેશન</li>
                        </ol>
                    </div>
                </div>
                <!-- PAGE-HEADER END -->

                <asp:Panel ID="pnlAdmin" runat="server" class="form-horizontal" Visible="false">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h3 class="card-title">અહીં નવા પોલીસ સ્ટેશન દાખલ કરો</h3>
                            </div>
                            <div class="card-body">
                                <p class="text-muted"></p>
                                <asp:Label ID="numUniqueID" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                <asp:FormView ID="frmVwAdmin" runat="server" Width="100%" DataKeyNames="id"
                                    DataSourceID="policeStationDetail" OnDataBound="frmVwAdmin_DataBound"
                                    OnItemInserting="frmVwAdmin_ItemInserting"
                                    OnItemUpdating="frmVwAdmin_ItemUpdating">
                                    <EditItemTemplate>
                                        <div class="row col-md-12">
                                            <div class="col-md-4">
                                                <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">પોલીસ સ્ટેશનનું નામ</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ValidationGroup="a" CssClass="form-control" ID="txtName" placeholder="પોલીસ સ્ટેશનનું નામ દાખલ કરો" type="text" Text='<%# Bind("name") %>' />
                                                        <asp:RequiredFieldValidator ValidationGroup="a" SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="txtNameRequiredField" ErrorMessage="Please enter a પોલીસ સ્ટેશનનું નામ" ControlToValidate="txtName" ></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-4">
                                                    <label for="firstName" class="form-label">પોલીસ સ્ટેશન છે?</label>
                                                    <div class="col-md-9">
                                                        <asp:CheckBox runat="server" ID="isPS" placeholder="પોલીસ સ્ટેશન છે?" type="text" Checked='<%# Eval("isPS").ToString() == "1"?true:false%>' />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-4">
                                                    <label for="firstName" class="form-label">ઈ માલખાના પર છે?</label>
                                                    <div class="col-md-9">
                                                        <asp:CheckBox runat="server" ID="isOnEMalkhana" placeholder="ઈ માલખાના પર છે" type="text" Checked='<%# Eval("onEMalkhana").ToString() == "1"?true:false%>' />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="row col-md-12">
                                            <div class="col-md-4">
                                                <div class="mb-4">
                                                    <label for="firstName" class="col-md-3 form-label">પોલીસ સ્ટેશનનું નામ</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ValidationGroup="a" CssClass="form-control" ID="txtName" placeholder="Enter પોલીસ સ્ટેશનનું નામ" type="text" Text='<%# Bind("name") %>' />
                                                        <asp:RequiredFieldValidator ValidationGroup="a" SetFocusOnError="true" Font-Bold="true" ForeColor="Red" runat="server" ID="txtNameRequiredField" ErrorMessage="Please enter a પોલીસ સ્ટેશનનું નામ" ControlToValidate="txtName" ></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-4">
                                                    <label for="firstName" class="form-label">પોલીસ સ્ટેશન છે??</label>
                                                    <div class="col-md-9">
                                                        <asp:CheckBox runat="server" ID="isPS" placeholder="પોલીસ સ્ટેશન છે?" type="text" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-4">
                                                    <label for="firstName" class="form-label">ઈ માલખાના પર છે?</label>
                                                    <div class="col-md-9">
                                                        <asp:CheckBox runat="server" ID="isOnEMalkhana" placeholder="ઈ માલખાના પર છે" type="text"  />
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

                                <asp:SqlDataSource ID="PoliceStationDetail" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>"
                                    SelectCommand="sp_department_search" SelectCommandType="StoredProcedure" ProviderName="MySql.Data.MySqlClient">
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
                                    <h3 class="card-title mb-0">પોલીસ સ્ટેશન યાદી</h3>
                                </div>
                                <div>
                                    <asp:Button runat="server" CssClass="btn btn-primary" Text="નવું પોલીસ સ્ટેશન બનાવવું" OnClick="btnAddNew_Click"></asp:Button>
                                </div>
                            </div>
                            <div class="card-body">

                                <asp:ListView ID="lstView" runat="server" DataKeyNames="id" DataSourceID="policeStationView"
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
                                                <asp:Label ID="numPoliceStationId" runat="server" Text='<%# Eval("id") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="txtName" runat="server" Text='<%# Eval("name") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="isPS" runat="server" Text='<%# Eval("isPS").ToString()=="1"?"True":"False" %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="isOnEmalkhana" runat="server" Text='<%# Eval("onEMalkhana").ToString()=="1"?"True":"False" %>' /></td>
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
                                                        <th class="bg-transparent border-bottom-0">પોલીસ સ્ટેશનનું નામ</th>
                                                        <th class="bg-transparent border-bottom-0">પોલીસ સ્ટેશન છે?</th>
                                                        <th class="bg-transparent border-bottom-0">ઈ માલખાના પર છે</th>
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

                    <asp:SqlDataSource ID="policeStationView" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_department_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
