<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LixFrame.aspx.cs" Inherits="Lixr.Util.editor.tinymce.plugins.validatetext.Editor.LixFrame" %>
<%@ Register TagPrefix="EPiServer" Namespace="EPiServer.Web.WebControls" Assembly="EPiServer.Web.WebControls, Version=8.5.0.0, Culture=neutral, PublicKeyToken=8fe83dea738b45b7" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Validera Text</title>
    <style type="text/css">
        body {
            overflow: auto !important;
        }
         #content {
             font-size: 16px;
             font-family: 'Open Sans', 'HelveticaNeue', 'Helvetica Neue', Helvetica, Arial, sans-serif;
             padding: 20px;
         }
        table {
            width: 99.9%;
            margin-bottom: 20px;
            border-spacing: 0;
            border-collapse: collapse;
        }

        th {
            font-weight: 700;
            text-align: left;
            font-size: 14px !important;
        }

        td {
            border: solid 1px #ccc;
            padding: 5px; 
            font-size: 16px !important;
            font-family: 'Open Sans', 'HelveticaNeue', 'Helvetica Neue', Helvetica, Arial, sans-serif  !important;
        }
    </style>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="../tiny_mce_popup.js"></script>
    <script type="text/javascript">
        tinyMCEPopup.onInit.add(function (ed) {
            var text = ed.selection.getContent();
            if (text.length == 0) {
                text = ed.getContent();
            }
            text = text.replace(/&nbsp;/g, ' ');
            text = text.replace(/<div data-classid\b[^<]*(?:(?!<\/div>)<[^<]*)*<\/div>/gi, '');
            text = text.replace(/<\/p>/gi, '\n');
            text = text.replace(/<h?>/gi, '\n');
            text = text.replace(/<br>/gi, '\n');
            text = text.replace(/<br?>/gi, '\n');
            text = text.replace(/<br??>/gi, '\n');
            text = text.replace(/<\/div>/gi, '\n');
            text = text.replace(/<\/?[^>]+(>|$)/g, '');
            document.getElementById('rawtext').innerText = text;
            RunTest(text);
        });

        function RunTest(text) {
            if (text.length > 0) {
                var handlerPath = '/util/editor/tinymce/plugins/validatetext/handlers/LixrHandler.ashx';
                $.ajax({
                    url: handlerPath,
                    dataType: 'json',
                    type: "POST",
                    data: { text: text },
                    success: function(data) {
                        $('#result').append('<strong>' + data.Index + '.</strong>');
                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert("Läsbarhetsindexet kunde inte hämtas.");
                    }
                });
            }
        }
    </script>
</head>
<body>
    <div id="content">
        <h1><EPiServer:Translate runat="server" Text="/meridium.epcms/lixr/heading" /></h1>
        <p><EPiServer:Translate runat="server" Text="/meridium.epcms/lixr/intro" /></p>
        <h2><EPiServer:Translate runat="server" Text="/meridium.epcms/lixr/subheading" /></h2>
        <p id="result"><EPiServer:Translate runat="server" Text="/meridium.epcms/lixr/result" /></p>
        <p><EPiServer:Translate runat="server" Text="/meridium.epcms/lixr/explanation" /></p>
        <table>
            <tbody>
                <tr>
                    <th><EPiServer:Translate runat="server" Text="/meridium.epcms/lixr/lix" /></th>
                    <th><EPiServer:Translate runat="server" Text="/meridium.epcms/lixr/description" /></th>
                </tr>
                <tr>
                    <td>- 25</td>
                    <td>Barnböcker.</td>
                </tr>
                <tr>
                    <td>25 - 30</td>
                    <td>Enkla texter.</td>
                </tr>
                <tr>
                    <td>30 - 40</td>
                    <td>Normaltext / skönlitteratur.</td>
                </tr>
                <tr>
                    <td>40 - 50</td>
                    <td>Sakinformation, till exempel <a href="http://sv.wikipedia.org/wiki/">Wikipedia</a>.</td>
                </tr>
                <tr>
                    <td>50 - 60</td>
                    <td>Facktexter.</td>
                </tr>
                <tr>
                    <td>över 60</td>
                    <td>Svåra facktexter / forskning / avhandlingar.</td>
                </tr>
            </tbody>
        </table> 
        <h2><EPiServer:Translate runat="server" Text="/meridium.epcms/lixr/ground" /></h2> 
        <p id="rawtext"></p> 
    </div>
</body>
</html>
