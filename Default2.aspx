<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <div id="myfirstchart" style="height: 500px; width:300px;"></div>
    </form>
</body>
</html>
<script type="text/javascript">
    var processed_json = new Array();
    $(function () {
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: 'Default2.aspx/GetChartData',
            data: '{}',
            dataType: "json",
            success:
                function (response) {
                    debugger;
                   
                    drawChart(response.d);
                },

            error: function () {
                alert("Error loading data! Please try again.");
            }
        });
    })
  
    function drawChart(resp) {     
        debugger;
        Morris.Donut({
            element: 'myfirstchart',
            data: resp,
            formatter: function (x) { return x + "%"}
        }).on('click', function(i, row){
            console.log(i, row);
        });
            // use returned data to plot the graph
              

       
    }
    </script>
<script>

    
   
</script>
