sap.ui.define([
    "sap/ui/model/json/JSONModel"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("leagues.leagueslayout.controller.App", {
            
            onInit: function () {
                var oViewModel= new JSONModel({
                    layout:"OneColumn"
                       
        });      
        
            this.getView().setModel(oViewModel,"MainView");
    
        }

    });

    });
