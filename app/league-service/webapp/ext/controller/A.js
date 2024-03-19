sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        POST: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
