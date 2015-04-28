(function () {
    tinymce.create('tinymce.plugins.ValidateTextPlugin', {
        init: function (ed, url) {
            var t = this;
            t.editor = ed;
            ed.addCommand('openValidateTextFrame', function () {
                window.open(url + '/Util/LixFrame.aspx', 'valideratext', 'width=600,height=690,menu=no,resizable=yes,location=no,status=no,scrollbars=yes,menubar=no', true).focus();
            });
            ed.addButton('validatetextbutton', { title: 'Validate Text', image: '/util/editor/tinymce/plugins/validatetext/validatetext.png', cmd: 'openValidateTextFrame' });
        },
        createControl: function (n, cm) {
            return null;
        },
        getInfo: function () {
            return {
                longname: 'validate text plugin',
                author: 'Meridium AB',
                version: "1.0"
            };
        }
    });
    tinymce.PluginManager.add('validatetext', tinymce.plugins.ValidateTextPlugin);
})();