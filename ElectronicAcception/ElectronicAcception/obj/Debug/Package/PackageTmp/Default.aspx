<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="ElectronicAcception._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="Scripts/jquery-3.2.1.js" type="text/javascript"></script>
    <link href="Styles/font-awesome-base64.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/element.js" type="text/javascript"></script>
<style>
    label{ display:block; padding:6px; }
    label span { display:inline-block; width:90px;}
    input {width:300px;}
    select {width:315px;}
    #wishsList
    {
        list-style:inside none;
    }
    #wishsList li
    {
        border-bottom:2px solid dimgray;
        height:50px;
        overflow:hidden;
        cursor:pointer;
        color:Black;
    }
    #wishsList img
    {
        height:50px;
        width:50px;
        float:left;
    }
    #wishsList h3, #wishsList h4
    {
        padding:0;
        margin:0;
        color:black;
    }
    #wishsList li:hover
    {
        background:lightBlue;
    }
    #wishsList span
    {
        display:none;
    }
    #wishsList .fa-trash
    {
        float:right;
        color:gray;
        position:relative;
        top:-30px;
        right:8px;
        font-weight:100;
        display:none;
    }
     #wishsList li:hover .fa-trash
    {
        display:inline;
    }
    #wishsList li:hover .fa-trash:hover
    {
        color:black;
    }
</style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to Electronic Accept Application
    </h2>
    <p>
        Fill the application bellow by your real information.If any unmutched information your application will rejected.
    </p>
    <table id="mainTable">
      <tr>
        <td valign=top>
            <div class="panel">
                <label><span>Name</span>: <input name="name" required="required" /></label>
                <label><span>Sex</span>: <select name="sex"><option value="Male">Male</option><option value="Female">Female</option></select></label>
                <label><span>Birth Date</span>: <input type="date" required="required" name="date" /></label>
                <label><span>City</span>: 
                    <select name="city"><option value=31>Al Anbar AN</option><option value=51>Babil BB</option><option value=10>Baghdad BG</option><option value=61>Basra BA</option><option value=64>Dhi Qar DQ</option><option value=58>Al-Qādisiyyah QA</option><option value=32>Diyala DI</option><option value=42>Duhok DA</option><option value=44>Erbil AR</option><option value=46>Halabja —</option><option value=56>Karbala KA</option><option value=36>Kirkuk KI</option><option value=62>Maysan MA</option><option value=66>Muthanna MU</option><option value=54>Najaf NA</option><option value=41>Nineveh NI</option><option value=34>Saladin SD</option><option value=46>Sulaymaniyah SU</option><option value=52>Wasit WA</option></select> 
                </label>
                <label><span>Study Type</span>: 
                    <select name="type" id="typeField">
                        <option value=0 >Acadimy</option>
                        <option value=1 >Literary</option>
                        <option value=2 >Scientific</option>
                    </select>
                </label>
                <label><span>School Name</span>: <input name="school" required="required" /></label>
                
                <label><span>Average</span>: <input type=number name="average" id="avgField" required="required"/></label>
                <button onclick="if(chooseDepartment() == 0) {event.preventDefault();Showi(notAcc);}">Apply</button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span id="notAcc" style="display:none; font-size:28px; font-weight:bold;">Not Accepted</span>
            </div>
        </td>
        <td valign=top>
            <div class="panel">
                <label><span>University</span>: <select id="unList" onchange="addDepartments()"></select></label>
                <label><span>Department</span>: <select id="depList"></select></label>
                <button onclick="event.preventDefault(); addWish()">Add Wish</button>
               
                <div style="max-height:200px; overflow:auto; margin-top:8px;">
                      <ul id="wishsList">
                      </ul>
                </div>
                <input type="hidden" name="dept" id="AcceptDept" />
                <input type="hidden" name="accNumber" id="accNumber" />
            </div>
        </td>
      </tr>
    </table>

    <div id="acceptDiv" style="text-align:center;">
    </div>

    <asp:AccessDataSource ID="ADS" runat="server" 
        DataFile="~/App_Data/electronic.accdb" 
        SelectCommand="SELECT * FROM [Universities]"></asp:AccessDataSource>
<script>
  var Uns = <%=getUnversities() %>;
  var Depts = <%=getDepartments() %>;
  var AccNums = <%=getAcceptNumbers() %>;
  //response, accepted
  var AcceptedDept = '<%=Request("dept") %>';
  var AcceptedNumber = '<%=Request("accNumber") %>';
  var s = "";

  if(AcceptedDept.length){
        var u = null, d = null;
        for(var i=0; i<Depts.length; i++)
            if(Depts[i].ID == AcceptedDept){
                d=Depts[i];
                for(var j=0; j<Uns.length; j++)
                    if(d.University == Uns[j].ID){
                        u = Uns[j];
                        break;
                    }
                break;
            }
        if(d && u){
            acceptDiv.innerHTML = '<img src="' + u.Logo + '" />\
                               <h2>' + u.Name + '</h2>\
                               <h2>' + d.Name + '</h2>\
                               <h2>' + AcceptedNumber + '</h2>';
            Hide(mainTable);
            Show(acceptDiv);
        }
        
  }

  //{ ID:0, Name:"", University:0, MaxCapacity:0, MinAvg:0, StudyType:0 }
  for(var i=0; i < Uns.length; i++)
    s += '<option value=' + i + '>' + Uns[i].Name + "</option>";
  unList.innerHTML = s;
  
  s = "";
  for(var i=0; i < Depts.length; i++)
    if(Depts[i].University == Uns[0].ID)
    s += '<option value=' + i + '>' + Depts[i].Name + "</option>";
  depList.innerHTML = s;

  function addDepartments(){
        var ss = "";
        var uId = Uns[unList.value].ID;
        for(var i=0; i < Depts.length; i++)
          if(Depts[i].University == uId)
          ss += '<option value=' + i + '>' + Depts[i].Name + "</option>";
        depList.innerHTML = ss;
  }

  function addWish(){
    var u = Uns[unList.value];
    var d = Depts[depList.value];
    var temp = '<li>';
    temp += '<img src="' + u.Logo + '" />';
    temp += '<div><h3>' + u.Name + '</h3>';
    temp += '<h4>' + d.Name + '</h4>';
    temp += '<a class="fa fa-trash fa-2x" onclick="this.parentNode.parentNode.remove()"></a>';
    temp += '<span class=un>' + unList.value + '</span>';
    temp += '<span class=dep>' + depList.value + '</span>';
    temp += "</div></li>";
    wishsList.innerHTML += temp;
  }

  function chooseDepartment(){
        var avg = avgField.value,
            type = typeField.value,
            accept = 0;
        $("#wishsList li").each(function(){
            var i = $(this).find(".un").text(),
                j = $(this).find(".dep").text(),
                u = Uns[i],
                d = Depts[j];
                if(type >= d.StudyType && avg >= d.MinAvg && d.MaxCapacity > 0){
                    accept = d.ID;
                    return false;
                }
        });

        AcceptDept.value = accept;
        //generate accept numbers
        if(accept > 0){
            var an = 0;
           do{
                an = Math.random() * 999999;
                an = an.toFixed(0);
                an = an.toString();
                while(an.length < 6) an = "0" + an;
            }while(AccNums.indexOf(an) >= 0);
             
            accNumber.value = an;
        }
        return accept;
  }
</script>
    
</asp:Content>
