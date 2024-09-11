//Viewport para la pagona principal que contará con la grilla de trabajadores

Ext.define('ExtMVC.view.Viewport', {
    extend: 'Ext.Viewport',    
    layout: 'fit',
    
    requires: [
        'ExtMVC.view.Trabajador.Grid',
        'ExtMVC.view.Trabajador.Formulario'
    ],
    
    initComponent: function() {        
        Ext.apply(this, {
            items: [
                {
                    xtype: 'TrabajadorGrid'
                }
            ]
        });                
        this.callParent(arguments);
    }
});