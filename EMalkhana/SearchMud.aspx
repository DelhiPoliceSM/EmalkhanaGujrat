<%@ Page Title="" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="SearchMud.aspx.cs" Inherits="EMalkhana.SearchMud" %>

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
                        <h1 class="page-title">મુદ્દા માલ શોધો</h1>
                    </div>
                    <div class="ms-auto pageheader-btn">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">હોમ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">મુદ્દા માલ શોધો</li>
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
                                    અહીં મુદ્દા માલ નંબર દાખલ કરો:
                                    <asp:TextBox CssClass="form-fieldset" ID="mudNo" runat="server"></asp:TextBox>
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
                                    <h3 class="card-title mb-0">મુદ્દા માલ યાદી</h3>
                                </div>
                                <div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="card card-body pd-20 pd-md-40 border shadow-none">
                                            <h4 class="card-title">મુદ્દા માલ  વિગતો</h4>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">મુદ્દા માલ નંબર</label>
                                                        <asp:TextBox Enabled="false" ID="txtMudNumber" class="form-control" ValidationGroup="a" type="text" runat="server" placeholder="મુદ્દા માલ નંબર દાખલ કરો"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="regex" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtMudNumber" ErrorMessage="મુદ્દા માલ નંબર દાખલ કરો"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">વર્ષ</label>
                                                        <asp:TextBox Enabled="false" ID="txtMudYear" class="form-control" runat="server" placeholder="મુદ્દા માલ વર્ષ દાખલ કરો"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtMudYear" ErrorMessage="કૃપા કરીને મડ વર્ષ દાખલ કરો"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">FIR/AD/SD  નં</label>
                                                        <asp:TextBox Enabled="false" ID="txtFIRNo" class="form-control" runat="server" placeholder="FIR/AD/SD  નંબર દાખલ કરો"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtFIRNo" ErrorMessage="FIR/AD/SD  નંબર દાખલ કરો"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">પોલીસ સ્ટેશન</label>
                                                        <asp:TextBox Enabled="false" ID="policeStation" class="form-control" runat="server" placeholder="FIR/AD/SD  નંબર દાખલ કરો"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">IO નામ</label>
                                                        <asp:TextBox Enabled="false" ID="txtIOName" class="form-control" runat="server" placeholder="કૃપા કરીને IO નામ દાખલ કરો"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtIOName" ErrorMessage="કૃપા કરીને IO નામ દાખલ કરો"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label class="form-label" for="card-name">મુદ્દા માલનું વર્ણન</label>
                                                    <asp:TextBox Enabled="false" ID="txtDescription" class="form-control" ValidationGroup="a" TextMode="MultiLine" Rows="3" runat="server" placeholder="મુદ્દા માલનું વર્ણન દાખલ કરો"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtDescription" ErrorMessage="મુદ્દા માલનું વર્ણન દાખલ કરો"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">જપ્તી તારીખ</label>
                                                        <asp:TextBox Enabled="false" ID="txtSeizureDate" class="form-control" ValidationGroup="a" runat="server" placeholder="મુદ્દા માલ નંબર દાખલ કરો"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtSeizureDate" ErrorMessage="Please enter a Date"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">મુદ્દામાલનુ સ્થાન</label>
                                                        <asp:TextBox Enabled="false" ID="txtLocationOfMud" class="form-control" runat="server" placeholder="મુદ્દામાલનુ સ્થાન દાખલ કરો"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtLocationOfMud" ErrorMessage="મહેરબાની કરીને સ્થાન દાખલ કરો"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">મુદ્દામાલ પાવતી નઁ.</label>
                                                        <asp:TextBox ID="receiptNo" Enabled="false" class="form-control" runat="server" placeholder="મુદ્દામાલ પાવતી નઁ. દાખલ કરો"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="a" SetFocusOnError="true" ForeColor="Red" ControlToValidate="receiptNo" ErrorMessage="Please Enter મુદ્દામાલ પાવતી નઁ."></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">વિભાગ</label>
                                                        <asp:ListBox SelectionMode="Multiple" ID="sectionList" Enabled="false" DataTextField="name" DataValueField="id" runat="server" DataSourceID="dsSectionList" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" CssClass="chkChoice" Width="100%"></asp:ListBox>
                                                        <asp:SqlDataSource ID="dsSectionList" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>" SelectCommand="SELECT * FROM section WHERE isActive = 1"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">કોર્ટનું નામ</label>
                                                        <asp:TextBox Enabled="false" ID="courtName" class="form-control" runat="server" placeholder="FIR/AD/SD  નંબર દાખલ કરો"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">સ્થિતિ</label>
                                                        <asp:TextBox Enabled="false" ID="status" class="form-control" runat="server" placeholder="FIR/AD/SD  નંબર દાખલ કરો"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">નિકાલ</label>
                                                        <asp:TextBox Enabled="false" ID="disposalName" class="form-control" runat="server" placeholder="FIR/AD/SD  નંબર દાખલ કરો"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">કેસનો નિર્ણય કર્યો</label>
                                                        <asp:CheckBox Enabled="false" ID="caseDecided" runat="server" CssClass="toggle toggle-success" />
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">નિર્ણય તારીખ</label>
                                                        <asp:TextBox Enabled="false" ID="decisionDate" class="form-control" ValidationGroup="a" runat="server" placeholder="મુદ્દા માલ નંબર દાખલ કરો"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">ઓર્ડર તારીખ નાશ</label>
                                                        <asp:TextBox Enabled="false" ID="destroyOrderDate" class="form-control" ValidationGroup="a" runat="server" placeholder="મુદ્દા માલ નંબર દાખલ કરો"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="form-label" for="card-name">તારીખનો નાશ કરો</label>
                                                        <asp:TextBox Enabled="false" ID="dateDestory" class="form-control" ValidationGroup="a" runat="server" placeholder="મુદ્દા માલ નંબર દાખલ કરો"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card card-body pd-20 pd-md-40 border shadow-none">
                                            <div class="row">
                                                <asp:Image runat="server" Height="100%" Width="100%" ID="image_upload_preview" ImageUrl="~/assets/images/no-image.png" AlternateText="No Pic " />
                                            </div>
                                            <div class="clear">
                                                <br />
                                                <br />
                                                <br />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                મુદ્દા માલ વ્યવહારો
                                <asp:ListView ID="lstView" runat="server" DataKeyNames="id"
                                    EnableModelValidation="True">
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
                                                <asp:Label ID="txtName" runat="server" Text='<%# Eval("mudNo") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("year") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("firNo") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("departmentName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("seizeDate") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("ioName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("statusName") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("location") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label17" runat="server" Text='<%# Eval("receiptNo") %>' /></td>
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
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("updator") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("updatedOn") %>' /></td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="table-responsive">
                                            <table id="data-table" class="table text-nowrap mb-0 table-bordered">
                                                <thead class="table-head">
                                                    <tr>
                                                        <th class="bg-transparent border-bottom-0 wp-15">ID</th>
                                                        <th class="bg-transparent border-bottom-0">મુદ્દા માલ નામ</th>
                                                        <th class="bg-transparent border-bottom-0">વર્ષ</th>
                                                        <th class="bg-transparent border-bottom-0">FIR નં</th>
                                                        <th class="bg-transparent border-bottom-0">વિભાગ</th>
                                                        <th class="bg-transparent border-bottom-0">જપ્તી તારીખ</th>
                                                        <th class="bg-transparent border-bottom-0">IO નામ</th>
                                                        <th class="bg-transparent border-bottom-0">સ્થિતિ</th>
                                                        <th class="bg-transparent border-bottom-0">સ્થાન</th>
                                                        <th class="bg-transparent border-bottom-0">રસીદ નં</th>
                                                        <th class="bg-transparent border-bottom-0">કેસનો નિર્ણય કર્યો?</th>
                                                        <th class="bg-transparent border-bottom-0">તારીખ નિર્ણય</th>
                                                        <th class="bg-transparent border-bottom-0">કોર્ટનું નામ</th>
                                                        <th class="bg-transparent border-bottom-0">ડિસ્ટોરીના ઓર્ડરની તારીખ</th>
                                                        <th class="bg-transparent border-bottom-0">નાશ કરવાની તારીખ</th>
                                                        <th class="bg-transparent border-bottom-0">દ્વારા અપડેટ કરવામાં આવ્યું છે</th>
                                                        <th class="bg-transparent border-bottom-0">પર અપડેટ કર્યું</th>
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
                                કોર્ટ/FSL હિલચાલ
                                <asp:ListView ID="courtDetails" runat="server" DataKeyNames="id"
                                    EnableModelValidation="True">
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
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("type") %>' /></td>
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label16" runat="server" Text='<%#  Eval("designationname") + " "+ Eval("sendingVia") + " - " + Eval("buckleNr")%>' /></td>
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("sentOn") %>' /></td>
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("cname") %>' /></td>
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:HyperLink Target="_blank" NavigateUrl='<%# Eval("transfereeIdPath")%>'
                                                    Text="Transferee ID"
                                                    runat="server" />
                                            </td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="numMudNumber" runat="server" Text='<%# Eval("rname") %>' /></td>
                                            <td class="text-muted fs-14 fw-semibold">
                                                <asp:Label ID="Label20" runat="server" Text='<%# Eval("ackNumber") %>' /></td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="table-responsive">
                                            <table id="data-table" class="table text-nowrap mb-0 table-bordered">
                                                <thead class="table-head">
                                                    <tr>
                                                        <th class="bg-transparent border-bottom-0 wp-15">ID</th>
                                                        <th class="bg-transparent border-bottom-0">પ્રકાર</th>
                                                        <th class="bg-transparent border-bottom-0">મારફતે મોકલવામાં આવે છે</th>
                                                        <th class="bg-transparent border-bottom-0">પર મોકલ્યો</th>
                                                        <th class="bg-transparent border-bottom-0">ખાતે મોકલવામાં આવે છે</th>
                                                        <th class="bg-transparent border-bottom-0">ટ્રાન્સફર આઈડી</th>
                                                        <th class="bg-transparent border-bottom-0">દ્વારા શરૂ કરવામાં આવેલ છે</th>
                                                        <th class="bg-transparent border-bottom-0">Acknowdledgement Number</th>
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

                    <asp:SqlDataSource ID="headView" runat="server" ConnectionString="<%$ ConnectionStrings:mysqlConnection %>" SelectCommand="sp_Mud_Search" SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:mysqlConnection.ProviderName %>">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="numId" Type="Int32" />
                            <asp:SessionParameter DefaultValue="0" SessionField="numUserId" Name="numUserId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            selectlistBox();
        });
        function selectlistBox() {
            $('[id*=sectionList]').select2({
                placeholder: "Search a section",
                allowClear: true,
                matcher: matchCustom
            });
        }

        function matchCustom(params, data) {
            // If there are no search terms, return all of the data
            if ($.trim(params.term) === '') {
                return data;
            }

            // Do not display the item if there is no 'text' property
            if (typeof data.text === 'undefined') {
                return null;
            }

            // `params.term` should be the term that is used for searching
            // `data.text` is the text that is displayed for the data object
            console.log(params.term);
            const myArray = params.term.split(" ");
            var counter = 0;
            var modifiedData = $.extend({}, data, true);
            for (const word of myArray) {
                if (data.text.toLowerCase().indexOf(word.toLowerCase()) > -1) {

                }
                else {
                    counter = 1;
                }
            }
            if (counter == 0) {
                return modifiedData;
            }

            // Return `null` if the term should not be displayed
            return null;
        }
    </script>
    </script>
</asp:Content>
