<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>
    Area Chart on a Category Axis Example - HTML5 jQuery Chart Plugin by jqChart
</title>

  

      <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
  
    <!--[if IE]><script lang="javascript" type="text/javascript" src="../../js/excanvas.js"></script><![endif]-->
    
    <script lang="javascript" type="text/javascript">
     
        $(function () {
            var processed_json = new Array();
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Default3.aspx/GetChartData',
                data: '{}',
                dataType: "json",
                success:
                    function (response) {
                        debugger;
                        drawchart(response.d);

                    },

                error: function () {
                    alert("Error loading data! Please try again.");
                }
            });
        })

     
        function drawchart(dataValues) {
            debugger;

            var _chart = new Morris.Bar({
                element: 'myfirstchart',
                data: dataValues,
                xkey: ('Countryname'),
                // xLabelMargin: 10,
              
                ykeys: ['Total', 'count', 'rates'],
                //zkeys:['count'],
                labels: ['Count', 'Total', 'rates'],
                stacked: true
            });


        }
         
          
        
      
    </script>

</head>
<body>
     <form id="form1" runat="server">
   <div id="myfirstchart" style="height: 400px; width:300px;"></div>
    </form>
</body>
</html>
